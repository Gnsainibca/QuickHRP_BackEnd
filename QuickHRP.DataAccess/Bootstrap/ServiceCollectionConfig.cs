using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuickHRP.Core.Permission.Seeds;
using QuickHRP.DataAccess.Contract;
using QuickHRP.DataAccess.Repository;
using QuickHRP.DataAccess.Service;
using QuickHRP.DataAccess.SQL.Bootstrap;
using QuickHRP.DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Identity;
using QuickHRP.Entities;

namespace QuickHRP.DataAccess.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureDataServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.AddDependency();
            serviceCollection.ConfigureDataBaseServices(configuration);
            serviceCollection.SeedData();
        }

        private static void SeedData(this IServiceCollection serviceCollection)
        {
            var services = serviceCollection.BuildServiceProvider();
            var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
            var userManager = services.GetRequiredService<UserManager<User>>();
            DefaultRoles.SeedAsync(roleManager).Wait();
            DefaultUsers.SeedAdminUserAsync(userManager, roleManager).Wait();
            DefaultUsers.SeedSuperAdminUserAsync(userManager, roleManager).Wait();
        }

        private static void AddDependency(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IMasterDataService, MasterDataService>();
            serviceCollection.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            serviceCollection.AddScoped<IDatabaseUnitOfWork, DatabaseUnitOfWork>();
        }
    }
}
