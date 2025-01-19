using Microsoft.Extensions.Logging;

namespace QuickHRP.Core
{
    public abstract class DisposableObject : IDisposable
    {
        public abstract void Dispose();
    }

    public class DispWrapper<T> : DisposableObject where T : class
    {
        Func<T> _valueMethod;
        Action<T> _onDispose;
        T _value;
        bool _fetched;
        private T GetValue()
        {
            if (_fetched) return _value;
            _fetched = true;
            return _value = _valueMethod?.Invoke();
        }
        public T Value => GetValue();
        public DispWrapper(T value, Action<T> onDispose)
        {
            _value = value;
            _fetched = true;
            _onDispose = onDispose;
        }
        public DispWrapper(Func<T> valueMethod, Action<T> onDispose)
        {
            _valueMethod = valueMethod;
            _onDispose = onDispose;
        }
        public override void Dispose()
        {
            if (_fetched && _onDispose != null)
            {
                _onDispose.Invoke(_value);
            }
            _onDispose = null;
            _valueMethod = null;
            if (_value is IDisposable value)
            {
                value.Dispose();
            }
            _value = null;
        }
    }

    public class EventTimer : DisposableObject
    {
        private string _name;
        private string _action;
        private string _description;
        private System.Diagnostics.Stopwatch _stopWatch;
        private int _threshhold;
        private ILogger _logger;
        private static System.Collections.Concurrent.ConcurrentDictionary<string, double> _totalTimes = new System.Collections.Concurrent.ConcurrentDictionary<string, double>();
        public EventTimer(string name, string action = "took", int thresholdMilliseconds = 0, string description = null, ILogger logger = null)
        {
            _logger = logger;
            _threshhold = thresholdMilliseconds;
            _name = name;
            _description = string.IsNullOrEmpty(description) ? "" : string.Format("({0})", description);
            _action = action;
            _stopWatch = new System.Diagnostics.Stopwatch();
            _stopWatch.Start();
        }

        public override void Dispose()
        {
            _stopWatch.Stop();
            var execTime = _stopWatch.Elapsed.TotalMilliseconds;
            _totalTimes.AddOrUpdate(_name, k => execTime, (k, t) => t + execTime);
            if (_threshhold > 0)
            {
                if (execTime >= _threshhold)
                {
                    if (_logger == null)
                    {
                        System.Diagnostics.Debug.WriteLine("{0} {1} {2} ms, exceding {3} ms threshhold {4}", _name, _action, execTime, _threshhold, _description);
                    }
                    else
                    {
                        _logger.LogWarning("{eventName} {eventAction} {eventExecTime} ms, exceding {eventThreshhold} {eventDescription}", _name, _action, execTime, _threshhold, _description);
                    }
                }
            }
            else if (_logger == null)
            {
                System.Diagnostics.Debug.WriteLine("{0} {1} {2} ms {3}", _name, _action, execTime, _description);
            }
            else
            {
                _logger.LogInformation("{eventName} {eventAction} {eventExecTime} ms {eventDescription}"
                    , _name
                    , _action
                    , execTime
                    , _description);
            }
            _logger = null;
        }
    }

    public class DisposableSemaphoreWrapper : DisposableObject
    {
        private SemaphoreSlim _semaphore;
        //private List<SemaphoreSlim> _dependentSemaphores;
        private bool _lockAcquired;
        //private int _locks;

        private DisposableSemaphoreWrapper(SemaphoreSlim semaphore, bool exclusive = false)
        {
            _semaphore = semaphore;
        }
        //private DisposableSemaphoreWrapper(IEnumerable<SemaphoreSlim> dependentSemaphores)
        //{
        //    _dependentSemaphores = dependentSemaphores.ToNonNullList();
        //    if (_dependentSemaphores.Count == 1)
        //    {
        //        _semaphore = _dependentSemaphores.First();
        //        _dependentSemaphores.Clear();
        //        _dependentSemaphores = null;
        //    }
        //}

        public static async Task<DisposableSemaphoreWrapper> WrapWaitAsync(SemaphoreSlim semaphore, CancellationToken cancellationToken, string debugInfo = null, bool preferFairness = true, ILogger logger = null)
        {
            if (semaphore == null) { return null; }

            using (new EventTimer("semaphore" + semaphore.GetHashCode(), "was blocked for", 500, debugInfo, logger: logger))
            {
                var ret = new DisposableSemaphoreWrapper(semaphore);
                await ret.WaitAsync(cancellationToken, preferFairness);
                return ret;
            }
        }
        //public static async Task<DisposableSemaphoreWrapper> WrapWaitAsync(CancellationToken cancellationToken, params SemaphoreSlim[] dependentSemaphores)
        //{
        //    if (dependentSemaphores == null || !dependentSemaphores.Any()) { return null; }

