using System.Collections.Concurrent;
using System.Runtime.Caching;

namespace QuickHRP.Core.Caching
{
    /// <summary>
    /// Simple thread safe caching container that supports PASSIVE
    /// expiration of items - that is, it will NOT evict expired items
    /// until the cache is disposed or a Get operation takes place
    /// </summary>
    public class SimpleCache : IDisposable
    {
        public SimpleCache() { }

        private Action<string, object, CacheEntryRemovedReason> _cleanupCallback;

        public SimpleCache(Action<string, object, CacheEntryRemovedReason> cleanupCallback)
        {
            _cleanupCallback = cleanupCallback;
        }

        private class ExpiryCacheItem
        {
            private readonly SemaphoreSlim _resolveSemaphoreSlim = new SemaphoreSlim(1, 1);
            public ExpiryCacheItem(string key, Func<string, object> factory, int? lifeSpanInSeconds, bool setExpirationAfterResolved = true)
            {
                Key = key;
                _lifeSpanInSeconds = lifeSpanInSeconds;
                _factory = factory;
                if (!setExpirationAfterResolved) { setExpiration(); }
            }
            private int? _lifeSpanInSeconds;
            public readonly string Key;
            public DateTime? Expiration;
            private Func<string, object> _factory;
            private object _value;
            private Exception _valueException;
            private void setExpiration()
            {
                Expiration = _lifeSpanInSeconds.HasValue && _lifeSpanInSeconds.Value > 0 ? DateTime.Now.AddSeconds(_lifeSpanInSeconds.Value) : (DateTime?)null;
            }
            public bool IsExpired(DateTime? now)
            {
                now = now ?? DateTime.Now;
                return Expiration.HasValue && Expiration < now;
            }
            public object Value
            {
                get
                {
                    if (_factory == null)
                    {
                        if (_valueException != null) { throw _valueException; }
                        return _value;
                    }
                    using (_resolveSemaphoreSlim.UseSemaphore($"Resolving cached item {Key}"))
                    {
                        if (_factory == null)
                        {
                            //always retest entrance criteria when entering a semaphore
                            if (_valueException != null) { throw _valueException; }
                            return _value;
                        }
                        try
                        {
                            _value = _factory(Key);
                            if (!Expiration.HasValue) { setExpiration(); }
                            _factory = null;
                        }
                        catch (Exception ex)
                        {
                            _valueException = ex;
                            _factory = null;
                            throw;
                        }
                    }
                    return _value;
                }
                set
                {
                    _factory = null;
                    _value = value;
                }
            }
            public int? ExtendLifeSpanOnAccessSeconds;
        }

        private bool _disposed;
        private readonly SemaphoreSlim _flushSemaphoreSlim = new SemaphoreSlim(1, 1);
        private readonly ConcurrentDictionary<string, ExpiryCacheItem> _items = new ConcurrentDictionary<string, ExpiryCacheItem>(StringComparer.InvariantCultureIgnoreCase);

        public T Get<T>(string key, Func<string, T> factory = null, int? lifeSpanInSeconds = null, int? extendLifeSpanSecondsIfAccessedSeconds = null)
        {
            FlushExpired();

            if (factory == null) { return GetIfAlreadyExists<T>(key); }

            var item = InternalGet(key);

            if (item != null)
            {
                try
                {
                    var ret = (T)item.Value;
                    if (!(ret is Task)) { return ret; }
                    //Dont allow the caching of a faulted task 
                    //for tasks, the exception won't manifest until the result is resolved/awaited
                    //so we need to manually check for a fault here, and if there is one, remove the task
                    //from the cache - note that this could still result in a cached task that will
                    //ultimately fault being served up to more than one reqeustor
                    //if the cached task was requested and handed out multiple times before it resolved to
                    //a failure, but once it faults, it will no longer be handed out
                    var t = ret as Task;
                    if (t.Exception == null) { return ret; }
                    InternalRemove(item.Key, CacheEntryRemovedReason.Evicted);
                }
                catch
                {
                    InternalRemove(item.Key, CacheEntryRemovedReason.Evicted);
                    throw;
                }
            }

            item = new ExpiryCacheItem(key, k => factory(k), lifeSpanInSeconds) { ExtendLifeSpanOnAccessSeconds = extendLifeSpanSecondsIfAccessedSeconds };
            _items.TryAdd(key, item);

            return (T)item.Value;

        }

#if false
        //REVISIT upon further reflection - this is not the correct blocking - the blocking and resolution shoul be in the fetch of the value from the item AFTER it has been added to the collection (see Get())
        public async Task<T> GetAsync<T>(string key, Func<string, Task<T>> factory = null, int? lifeSpanInSeconds = null, int? extendLifeSpanSecondsIfAccessedSeconds = null)
        {
            using (await _flushSemaphoreSlim.UseSemaphoreAsync())
            {
                FlushExpiredAsync();

                if (factory == null) { return GetIfAlreadyExists<T>(key); }

                var item = InternalGet(key);

                if (item != null) { return (T)item.Value; }

                var value = await factory(key);

                item = new ExpiryCacheItem(key, k => value, lifeSpanInSeconds) { ExtendLifeSpanOnAccessSeconds = extendLifeSpanSecondsIfAccessedSeconds };

                _items.TryAdd(key, item);

                return value;
            }
        }
        private void FlushExpiredAsync()
        {
            if (_disposed) { return; }
            Flush();
        }
#endif

