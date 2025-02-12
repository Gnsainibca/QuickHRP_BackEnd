namespace QuickHRP.Utility
{
    public class Constant
    {
        public static class Key
        {
            public static class App
            {
                public const string ConnectionStringKey = "ConnectionStrings:DBConnectionString";
            }
        }

        public static class Database
        {
            public static class Param
            {
                public const string Status = "@status";
            }
        }

        public static class Error {
            public const string InvalidInputData = "Sorry, the request contains invalid data. Please revise.";
        }

        /// <summary>
        /// logging messages
        /// </summary>
        public static class LoggingMessages
        {
            public const string OperationStarted = " - Starting Operation ";
            public const string OperationCompleted = " - Completed Operation ";
            public const string OperationFailed = " - Failed Operation ";
            public const string ExceptionOccured = "- Exception Occured ";
        }
    }
}
