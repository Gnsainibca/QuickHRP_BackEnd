using Microsoft.AspNetCore.Identity;
using QuickHRP.Core.Permission.Constants;

namespace QuickHRP.Core.Permission.Seeds
{
    public static class DefaultRoles
    {
        public static async Task SeedAsync(RoleManager<IdentityRole> roleManager)
        {
            foreach (var role in Enum.GetNames(typeof(Role)))
            {
                await roleManager.CreateAsync(new IdentityRole(role));
            }
        }
    }
}