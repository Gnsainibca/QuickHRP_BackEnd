using QuickHRP.MessageCore;

namespace QuickHRP.Core.Service
{
    public static class ResponseHelpers
    {
        public static async Task<ServiceResponseOf<TContent>> GetServiceResponseAsync<TContent>(Func<Task<TContent>> responseResultCallback, string failureMessage)
        {
            return await GetServiceResponseAsync(responseResultCallback, r => r, failureMessage).ConfigureAwait(false);
        }

        public static async Task<ServiceResponseOf<TContent>> GetServiceResponseAsync<TAsync, TContent>(Func<Task<TAsync>> responseResultCallback, Func<TAsync, TContent> contentCallback, string failureMessage)
        {
            return await GetServiceResponseAsync(responseResultCallback, contentCallback, null, failureMessage);
        }

        public static async Task<ServiceResponseOf<TContent>> GetServiceResponseAsync<TAsync, TContent>(Func<Task<TAsync>> responseResultCallback, Func<TAsync, TContent> contentCallback, Func<IEnumerable<FieldCharacteristic>> fieldCharacteristicsFunc, string failureMessage)
        {
            try
            {
                if (fieldCharacteristicsFunc == null) { return new ServiceResponseOf<TContent> { Status = ServiceResponseWrapper.ResponseStatuses.Success, Content = contentCallback(await responseResultCallback.Invoke()) }; }

                return new ServiceResponseWithFieldCharacteristics<TContent>
                {
                    Status = ServiceResponseWrapper.ResponseStatuses.Success,
                    Content = contentCallback(await responseResultCallback.Invoke()),
                };
            }
            catch (Exception ex)
            {
                throw;
                //return ex
                //    .ThrowIfTerminal()
                //    .ToBaseResponseMessage<TContent>(failureMessage);
            }
        }

        public static async Task<ServiceResponseOf<TContent>> GetServiceResponseAsync<TContent>(Func<Task<TContent>> responseResultCallback, Func<IEnumerable<FieldCharacteristic>> fieldCharacteristicsFunc, string failureMessage)
        {
            return await GetServiceResponseAsync(responseResultCallback, r => r, fieldCharacteristicsFunc, failureMessage);
        }

        /// <summary>
        /// ToResponse should only be used in simple cases where no error can occur in the creation of the object - use ResponseHelpers.GetServiceResponse instead
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="content"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public static ServiceResponseOf<T> ToResponse<T>(this T content, string status = ServiceResponseWrapper.ResponseStatuses.Success) { return new ServiceResponseOf<T>(content) { Status = status }; }

        public static ServiceResponseOf<T> GetServiceResponse<T>(Func<T> responseResultCallback, Func<IEnumerable<FieldCharacteristic>> fieldCharFunc, string failureMessage)
        {
            try
            {
                if (fieldCharFunc == null)
                {
                    return new ServiceResponseOf<T>
                    {
                        Status = ServiceResponseWrapper.ResponseStatuses.Success,
                        Content = responseResultCallback.Invoke()
                    };
                }

                return new ServiceResponseWithFieldCharacteristics<T>
                {
                    Status = ServiceResponseWrapper.ResponseStatuses.Success,
                    Content = responseResultCallback.Invoke(),
                };
            }
            catch (Exception ex)
            {
                throw;
                //return ex
                //    .ThrowIfTerminal()
                //    .ToBaseResponseMessage<T>(failureMessage);
            }
        }

        public static ServiceResponseOf<T> GetServiceResponse<T>(Func<T> responseResultCallback, string failureMessage) { return GetServiceResponse(responseResultCallback, null, failureMessage); }

        public static ServiceResponseOf<bool> GetBoolResponseMessage<T>(Func<T> responseResultCallback, string failureMessage)
        {
            var ret = GetServiceResponse(responseResultCallback, failureMessage);
            return new ServiceResponseOf<bool>
            {
                Content = ret.Successful(),
                ErrorId = ret.ErrorId,
                RuleId = ret.RuleId,
                ErrorPath = ret.ErrorPath,
                Errors = ret.Errors,
                ErrorSummary = ret.ErrorSummary,
                Status = ret.Status
            };
        }
    }
}
