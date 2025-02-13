namespace QuickHRP.Utility
{
    public class Constant
    {
        public static class Key
        {
            public static class App
            {
                public const string ConnectionStringKey = "ConnectionStrings:DBConnectionString";
                public const string TokenExpiry = "Keys:TokenExpiry"; // in minuts - 1 day
                public const string LockoutEndTimeSpan = "Keys:LockoutEndTimeSpan";
                public const string MaxFailedAccessAttempts = "Keys:MaxFailedAccessAttempts";
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

        public static class MessageKey
        {
            public const string DuplicatePhoneNumber = "DuplicatePhoneNumber";
            public const string DuplicateEmail = "DuplicateEmail";
            public const string FailedToCreateAccount = "FailedToCreateAccount";
            public const string ErrorAccountDisable = "ErrorAccountDisable";
            public const string AccountLocked = "AccountLocked";
            public const string InvalidUserNameOrPassword = "InvalidUserNameOrPassword";
            public const string UserDoesNotExistAgainstEmail = "UserDoesNotExistAgainstEmail";
            public const string DealerNotActive = "DealerNotActive";
            public const string UserDoesNotExistAgainstPhoneNumber = "UserDoesNotExistAgainstPhoneNumber";
            public const string InvalidToken = "InvalidToken";
            public const string DBOperationFailed = "DBOperationFailed";
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

        /// <summary>
        /// Jwt Claim Identifiers Constants
        /// </summary>
        public static class JwtClaimIdentifiers
        {
            public const string Role = "Role"
                , Id = "Id"
                , Name = "Name"
                , UserName = "UserName";
        }
    }
}