        //    using (new EventTimer("dependentSemaphores", "were blocked for", 500))
        //    {
        //        var ret = new DisposableSemaphoreWrapper(dependentSemaphores);
        //        await ret.WaitAsync(cancellationToken);
        //        return ret;
        //    }
        //}

        public static DisposableSemaphoreWrapper WrapWait(SemaphoreSlim semaphore, CancellationToken cancellationToken, string debugInfo = null, bool preferFairness = true, ILogger logger = null)
        {
            if (semaphore == null) { return null; }

            using (new EventTimer("semaphore" + semaphore.GetHashCode(), "was blocked for", 500, debugInfo, logger: logger))
            {
                var ret = new DisposableSemaphoreWrapper(semaphore);
                ret.Wait(cancellationToken, preferFairness);
                return ret;
            }
        }
        private static readonly Random RandomNumbers = new Random();
        private async Task WaitAsync(CancellationToken cancellationToken, bool preferFairness)
        {
            if (_semaphore != null)
            {
                try
                {
                    if (preferFairness)
                    {
                        //attempting to randomize the distribution of lock waits by
                        //only allowing a certain amount of time to establish the lock
                        //then trying again - the thought here is that by timing out and retrying,
                        //we have allowed another thread to possibly get in the queue for the lock
                        //using random timeouts to try and minimize the inevitable synchronization that occurs
                        //in the code which would most likely result in the same order of locks being granted
                        var randomTimeout = RandomNumbers.Next(100, 2000);
                        while (!(_lockAcquired = await _semaphore.WaitAsync(randomTimeout, cancellationToken))) { randomTimeout = RandomNumbers.Next(100, 2000); }
                    }
                    else { _lockAcquired = await _semaphore.WaitAsync(-1, cancellationToken); }
                }
                catch { ReleaseAllLocks(); }
            }
            //else if (_dependentSemaphores != null && _dependentSemaphores.Any())
            //{
            //    try
            //    {
            //        while (!_lockAcquired)
            //        {
            //            for (var i = 0; i < _dependentSemaphores.Count - 1; i++)
            //            {
            //                if (!(_lockAcquired = await _dependentSemaphores[i].WaitAsync(100, cancellationToken)))
            //                {
            //                    for (var j = i; j > 0; j--) { _dependentSemaphores[j - 1].Release(); }

            //                    _locks = 0;
            //                    _lockAcquired = false;
            //                    break;
            //                }
            //                else { _locks=i+1; }
            //            }

            //            if (_lockAcquired)
            //            {
            //                _lockAcquired = await _dependentSemaphores.Last().WaitAsync(100, cancellationToken);
            //                for (var i = 0; i < _locks; i++) { _dependentSemaphores[i].Release(); }
            //                _locks = 0;
            //            }
            //        }
            //    }
            //    catch
            //    {
            //        ReleaseAllLocks();
            //    }
            //}
        }

        private void Wait(CancellationToken cancellationToken, bool preferFairness)
        {
            if (_semaphore != null)
            {
                if (preferFairness)
                {
                    //attempting to randomize the distribution of lock waits by
                    //only allowing a certain amount of time to establish the lock
                    //then trying again - the thought here is that by timing out and retrying,
                    //we have allowed another thread to possibly get in the queue for the lock
                    //using random timeouts to try and minimize the inevitable synchronization that occurs
                    //in the code which would most likely result in the same order of locks being granted
                    var randomTimeout = RandomNumbers.Next(100, 2000);
                    while (!(_lockAcquired = _semaphore.Wait(randomTimeout, cancellationToken))) { randomTimeout = RandomNumbers.Next(100, 2000); }
                }
                else { _lockAcquired = _semaphore.Wait(-1, cancellationToken); }
            }
        }

