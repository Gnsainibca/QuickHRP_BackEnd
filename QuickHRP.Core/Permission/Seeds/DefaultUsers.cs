using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using QuickHRP.Core.Permission.Constants;

namespace QuickHRP.Core.Permission.Seeds
{
    public static class DefaultUsers
    {
        public static async Task SeedAdminUserAsync(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            //Seed Default User
            var defaultUser = new IdentityUser
            {
                UserName = PermissionConstant.AdminUserDefaultEmail,
                Email = PermissionConstant.AdminUserDefaultEmail,
                EmailConfirmed = true,
                PhoneNumberConfirmed = true,
            };
            if (userManager.Users.All(u => u.Id != defaultUser.Id))
            {
                var user = await userManager.FindByEmailAsync(defaultUser.Email);
                if (user == null)
                {
                    await userManager.CreateAsync(defaultUser, PermissionConstant.DefaultPassword);
                    await userManager.AddToRoleAsync(defaultUser, Role.Admin.ToString());
                }
                await roleManager.SeedClaimsForAdmin();
            }
        }

        public static async Task SeedSuperAdminUserAsync(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            //Seed Default User
            var defaultUser = new IdentityUser
            {
                UserName = PermissionConstant.SuperAdminUserDefaultEmail,
                Email = PermissionConstant.SuperAdminUserDefaultEmail,
                EmailConfirmed = true,
                PhoneNumberConfirmed = true,
            };
            if (userManager.Users.All(u => u.Id != defaultUser.Id))
            {
                var user = await userManager.FindByEmailAsync(defaultUser.Email);
                if (user == null)
                {
                    await userManager.CreateAsync(defaultUser, PermissionConstant.DefaultPassword);
                    foreach (var role in Enum.GetNames(typeof(Role)))
                    {
                        await userManager.AddToRoleAsync(defaultUser, role);
                    }
                }
                await roleManager.SeedClaimsForSuperAdmin();
            }
        }

        private async static Task SeedClaimsForAdmin(this RoleManager<IdentityRole> roleManager)
        {
            var adminRole = await roleManager.FindByNameAsync(Role.Admin.ToString());
            if (adminRole != null)
            {
                foreach (var module in Enum.GetNames(typeof(Module)))
                {
                    await roleManager.AddPermissionClaim(role: adminRole, module);
                }
            }
        }

        private async static Task SeedClaimsForSuperAdmin(this RoleManager<IdentityRole> roleManager)
        {
            var superAdminRole = await roleManager.FindByNameAsync(Role.SuperAdmin.ToString());
            if (superAdminRole != null)
            {
                foreach (var module in Enum.GetNames(typeof(Module)))
                {
                    await roleManager.AddPermissionClaim(role: superAdminRole, module);
                }
            }
        }

        public static async Task AddPermissionClaim(this RoleManager<IdentityRole> roleManager, IdentityRole role, string module)
        {
            var allClaims = await roleManager.GetClaimsAsync(role);
            var allPermissions = Helpers.Permission.GeneratePermissionsForModule(module);
            foreach (var permission in allPermissions)
            {
                if (!allClaims.Any(a => a.Type == PermissionConstant.PermissionType && a.Value == permission))
                {
                    await roleManager.AddClaimAsync(role, new Claim(PermissionConstant.PermissionType, permission));
                }
            }
        }
    }
}