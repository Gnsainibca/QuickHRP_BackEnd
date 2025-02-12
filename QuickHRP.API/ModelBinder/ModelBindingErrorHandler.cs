using Microsoft.AspNetCore.Mvc;
using QuickHRP.Utility;
using QuickHRP.Utility.Extensions;
using System.Text.Json;

namespace QuickHRP.API.ModelBinder
{
    public class ModelBindingErrorHandler : IModelBindingErrorHandler
    {
        public IActionResult HandleInvalidModelState(ActionContext context)
        {
            var modelErrors = context.ModelState
                .Where(stateEntry => stateEntry.Value.Errors.Any())
                .Select(stateEntry => new InvalidData
                {
                    FieldName = stateEntry.Key,
                    Errors = stateEntry.Value.Errors.Select(error => error.ErrorMessage).ToArray()
                });

            var requestObject = ((Microsoft.AspNetCore.Mvc.Filters.ActionExecutingContext)context).ActionArguments.FirstOrDefault().Value;
            var method = context.ActionDescriptor.DisplayName;

            var logger = context.HttpContext.RequestServices.GetRequiredService<ILogger<ModelBindingErrorHandler>>();
            logger.LogException($"{method}", new System.Exception(JsonSerializer.Serialize(modelErrors)), requestObject);

            var responseBody = new GlobalErrorModel
            {
                ErrorMessage = Constant.Error.InvalidInputData
            };

            return new BadRequestObjectResult(responseBody);
        }
    }

    public class GlobalErrorModel
    {
        public string ErrorMessage { get; set; }
    }

    public class InvalidData
    {
        public string FieldName { get; set; }
        public string[] Errors { get; set; }

        public override string ToString() => $"{FieldName}: {string.Join("; ", Errors)}";
    }
}