        private void ReleaseAllLocks()
        {
            if (_lockAcquired)
            {
                _lockAcquired = false;
                if (_semaphore != null) { _semaphore.Release(); }

                //if (_dependentSemaphores != null && _dependentSemaphores.Any())
                //{
                //    for (var i = 0; i < _locks; i++) { _dependentSemaphores[i].Release(); }
                //}
            }
        }

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />.</summary>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed.</exception>
        //public void Wait()
        //{
        //    this.Wait(-1, new CancellationToken());
        //}

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />, while observing a <see cref="T:System.Threading.CancellationToken" />.</summary>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> token to observe.</param>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled.</exception>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed.-or-The <see cref="T:System.Threading.CancellationTokenSource" /> that created<paramref name=" cancellationToken" /> has already been disposed.</exception>
        //public void Wait(CancellationToken cancellationToken)
        //{
        //    this.Wait(-1, cancellationToken);
        //}

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a <see cref="T:System.TimeSpan" /> to specify the timeout.</summary>
        ///// <param name="timeout">A <see cref="T:System.TimeSpan" /> that represents the number of milliseconds to wait, or a <see cref="T:System.TimeSpan" /> that represents -1 milliseconds to wait indefinitely.</param>
        ///// <returns>
        ///// <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />; otherwise, <see langword="false" />.</returns>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="timeout" /> is a negative number other than -1 milliseconds, which represents an infinite time-out -or- timeout is greater than <see cref="F:System.Int32.MaxValue" />.</exception>
        ///// <exception cref="T:System.ObjectDisposedException">The semaphoreSlim instance has been disposed<paramref name="." /></exception>
        //public bool Wait(TimeSpan timeout)
        //{
        //    return this.Wait((int)timeout.TotalMilliseconds, new CancellationToken());
        //}

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a <see cref="T:System.TimeSpan" /> that specifies the timeout, while observing a <see cref="T:System.Threading.CancellationToken" />.</summary>
        ///// <param name="timeout">A <see cref="T:System.TimeSpan" /> that represents the number of milliseconds to wait, or a <see cref="T:System.TimeSpan" /> that represents -1 milliseconds to wait indefinitely.</param>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> to observe.</param>
        ///// <returns>
        ///// <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />; otherwise, <see langword="false" />.</returns>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled.</exception>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="timeout" /> is a negative number other than -1 milliseconds, which represents an infinite time-out -or- timeout is greater than <see cref="F:System.Int32.MaxValue" />.</exception>
        ///// <exception cref="T:System.ObjectDisposedException">The semaphoreSlim instance has been disposed<paramref name="." />
        /////   <paramref name="-or-" />
        ///// The <see cref="T:System.Threading.CancellationTokenSource" /> that created <paramref name="cancellationToken" /> has already been disposed.</exception>
        //public bool Wait(TimeSpan timeout, CancellationToken cancellationToken)
        //{
        //    return this.Wait((int)timeout.TotalMilliseconds, cancellationToken);
        //}

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a 32-bit signed integer that specifies the timeout.</summary>
        ///// <param name="millisecondsTimeout">The number of milliseconds to wait, or <see cref="F:System.Threading.Timeout.Infinite" />(-1) to wait indefinitely.</param>
        ///// <returns>
        ///// <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />; otherwise, <see langword="false" />.</returns>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out.</exception>
        //public bool Wait(int millisecondsTimeout)
        //{
        //    return this.Wait(millisecondsTimeout, new CancellationToken());
        //}

