using System.Globalization;
using log4net;
using Newtonsoft.Json;

namespace QuickHRP.Utility.Functional
{
    public static class Helper
    {
        private static CultureInfo _cultureInfo;
        public static CultureInfo CultureInfo
        {
            get
            {
                if (_cultureInfo == null)
                {
                    _cultureInfo = new CultureInfo("en-Us");
                }
                return _cultureInfo;
            }
        }

        /// <summary>
        /// Set source property to log source (UI , API) in logs
        /// </summary>
        /// <param name="source"></param>
        public static void SetLogSource(int source)
        {
            GlobalContext.Properties["source"] = source;
        }

        /// <summary>
        /// Set user property to log user name in logs
        /// </summary>
        /// <param name="user"></param>
        public static void SetLogUser(string user)
        {
            GlobalContext.Properties["user"] = user;
        }


        /// <summary>
        /// Convert object to json string.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string ToJson(object data)
        {
            return JsonConvert.SerializeObject(data);
        }
    }
}
