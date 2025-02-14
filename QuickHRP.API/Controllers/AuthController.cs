using Microsoft.AspNetCore.Mvc;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Message.Master;

namespace QuickHRP.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController(IAuthService authService) : ControllerBase
    {
        private readonly IAuthService _authService = authService;

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] LoginViewModel loginViewModel)
        {
            var result = await _authService.UserLogin(loginViewModel.UserName, loginViewModel.Password);
            return Ok(result);
        }
    }
}