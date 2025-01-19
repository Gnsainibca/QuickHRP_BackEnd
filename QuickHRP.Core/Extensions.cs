using System.Globalization;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Serialization;

namespace QuickHRP.Core
{
    public static class Extensions
    {
        private static readonly Regex MaskRegex = new Regex("[^-]");
        private static string[] _numbers = { "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
        private static string[] _tens = { "", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };
        private static string[] _groups = { "", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion", "octillion", "nonillion", "decillion" };

        private const string REGEX_FOR_CONTROL_AND_NONPRINTABLES_EXCEPT_CRLFTAB = @"[\p{C}-[\r\n\t]]+";
        private const string REGEX_FOR_CONTROL_AND_NONPRINTABLES_EXCEPT_CRLF = @"[\p{C}-[\r\n]]+";
        /// <summary>
        /// Returns the provided text with all control and non-printable characters (except carriage returns and optionally tabs) replaced with the specified text (by default empty string)
        /// </summary>
        public static string RemoveControlAndNonPrintables(this string text, bool allowTabs = false, string replaceWith = "", bool trimText = true)
        {
            if (string.IsNullOrEmpty(text)) { return text; }
            var ret = Regex.Replace(text, allowTabs ? REGEX_FOR_CONTROL_AND_NONPRINTABLES_EXCEPT_CRLFTAB : REGEX_FOR_CONTROL_AND_NONPRINTABLES_EXCEPT_CRLF, replaceWith);
            if (trimText && !string.IsNullOrEmpty(ret)) { ret = ret.Trim(' '); }
            return ret;
        }

        private static string ConvertGroup(string groupName, long amount)
        {
            var groupValue = amount % 1000;
            if (groupValue == 0) { return string.Empty; }
            var hundredsDigit = groupValue / 100;
            var tens = groupValue - (100 * hundredsDigit);
            var tensDigit = tens / 10;
            var ones = groupValue - (100 * hundredsDigit + 10 * tensDigit);
            var parts = new List<string>();

            if (hundredsDigit > 0) { parts.Add($"{_numbers[hundredsDigit]} hundred"); }

            if (tens > 0)
            {
                if (tens < 20) { parts.Add($"{_numbers[tens]}"); }
                else { parts.Add($"{_tens[tensDigit]}{(ones > 0 ? $" {_numbers[ones]}" : "")}"); }
            }
            else if (ones > 0)
            {
                parts.Add($"{_numbers[ones]}");
            }

            if (parts.Count > 0 && !string.IsNullOrEmpty(groupName)) { parts.Add(groupName); }

            return string.Join(" ", parts);
        }

        /// <summary>
        /// Returns the the word representation of the specified decimal value.  For example decimal 1012.23 would return "one thousand twelve and 23/100"
        /// NOTE: negative numbers are treated like positive numbers and decimal precision is locked at 2 decimal places
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentOutOfRangeException"></exception>
        public static string ToWords(this decimal value)
        {
            value = Math.Abs(value);
            var remainingAmount = (long)Math.Truncate(value);
            var change = (int)((value - remainingAmount) * 100);
            var parts = new List<string>() { $"and {change.ToString("D2")}/100" };

            if (remainingAmount == 0) { parts.Insert(0, "zero"); }

            var groupPos = 0;

            while (remainingAmount > 0)
            {
                if (groupPos >= _groups.Length) { throw new ArgumentOutOfRangeException("value"); }
                parts.Insert(0, ConvertGroup(_groups[groupPos++], remainingAmount));
                remainingAmount = remainingAmount / 1000;
            }

            return $"{string.Join(" ", parts.Where(s => !string.IsNullOrEmpty(s)))}";
        }

        private static readonly TaskFactory _myTaskFactory = new
            TaskFactory(CancellationToken.None,
              TaskCreationOptions.None,
              TaskContinuationOptions.None,
              TaskScheduler.Default);

        public static TResult RunSync<TResult>(Func<Task<TResult>> func)
        {
            return _myTaskFactory
              .StartNew<Task<TResult>>(func)
              .Unwrap<TResult>()
              .GetAwaiter()
              .GetResult();
        }

        public static void RunSync(Func<Task> func)
        {
            _myTaskFactory
              .StartNew<Task>(func)
              .Unwrap()
              .GetAwaiter()
              .GetResult();
        }

        public static string ToSentenceCase(this string s, bool leaveFirstCharCaseAlone = false)
        {
            if (string.IsNullOrEmpty(s)) { return s; }

            if (leaveFirstCharCaseAlone) { return (string.IsNullOrWhiteSpace(s) || s.Length < 1) ? s : s.Substring(0, 1) + s.Substring(1).ToLowerInvariant(); }

            return (string.IsNullOrWhiteSpace(s) || s.Length < 1) ? s : s.Substring(0, 1).ToUpperInvariant() + s.Substring(1).ToLowerInvariant();
        }

        public static T NullableCacheGet<T>(this Caching.SimpleCache cache, string key, Func<string, T> factory = null, int? lifeSpanInSeconds = null, int? extendLifeSpanSecondsIfAccessedSeconds = null)
        {
            if (cache == null) { return factory(key); }
            Func<string, T> f = k =>
            {
                //using (new EventTimer($"ResolveCachedItem:{key}"))
                //{
                return factory(k);
                //}
            };
            return cache.Get(key, f, lifeSpanInSeconds, extendLifeSpanSecondsIfAccessedSeconds);
        }

        /// <summary>
        /// return a new dictionary containing the existingEntries and newEntries, overwriting the values
        /// of the existing entries if key already exists
        /// </summary>
        /// <typeparam name="TKey"></typeparam>
        /// <typeparam name="TValue"></typeparam>
        /// <param name="existingEntries"></param>
        /// <param name="newEntries"></param>
        /// <returns></returns>
        public static Dictionary<TKey, TValue> Merge<TKey, TValue>(this IEnumerable<KeyValuePair<TKey, TValue>> existingEntries, IEnumerable<KeyValuePair<TKey, TValue>> newEntries)
        {
            var ret = new Dictionary<TKey, TValue>();
            if (existingEntries != null) { foreach (var kv in existingEntries) { ret.Add(kv.Key, kv.Value); } }
            foreach (var kv in newEntries) { ret[kv.Key] = kv.Value; }
            return ret;
        }

        /// <summary>
        /// returns a human readable string representation of the type passed in
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public static string PrettyName(this Type t)
        {
            if (t.IsArray)
            {
                return $"{PrettyName(t.GetElementType())}[]";
            }

            if (t.IsGenericType)
            {
                var n = t.Name.Substring(0, t.Name.LastIndexOf("`", StringComparison.InvariantCulture));
                if (n == "Nullable") { return $"{string.Join(", ", t.GetGenericArguments().Select(PrettyName))}?"; }
                return string.Format("{0}<{1}>", n, string.Join(", ", t.GetGenericArguments().Select(PrettyName)));
            }

            return t.Name;
        }

        public static IEnumerable<T> Randomize<T>(this IEnumerable<T> items) => items.OrderBy(e => Guid.NewGuid());

        public static IOrderedEnumerable<TSource> SortBy<TSource, TKey>(this IEnumerable<TSource> source, Func<TSource, TKey> keySelector, bool descending = false)
        {
            if (keySelector == null) { return source.OrderBy(k => 0); }
            if (descending) { return source.OrderByDescending(keySelector); }
            return source.OrderBy(keySelector);
        }
        public static IOrderedEnumerable<TSource> SortBy<TSource, TKey>(this IOrderedEnumerable<TSource> source, Func<TSource, TKey> keySelector, bool descending = false)
        {
            if (keySelector == null) { return source.OrderBy(k => 0); }
            if (descending) { return source.ThenByDescending(keySelector); }
            return source.ThenBy(keySelector);
        }
        
        /// <summary>
        /// Returns true if string a matches any of the strings in b using a case insensitive string comparison
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static bool Equivalent(this string a, params string[] b)
        {
            return (a != null && b != null) && b.Any(bb => string.Equals(a, bb, StringComparison.InvariantCultureIgnoreCase));
        }

        /// <summary>
        /// Returns true if value a matches any item in the comparisonSet
        /// </summary>
        public static bool IsIn<T>(this T value, params T[] comparisonSet) //where T : IEquatable
        {
            return (value != null && comparisonSet != null) && comparisonSet.Any(v => value.Equals(v));
        }

        public static string Quote(this string a, char quoteChar = '"')
        {
            return quoteChar + a + quoteChar;
        }

        /// <summary>
        /// Performs specified action (endidx-startIdx)+1 times
        /// </summary>
        /// <typeparam name="TReturn"></typeparam>
        /// <param name="ret"></param>
        /// <param name="startIdx"></param>
        /// <param name="endIdx"></param>
        /// <param name="action"></param>
        /// <returns></returns>
        public static TReturn Repeat<TReturn>(this TReturn ret, int startIdx, int endIdx, Action<int, TReturn> action)
        {
            for (var i = startIdx; i <= endIdx; i++) { action(i, ret); }
            return ret;
        }

        /// <summary>
        /// Performs specified action count times, passing in a 1 based index to the action to indicate which iteration it is
        /// </summary>
        /// <typeparam name="TReturn"></typeparam>
        /// <param name="ret"></param>
        /// <param name="count"></param>
        /// <param name="action"></param>
        /// <returns></returns>
        public static TReturn Repeat<TReturn>(this TReturn ret, int count, Action<int, TReturn> action)
        {
            return Repeat(ret, 1, count, action);
        }

        public static TReturn RepeatForEach<TReturn, TItem>(this TReturn ret, IEnumerable<TItem> items, Action<TItem, TReturn> action)
        {
            if (items == null) { return ret; }
            foreach (var item in items) { action(item, ret); }
            return ret;
        }

        /// <summary>
        /// Performs specified action count times
        /// </summary>
        /// <typeparam name="TReturn"></typeparam>
        /// <param name="ret"></param>
        /// <param name="count"></param>
        /// <param name="action"></param>
        /// <returns></returns>
        public static TReturn Repeat<TReturn>(this TReturn ret, int count, Action<TReturn> action)
        {
            for (var i = 1; i <= count; i++) { action(ret); }
            return ret;
        }

        public static string FriendlyTypeName(this Type type)
        {
            var genericArguments = type.GenericTypeArguments.Any() ? $"{string.Join(", ", type.GenericTypeArguments.Where(tp => tp != type).Select(tp => tp.FriendlyTypeName()))}" : null;
            var name = type.Name.Split('`').FirstOrDefault() ?? "";

            if (name.StartsWith("Nullable"))
            {
                return string.IsNullOrEmpty(genericArguments) ? name : $"{genericArguments}?";
            }
            else
            {
                return string.IsNullOrEmpty(genericArguments) ? name : $"{name}<{genericArguments}>";
            }
        }

        public static List<int> ToBitFlags(this int flags, int maxBits = 31)
        {
            var ret = new List<int>();
            int flag = 1;
            for (var exp = 0; exp < maxBits; exp++)
            {
                if (flags == 0) { break; }
                if ((flags & flag) == flag)
                {
                    ret.Add(flag);
                    flags ^= flag;
                }
                flag <<= 1;
            }
            return ret;
        }
        public static List<int> ToBitFlags(this IConvertible flags, int maxBits = 31)
        {
            return ToBitFlags(flags.ToInt32(CultureInfo.InvariantCulture), maxBits);
        }

        public static DateTime NormalizedDate(this DateTime date)
        {
            return new DateTime(date.Year, date.Month, date.Day, 0, 0, 0, DateTimeKind.Unspecified).Date;
        }
        public static DateTime? NormalizedDate(this DateTime? date)
        {
            return date?.NormalizedDate();
        }

        /// <summary>
        /// this is just a helper wrapper method and is equivalent to task.ConfigureAwait(false)
        /// its purpose is simply to help with readability of code so the casual viewer
        /// can immediately grasp the implications
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public static ConfiguredTaskAwaitable AllowContinuationToRunOnDifferentThread(this Task task)
        {
            return task.ConfigureAwait(false);
        }

        /// <summary>
        /// this is just a helper wrapper method and is equivalent to task.ConfigureAwait(true)
        /// its purpose is simply to help with readability of code so the casual viewer
        /// can immediately grasp the implications
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public static ConfiguredTaskAwaitable ForceContinuationToRunOnSameThread(this Task task)
        {
            return task.ConfigureAwait(true);
        }

        /// <summary>
        /// this is just a helper wrapper method and is equivalent to task.ConfigureAwait(false)
        /// its purpose is simply to help with readability of code so the casual viewer
        /// can immediately grasp the implications
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public static ConfiguredTaskAwaitable<TResult> AllowContinuationToRunOnDifferentThread<TResult>(this Task<TResult> task)
        {
            return task.ConfigureAwait(false);
        }

        /// <summary>
        /// this is just a helper wrapper method and is equivalent to task.ConfigureAwait(true)
        /// its purpose is simply to help with readability of code so the casual viewer
        /// can immediately grasp the implications
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public static ConfiguredTaskAwaitable<TResult> ForceContinuationToRunOnSameThread<TResult>(this Task<TResult> task)
        {
            return task.ConfigureAwait(true);
        }

        public static bool IsAvailable(this SemaphoreSlim semaphore)
        {
            return semaphore != null && semaphore.CurrentCount > 0;
        }

        public static DisposableSemaphoreWrapper UseSemaphore(this SemaphoreSlim semaphore, string debugInfo = null, bool preferFairness = true)
        {
            return DisposableSemaphoreWrapper.WrapWait(semaphore, CancellationToken.None, debugInfo, preferFairness);
        }

        private static string _invalidFileNameCharsRegStr;
        private static string InvalidFileNameCharsRegStr => _invalidFileNameCharsRegStr ?? (_invalidFileNameCharsRegStr = string.Format(@"([{0}]*\.+$)|([{0}]+)", Regex.Escape(new string(Path.GetInvalidFileNameChars()))));

        public static string SanitizeFileName(this string fileName)
        {
            if (string.IsNullOrEmpty(fileName)) { return fileName; }

            return Regex.Replace(fileName, InvalidFileNameCharsRegStr, "_");
        }

        /// <summary>
        /// Similar to string1 ?? string2 ?? ...string n
        /// but this will use the first string that is not null OR empty, not just null
        /// </summary>
        /// <param name="text"></param>
        /// <param name="alternateValue"></param>
        /// <returns></returns>
        public static string Or(this string text, params string[] alternateValue)
        {
            if (!string.IsNullOrEmpty(text) || alternateValue == null || alternateValue.Length == 0) { return text; }
            return alternateValue.FirstOrDefault(s => !string.IsNullOrEmpty(s));
        }
        public static string Or(this string text, params Func<string>[] alternateValue)
        {
            if (!string.IsNullOrEmpty(text) || alternateValue == null || alternateValue.Length == 0) { return text; }
            return alternateValue.Select(fn => fn.Invoke()).FirstOrDefault(s => !string.IsNullOrEmpty(s));
        }

        /// <summary>
        /// ensures the string does not excede the maxlength specified
        /// will return the left most part of the string up to the maxLength characters
        /// or, if preferRightSide=true, it will return the right most maxLength characters
        /// </summary>
        /// <param name="text"></param>
        /// <param name="maxLength"></param>
        /// <param name="preferRightSide"></param>
        /// <returns></returns>
        public static string MaxLength(this string text, int? maxLength, bool preferRightSide = false)
        {
            if (string.IsNullOrEmpty(text) || !maxLength.HasValue || text.Length <= maxLength.GetValueOrDefault()) { return text; }

            return preferRightSide ? text.Substring(text.Length - maxLength.GetValueOrDefault()) : text.Substring(0, maxLength.GetValueOrDefault());
        }

        public static IEnumerable<TItem> ForEachPerformAction<TItem>(this IEnumerable<TItem> items, Action<TItem> action)
        {
            var list = items as List<TItem> ?? items.ToList();
            foreach (var item in list) { action(item); }
            return list;
        }
        public static IEnumerable<TItem> ForEachPerformAction<TItem>(this IEnumerable<TItem> items, Action<int, TItem> action)
        {
            var list = items as List<TItem> ?? items.ToList();
            var idx = 0;
            foreach (var item in list)
            {
                idx++;
                action(idx, item);
            }
            return list;
        }

        public static IEnumerable<TResultItem> Compress<TItem, TResultItem>(this IEnumerable<TItem> items, Func<TResultItem, TItem, bool> predicate) where TResultItem : new()
        {
            var list = items as List<TItem> ?? items.ToList();
            var ret = new List<TResultItem>(list.Count);
            var processed = 0;
            while (processed < list.Count)
            {
                var retItem = new TResultItem();
                while (processed < list.Count && predicate(retItem, list[processed])) { processed++; }
                ret.Add(retItem);
            }
            return ret;
        }

        public static IEnumerable<TItem> Compress<TItem>(this IEnumerable<TItem> items, Func<TItem, TItem, bool> predicate)
        {
            var list = items as List<TItem> ?? items.ToList();
            var ret = new List<TItem>(list.Count);
            var processed = 0;
            while (processed < list.Count)
            {
                var retItem = list[processed];
                processed++;
                while (processed < list.Count && predicate(retItem, list[processed])) { processed++; }
                ret.Add(retItem);
            }
            return ret;
        }

        public static async Task<IEnumerable<TItem>> ForEachPerformActionAsync<TItem>(this IEnumerable<TItem> items, Func<TItem, Task> action)
        {
            var list = items as List<TItem> ?? items.ToList();
            foreach (var item in list) { await action(item); }
            return list;
        }

        public static IEnumerable<TItem> ForEachPerformAction<TItem>(this IEnumerable<TItem> items, Action<TItem, int> action)
        {
            var list = items as List<TItem> ?? items.ToList();
            var i = 0;
            foreach (var item in list) { action(item, i++); }
            return list;
        }

        public static TValue ItemOrDefault<TKey, TValue>(this IDictionary<TKey, TValue> dic, TKey key, TValue valueIfMissing)
        {
            return dic != null && key != null && dic.ContainsKey(key)
                ? dic[key]
                : valueIfMissing;
        }

        public static IDictionary<TKey, TValue> SetIfNotSet<TKey, TValue>(this IDictionary<TKey, TValue> dic, TKey key, TValue value)
        {
            if (dic != null && value != null && dic.ItemOrDefault(key) == null) { dic[key] = value; }
            return dic;
        }

        public static TSelect ItemOrDefault<TKey, TValue, TSelect>(this IDictionary<TKey, TValue> dic, TKey key, Func<TValue, TSelect> selectionPredicate, TSelect valueIfMissing)
        {
            return dic != null && key != null && dic.ContainsKey(key) ? selectionPredicate(dic[key]) : valueIfMissing;
        }
        public static TValue ItemOrDefault<TKey, TValue>(this IDictionary<TKey, TValue> dic, TKey key) { return dic.ItemOrDefault(key, default(TValue)); }

        public static string MaskValue(this string value, string maskChar = "X", int lengthToUnMask = 4, bool maskExistingChars = false)
        {
            if (string.IsNullOrEmpty(value)) { return value; }

            if (maskExistingChars)
            {
                if (value.Length < lengthToUnMask) { return value; }

                var maskedPart = MaskRegex.Replace(value.Substring(0, value.Length - lengthToUnMask), maskChar);
                return $"{maskedPart}{value.Substring(value.Length - lengthToUnMask)}";
            }

            return $"{maskChar}{value.MaxLength(lengthToUnMask, true)}";
        }

        public static List<TItem> MakeList<TItem>(this TItem item, bool returnNullIfNull = false) { return item == null ? (returnNullIfNull ? (List<TItem>)null : new List<TItem>()) : new List<TItem> { item }; }

        public static List<TSource> ToNonNullList<TSource>(this IEnumerable<TSource> source)
        {
            if (source == null) { return new List<TSource>(); }

            return new List<TSource>(source);
        }
        public static List<TSource> ToNullableList<TSource>(this IEnumerable<TSource> source)
        {
            if (source == null) { return null; }
            var ret = new List<TSource>(source);
            return ret.Any() ? ret : null;
        }

        public static bool IsEmpty(this Guid? value) { return !value.HasValue || value.Equals(Guid.Empty); }
        public static bool IsEmpty(this Guid value) { return value.Equals(Guid.Empty); }

        public static Guid? ToGuid(this string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                Guid tmp;
                if (Guid.TryParse(value, out tmp)) { return tmp; }
            }

            return null;
        }

        /// <summary>
        /// ensures order of bytes is consistent despite the
        /// 'endness' of the machine exectuting the code
        /// useful to ensure consistent behavior across machines when
        /// the bytes derived from structs is used to construct other things
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static IEnumerable<byte> AutoEndian(this IEnumerable<byte> bytes)
        {
            return BitConverter.IsLittleEndian ? bytes.Reverse() : bytes;
        }

        /// <summary>
        /// Code ported from Blackbaud.Core.Transactions which is a net6.0 project and therefore cannot be used from here
        /// </summary>
        public static class TcsGuid
        {
            /// <summary>
            /// Returns a deterministic Guid based on the type, environment and integer id
            /// </summary>
            /// <param name="type">String that describes the type of id, typically the table name</param>
            /// <param name="environmentId">environment ID</param>
            /// <param name="id">integer ID</param>
            /// <returns>a stable Guid</returns>
            public static Guid From(string type, string environmentId, int id)
            {
                return From(type, environmentId, id.ToString());
            }

            /// <summary>
            /// Returns a deterministic Guid based on the type, environment and distinct name
            /// </summary>
            /// <param name="type">String that describes the type of id, typically the table name</param>
            /// <param name="environmentId">environment ID</param>
            /// <param name="name">distinct Name</param>
            /// <returns>a stable Guid</returns>
            public static Guid From(string type, string environmentId, string name)
            {
                var key = $"{type.ToLower()}{environmentId.ToLower()}{name}";
                return GuidUtility.Create(GuidUtility.IsoOidNamespace, key);
            }

            /// <summary>
            /// Helper methods for working with <see cref="Guid"/>.
            /// Imported from https://github.com/Faithlife/FaithlifeUtility/blob/master/src/Faithlife.Utility/GuidUtility.cs
            /// </summary>
            private static class GuidUtility
            {
                /// <summary>
                /// Creates a name-based UUID using the algorithm from RFC 4122 §4.3.
                /// </summary>
                /// <param name="namespaceId">The ID of the namespace.</param>
                /// <param name="name">The name (within that namespace).</param>
                /// <returns>A UUID derived from the namespace and name.</returns>
                /// <remarks>See <a href="http://code.logos.com/blog/2011/04/generating_a_deterministic_guid.html">Generating a deterministic GUID</a>.</remarks>
                public static Guid Create(Guid namespaceId, string name)
                {
                    return Create(namespaceId, name, 5);
                }

                /// <summary>
                /// Creates a name-based UUID using the algorithm from RFC 4122 §4.3.
                /// </summary>
                /// <param name="namespaceId">The ID of the namespace.</param>
                /// <param name="name">The name (within that namespace).</param>
                /// <param name="version">The version number of the UUID to create; this value must be either
                /// 3 (for MD5 hashing) or 5 (for SHA-1 hashing).</param>
                /// <returns>A UUID derived from the namespace and name.</returns>
                /// <remarks>See <a href="http://code.logos.com/blog/2011/04/generating_a_deterministic_guid.html">Generating a deterministic GUID</a>.</remarks>
                public static Guid Create(Guid namespaceId, string name, int version)
                {
                    if (name == null)
                        throw new ArgumentNullException("name");
                    if (version != 3 && version != 5)
                        throw new ArgumentOutOfRangeException("version", "version must be either 3 or 5.");

                    // convert the name to a sequence of octets (as defined by the standard or conventions of its namespace) (step 3)
                    // ASSUME: UTF-8 encoding is always appropriate
                    byte[] nameBytes = Encoding.UTF8.GetBytes(name);

                    // convert the namespace UUID to network order (step 3)
                    byte[] namespaceBytes = namespaceId.ToByteArray();
                    SwapByteOrder(namespaceBytes);

                    // compute the hash of the name space ID concatenated with the name (step 4)
                    byte[] hash;
                    using (HashAlgorithm algorithm = version == 3 ? (HashAlgorithm)MD5.Create() : SHA1.Create())
                    {
                        algorithm.TransformBlock(namespaceBytes, 0, namespaceBytes.Length, null, 0);
                        algorithm.TransformFinalBlock(nameBytes, 0, nameBytes.Length);
                        hash = algorithm.Hash;
                    }

                    // most bytes from the hash are copied straight to the bytes of the new GUID (steps 5-7, 9, 11-12)
                    byte[] newGuid = new byte[16];
                    Array.Copy(hash, 0, newGuid, 0, 16);

                    // set the four most significant bits (bits 12 through 15) of the time_hi_and_version field to the appropriate 4-bit version number from Section 4.1.3 (step 8)
                    newGuid[6] = (byte)((newGuid[6] & 0x0F) | (version << 4));

                    // set the two most significant bits (bits 6 and 7) of the clock_seq_hi_and_reserved to zero and one, respectively (step 10)
                    newGuid[8] = (byte)((newGuid[8] & 0x3F) | 0x80);

                    // convert the resulting UUID to local byte order (step 13)
                    SwapByteOrder(newGuid);
                    return new Guid(newGuid);
                }

                /// <summary>
                /// The namespace for fully-qualified domain names (from RFC 4122, Appendix C).
                /// </summary>
                public static readonly Guid DnsNamespace = new Guid("6ba7b810-9dad-11d1-80b4-00c04fd430c8");

                /// <summary>
                /// The namespace for URLs (from RFC 4122, Appendix C).
                /// </summary>
                public static readonly Guid UrlNamespace = new Guid("6ba7b811-9dad-11d1-80b4-00c04fd430c8");

                /// <summary>
                /// The namespace for ISO OIDs (from RFC 4122, Appendix C).
                /// </summary>
                public static readonly Guid IsoOidNamespace = new Guid("6ba7b812-9dad-11d1-80b4-00c04fd430c8");

                // Converts a GUID (expressed as a byte array) to/from network order (MSB-first).
                private static void SwapByteOrder(byte[] guid)
                {
                    SwapBytes(guid, 0, 3);
                    SwapBytes(guid, 1, 2);
                    SwapBytes(guid, 4, 5);
                    SwapBytes(guid, 6, 7);
                }

                private static void SwapBytes(byte[] guid, int left, int right)
                {
                    byte temp = guid[left];
                    guid[left] = guid[right];
                    guid[right] = temp;
                }
            }
        }
        //            var idGenerator = Blackbaud.FinancialEdge.RecordTypes.TableId.OtherId(fileServiceParentRecordType);

        public static string ToGuidString(this int? value, string descriptor1 = null, string descriptor2 = null, string descriptor3 = null) => !value.HasValue ? null : value.Value.ToGuidString(descriptor1, descriptor2, descriptor3);
        public static string ToGuidString(this int value, string descriptor1 = null, string descriptor2 = null, string descriptor3 = null) => ToGuid(value, descriptor1, descriptor2, descriptor3).ToString();
        public static Guid? ToGuid(this int? value, string descriptor1 = null, string descriptor2 = null, string descriptor3 = null) => value.HasValue ? value.Value.ToGuid(descriptor1, descriptor2, descriptor3) : default(Guid?);

        /// <summary>
        /// guids are 16 byte values - this extension gives you a means of creating deterministic
        /// guid values from int values.
        /// this extension will return a guid with the following values:
        /// first 12 bytes will be hex hashcode values for the descriptors passed in
        /// last 4 bytes will be hex value of the id passed in
        /// NOTE: descriptors are case sensitive
        /// </summary>
        /// <param name="value"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public static Guid ToGuid(this int value, string descriptor1 = null, string descriptor2 = null, string descriptor3 = null)
        {
            return new Guid(
                BitConverter.GetBytes(string.IsNullOrEmpty(descriptor1) ? 0 : descriptor1.GetHashCode()).AutoEndian()
                .Concat(BitConverter.GetBytes(string.IsNullOrEmpty(descriptor2) ? 0 : descriptor2.GetHashCode()).AutoEndian())
                .Concat(BitConverter.GetBytes(string.IsNullOrEmpty(descriptor3) ? 0 : descriptor3.GetHashCode()).AutoEndian())
                .Concat(BitConverter.GetBytes(value).AutoEndian()).ToArray()
            );
        }

        public static int? ToInt(this string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                int tmp;
                if (int.TryParse(value, out tmp)) { return tmp; }
            }

            return null;
        }

