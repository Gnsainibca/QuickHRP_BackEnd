using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace QuickHRP.API.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController(RoleManager<IdentityRole> roleManager) : ControllerBase
    {
        private readonly RoleManager<IdentityRole> _roleManager = roleManager;

        [HttpGet(Name = "Roles")]
        public async Task<IActionResult> Get()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            return Ok(roles);
        }
        [HttpPost(Name = "AddRole")]
        public async Task<IActionResult> AddRole(string roleName)
        {
            if (roleName != null)
            {
                await _roleManager.CreateAsync(new IdentityRole(roleName.Trim()));
            }
            return Ok();
        }
    }
}