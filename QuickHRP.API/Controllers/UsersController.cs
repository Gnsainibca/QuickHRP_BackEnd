using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace QuickHRP.API.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController(UserManager<IdentityUser> userManager) : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager = userManager;

        [HttpGet(Name = "Users")]
        public async Task<IActionResult> Get()
        {
            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            var allUsersExceptCurrentUser = await _userManager.Users.Where(a => a.Id != currentUser.Id).ToListAsync();
            return Ok(allUsersExceptCurrentUser);
        }
    }
}