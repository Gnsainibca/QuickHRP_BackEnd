using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Service;
using QuickHRP.Entities;
using QuickHRP.MessageCore;
using QuickHRP.MessageCore.Models;
using QuickHRP.Utility.Extensions;

namespace QuickHRP.BusinessService.Service
{
    public class UserService(ILogger<UserService> logger, UserManager<User> userManager, RoleManager<IdentityRole> roleManager) : IUserService
    {
        private readonly ILogger<UserService> _logger = logger;
        private readonly UserManager<User> _userManager = userManager;
        private readonly RoleManager<IdentityRole> _roleManager = roleManager;

        public async Task<ServiceResponseOf<List<UserViewModel>>> List()
        {
            var users = _userManager.Users.Select(c => new UserViewModel()
            {
                Id = c.Id,
                UserName = c.UserName,
                Role = string.Join(",", _userManager.GetRolesAsync(c).Result.ToArray())
            }).ToListAsync();
            return await ResponseHelpers.GetServiceResponseAsync(() => users, "Failed to get client activity");
        }

        public async Task<User?> GetUser(string userName)
        {
            var correlationId = _logger.LogFunctionEntry();
            var user = await _userManager.FindByEmailAsync(userName);
            _logger.LogFunctionExit(correlationId);
            return user;
        }

        public async Task<string?> GetRolesAsync(User user)
        {
            var correlationId = _logger.LogFunctionEntry();
            var result = await _userManager.GetRolesAsync(user).ConfigureAwait(false);
            _logger.LogFunctionExit(correlationId);
            return result.FirstOrDefault();
        }

        public async Task<IList<Claim>> GetClaimsAsync(User user)
        {
            var correlationId = _logger.LogFunctionEntry();
            var userClaims = await _userManager.GetClaimsAsync(user).ConfigureAwait(false);
            _logger.LogFunctionExit(correlationId);
            return userClaims;
        }

        public async Task<IdentityRole?> GetIdentityRoleAsync(string role)
        {
            var correlationId = _logger.LogFunctionEntry();
            var identityRole = await _roleManager.Roles.FirstOrDefaultAsync(y => y.Name == role);
            _logger.LogFunctionExit(correlationId);
            return identityRole;
        }

        public async Task<IList<Claim>> GetRolesClaimsAsync(IdentityRole role)
        {
            var correlationId = _logger.LogFunctionEntry();
            var roleClaims = await _roleManager.GetClaimsAsync(role).ConfigureAwait(false);
            _logger.LogFunctionExit(correlationId);
            return roleClaims;
        }
    }
}
