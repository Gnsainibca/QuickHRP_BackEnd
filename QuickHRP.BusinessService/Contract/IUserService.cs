using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using QuickHRP.Entities;

namespace QuickHRP.BusinessService.Contract
{
    public interface IUserService
    {
        Task<User?> GetUser(string userName);

        Task<string?> GetRolesAsync(User user);

        Task<IList<Claim>> GetClaimsAsync(User user);

        Task<IdentityRole?> GetIdentityRoleAsync(string role);

        Task<IList<Claim>> GetRolesClaimsAsync(IdentityRole role);
    }
}
