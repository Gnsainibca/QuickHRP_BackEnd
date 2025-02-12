using Microsoft.AspNetCore.Mvc;

namespace QuickHRP.API.ModelBinder
{
    public interface IModelBindingErrorHandler
    {
        IActionResult HandleInvalidModelState(ActionContext context);
    }
}