        ///// <summary>Blocks the current thread until it can enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a 32-bit signed integer that specifies the timeout, while observing a <see cref="T:System.Threading.CancellationToken" />.</summary>
        ///// <param name="millisecondsTimeout">The number of milliseconds to wait, or <see cref="F:System.Threading.Timeout.Infinite" />(-1) to wait indefinitely.</param>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> to observe.</param>
        ///// <returns>
        ///// <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />; otherwise, <see langword="false" />.</returns>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled.</exception>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out.</exception>
        ///// <exception cref="T:System.ObjectDisposedException">The <see cref="T:System.Threading.SemaphoreSlim" /> instance has been disposed, or the <see cref="T:System.Threading.CancellationTokenSource" /> that created <paramref name="cancellationToken" /> has been disposed.</exception>
        //public bool Wait(int millisecondsTimeout, CancellationToken cancellationToken)
        //{
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />. </summary>
        ///// <returns>A task that will complete when the semaphore has been entered.</returns>
        //public Task WaitAsync()
        //{
        //    return _semaphore.WaitAsync().ContinueWith(t => _waitIsSet = true);
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />, while observing a <see cref="T:System.Threading.CancellationToken" />. </summary>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> token to observe.</param>
        ///// <returns>A task that will complete when the semaphore has been entered. </returns>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed.</exception>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled. </exception>
        //public Task WaitAsync(CancellationToken cancellationToken)
        //{
        //    return _semaphore.WaitAsync(cancellationToken).ContinueWith(t => _waitIsSet = true, cancellationToken);
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a 32-bit signed integer to measure the time interval. </summary>
        ///// <param name="millisecondsTimeout">The number of milliseconds to wait, or <see cref="F:System.Threading.Timeout.Infinite" /> (-1) to wait indefinitely.</param>
        ///// <returns>A task that will complete with a result of <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />, otherwise with a result of <see langword="false" />.</returns>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed.</exception>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out.</exception>
        //public Task<bool> WaitAsync(int millisecondsTimeout)
        //{
        //    return _semaphore.WaitAsync(millisecondsTimeout).ContinueWith(t => _waitIsSet = true);
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a <see cref="T:System.TimeSpan" /> to measure the time interval.</summary>
        ///// <param name="timeout">A <see cref="T:System.TimeSpan" /> that represents the number of milliseconds to wait, or a <see cref="T:System.TimeSpan" /> that represents -1 milliseconds to wait indefinitely.</param>
        ///// <returns>A task that will complete with a result of <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />, otherwise with a result of <see langword="false" />.</returns>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed.</exception>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out -or- timeout is greater than <see cref="F:System.Int32.MaxValue" />.</exception>
        //public Task<bool> WaitAsync(TimeSpan timeout)
        //{
        //    return _semaphore.WaitAsync(timeout).ContinueWith(t => _waitIsSet = true);
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a <see cref="T:System.TimeSpan" /> to measure the time interval, while observing a <see cref="T:System.Threading.CancellationToken" />.</summary>
        ///// <param name="timeout">A <see cref="T:System.TimeSpan" /> that represents the number of milliseconds to wait, or a <see cref="T:System.TimeSpan" /> that represents -1 milliseconds to wait indefinitely.</param>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> token to observe.</param>
        ///// <returns>A task that will complete with a result of <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />, otherwise with a result of <see langword="false" />.</returns>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out-or-timeout is greater than <see cref="F:System.Int32.MaxValue" />.</exception>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled. </exception>
        //public Task<bool> WaitAsync(TimeSpan timeout, CancellationToken cancellationToken)
        //{
        //    return _semaphore.WaitAsync(timeout, cancellationToken).ContinueWith(t => _waitIsSet = true, cancellationToken);
        //}

        ///// <summary>Asynchronously waits to enter the <see cref="T:System.Threading.SemaphoreSlim" />, using a 32-bit signed integer to measure the time interval, while observing a <see cref="T:System.Threading.CancellationToken" />. </summary>
        ///// <param name="millisecondsTimeout">The number of milliseconds to wait, or <see cref="F:System.Threading.Timeout.Infinite" /> (-1) to wait indefinitely.</param>
        ///// <param name="cancellationToken">The <see cref="T:System.Threading.CancellationToken" /> to observe.</param>
        ///// <returns>A task that will complete with a result of <see langword="true" /> if the current thread successfully entered the <see cref="T:System.Threading.SemaphoreSlim" />, otherwise with a result of <see langword="false" />. </returns>
        ///// <exception cref="T:System.ArgumentOutOfRangeException">
        ///// <paramref name="millisecondsTimeout" /> is a negative number other than -1, which represents an infinite time-out. </exception>
        ///// <exception cref="T:System.ObjectDisposedException">The current instance has already been disposed. </exception>
        ///// <exception cref="T:System.OperationCanceledException">
        ///// <paramref name="cancellationToken" /> was canceled. </exception>
        //public Task<bool> WaitAsync(int millisecondsTimeout, CancellationToken cancellationToken)
        //{
        //    return _semaphore.WaitAsync(millisecondsTimeout, cancellationToken).ContinueWith(t => _waitIsSet = true, cancellationToken);
        //}
        public override void Dispose()
        {
            ReleaseAllLocks();
            _semaphore = null;
            //if (_dependentSemaphores != null)
            //{
            //    _dependentSemaphores.Clear();
            //    _dependentSemaphores = null;
            //}
        }
    }

}