        public static DateTime? ToDate(this string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                var parts = value.Split('(');
                if (parts.Length > 1)
                {
                    value = parts[0].Trim();
                    DateTimeOffset dto;
                    if (DateTimeOffset.TryParseExact(value, "ddd MMM dd yyyy HH:mm:ss 'GMT'zzz", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AssumeUniversal, out dto)) { return dto.UtcDateTime.NormalizedDate(); }
                }

                //the following code is seriously flawed
                DateTime tmp;
                var idx = value.IndexOf("T", StringComparison.InvariantCulture);
                if (idx > -1) { value = value.Substring(0, idx); }

                if (DateTime.TryParse(value, out tmp)) { return tmp; }
            }

            return null;
        }

        public static string XmlSerializeObject<T>(this T toSerialize)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            using (var textWriter = new StringWriter())
            {
                xmlSerializer.Serialize(textWriter, toSerialize);
                return textWriter.ToString();
            }
        }

        public static T XmlDeSerializeObject<T>(this string xml)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            using (var textReader = new StringReader(xml)) { return (T)xmlSerializer.Deserialize(textReader); }
        }

        public static Stream XmlSerializeObject<T>(this T toSerialize, Stream stream)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            xmlSerializer.Serialize(stream, toSerialize);
            return stream;
        }

        public static T XmlDeSerializeObject<T>(this Stream stream)
        {
            var xmlSerializer = new XmlSerializer(typeof(T));
            return (T)xmlSerializer.Deserialize(stream);
        }

        public static Exception InnermostException(this Exception ex)
        {
            if (ex == null || ex.InnerException == null) { return ex; }

            return ex.InnerException.InnermostException();
        }

        public static T SmartAdd<T>(this IList<T> list, T value) where T : class
        {
            //only adds if value is not null and returns the item just added
            if (value == null) { return null; }

            list.Add(value);
            return value;
        }

        public static string NormalizeNewlines(this string s)
        {
            if (s == null) { return null; }

            return s.Replace("\r\n", "\n").Replace("\r", "\n").Replace("\n", System.Environment.NewLine);
        }


        /// <summary>
        /// This overlays the newValue ontop of the wholestring starting at the specified position.
        /// If the new value would extend past the wholestring, it is truncated - the wholestring will
        /// never change size.
        /// </summary>
        public static string Overlay(this string wholeString, int startingAt, string newValue)
        {
            if (string.IsNullOrEmpty(wholeString) || string.IsNullOrEmpty(newValue) || startingAt < 0 || startingAt >= wholeString.Length) { return wholeString; }
            if (startingAt + newValue.Length > wholeString.Length) { newValue = newValue.Substring(0, wholeString.Length - startingAt); }
            return wholeString.Substring(0, startingAt) + newValue + wholeString.Substring(startingAt + newValue.Length);
        }
        public static string Left(this string text, int length)
        {
            if (string.IsNullOrEmpty(text)) { return text; }
            length = Math.Min(Math.Abs(length), text.Length);
            return text.Substring(0, length);
        }
        public static string Right(this string text, int length)
        {
            if (string.IsNullOrEmpty(text)) { return text; }
            length = Math.Min(Math.Abs(length), text.Length);
            return text.Substring(text.Length - length);
        }
    }
}
