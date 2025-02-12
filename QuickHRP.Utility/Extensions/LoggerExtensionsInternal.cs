using Microsoft.Extensions.Logging;
using QuickHRP.Utility.Functional;
using QuickHRP.Utility.Functional.Enums;

namespace QuickHRP.Utility.Extensions
{
    public static class LoggerExtensionsInternal
    {
        public static string LogFunctionEntry(this ILogger logger,
            [System.Runtime.CompilerServices.CallerMemberName] string memberName = "",
            [System.Runtime.CompilerServices.CallerFilePath] string sourceFilePath = "",
            [System.Runtime.CompilerServices.CallerLineNumber] int sourceLineNumber = 0)
        {
            string CorrelationId = Guid.NewGuid().ToString();
            SetLogSource();
            logger.LogDebug($"CorrelationId:[{CorrelationId}]{Constant.LoggingMessages.OperationStarted} : {memberName}; Line: {sourceLineNumber}; Path: {sourceFilePath}");
            return CorrelationId;
        }

        public static void LogFunctionExit(this ILogger logger,
            string CorrelationId,
            [System.Runtime.CompilerServices.CallerMemberName] string memberName = "",
            [System.Runtime.CompilerServices.CallerFilePath] string sourceFilePath = "",
            [System.Runtime.CompilerServices.CallerLineNumber] int sourceLineNumber = 0)
        {
            SetLogSource();
            logger.LogDebug($"CorrelationId:[{CorrelationId}]{Constant.LoggingMessages.OperationCompleted} : {memberName}; Line: {sourceLineNumber}; Path: {sourceFilePath}");
        }

        public static void LogFunctionExitWithError(this ILogger logger,
            string CorrelationId,
            [System.Runtime.CompilerServices.CallerMemberName] string memberName = "",
            [System.Runtime.CompilerServices.CallerFilePath] string sourceFilePath = "",
            [System.Runtime.CompilerServices.CallerLineNumber] int sourceLineNumber = 0)
        {
            SetLogSource();
            logger.LogDebug($"CorrelationId:[{CorrelationId}]{Constant.LoggingMessages.OperationFailed} : {memberName}; Line: {sourceLineNumber}; Path: {sourceFilePath};");
        }

        public static void LogCritical(this ILogger logger, string CorrelationId, Exception ex, object request)
        {
            logger.LogCritical(ex, $"CorrelationId:[{CorrelationId}]{Constant.LoggingMessages.ExceptionOccured} : Requested Object : {(request == null ? "NA" : Helper.ToJson(request))}");
        }

        public static void LogException(this ILogger logger, string CorrelationId, Exception ex, object request)
        {
            SetLogSource();
            logger.LogError(ex, $"CorrelationId:[{CorrelationId}]{Constant.LoggingMessages.ExceptionOccured} : Requested Object : {(request == null ? "NA" : Helper.ToJson(request))}");
        }

        private static void SetLogSource()
        {
            Helper.SetLogSource(Convert.ToInt32(LogSource.API));
        }
    }
}