        public void FlushExpired()
        {
            if (_disposed) { return; }
            using (_flushSemaphoreSlim.UseSemaphore())
            {
                if (_disposed) { return; }

                Flush();
            }
        }

        private void Flush()
        {
            var now = DateTime.Now;
            _items.Values.Where(v => v.IsExpired(now)).ForEachPerformAction(v => InternalRemove(v.Key, CacheEntryRemovedReason.Expired));
        }

        private void InternalRemove(string key, CacheEntryRemovedReason reason)
        {
            if (_items.TryRemove(key, out var item))
            {
                _cleanupCallback?.Invoke(key, item?.Value, reason);
            }
        }

        private ExpiryCacheItem InternalGet(string key, bool ignoreExpiration = false)
        {
            var now = DateTime.Now;
            if (_items.TryGetValue(key, out var item))
            {
                if (ignoreExpiration) { return item; }
                if (item == null || (item.Expiration.HasValue && item.Expiration < now))
                {
                    InternalRemove(key, CacheEntryRemovedReason.Expired);
                }
                else
                {
                    if (item.Expiration.HasValue && item.ExtendLifeSpanOnAccessSeconds.HasValue && item.ExtendLifeSpanOnAccessSeconds.Value > 0 && item.Expiration.Value.AddSeconds(-item.ExtendLifeSpanOnAccessSeconds.Value) < now) { item.Expiration = DateTime.Now.AddSeconds(item.ExtendLifeSpanOnAccessSeconds.Value); }
                    return item;
                }
            }
            return null;
        }
        public T GetIfAlreadyExists<T>(string key)
        {
            var item = InternalGet(key);
            return (T)item?.Value;
        }
        public T UpdateIfAlreadyExists<T>(string key, Action<string, T> updateCallback)
        {
            var item = InternalGet(key, true);
            if ((T)item?.Value != null) { updateCallback?.Invoke(key, (T)item?.Value); }
            return (T)item?.Value;
        }

        public void Remove(string key)
        {
            InternalRemove(key, CacheEntryRemovedReason.Removed);
        }
        public void RemoveAll(Func<string, bool> predicate)
        {
            _items.Where(kv => predicate(kv.Key)).ForEachPerformAction(kv => InternalRemove(kv.Key, CacheEntryRemovedReason.Removed));
        }

        public void Dispose()
        {
            if (!_disposed)
            {
                _disposed = true;
                _items.ForEachPerformAction(kv => InternalRemove(kv.Key, CacheEntryRemovedReason.Evicted));
                _items.Clear();
                _flushSemaphoreSlim?.Dispose();
                _cleanupCallback = null;
            }
        }
    }

    /// <summary>
    /// cache that you can implement for simple item factory type work
    /// </summary>
    /// <typeparam name="TInputs"></typeparam>
    /// <typeparam name="TItem"></typeparam>
    public class SimpleResolver<TInputs, TItem>
    {
        private SimpleCache _cache = new SimpleCache();
        private Func<TInputs, string> _keyFactory;
        private Func<TInputs, TItem> _factory;
        protected SimpleResolver() { _keyFactory = i => i.GetHashCode().ToString(); }
        public SimpleResolver(Func<TInputs, TItem> factory, Func<TInputs, string> keyFactory)
        {
            _keyFactory = keyFactory ?? (i => i.GetHashCode().ToString());
            _factory = factory;
        }
        public SimpleResolver(Func<TInputs, TItem> factory) : this(factory, null) { }
        protected virtual string KeyFactory(TInputs inputs) { return _keyFactory(inputs); }
        protected virtual TItem Factory(TInputs inputs) { return _factory(inputs); }
        protected virtual Task<TItem> FactoryAsync(TInputs inputs) { return Task.FromResult(_factory(inputs)); }

        public TItem Resolve(TInputs inputs)
        {
            var key = KeyFactory(inputs);
            return _cache.Get(key, k => Factory(inputs));
        }
        public async Task<TItem> ResolveAsync(TInputs inputs)
        {
            var key = KeyFactory(inputs);
            return await _cache.Get(key, k => FactoryAsync(inputs));
        }
    }
}
