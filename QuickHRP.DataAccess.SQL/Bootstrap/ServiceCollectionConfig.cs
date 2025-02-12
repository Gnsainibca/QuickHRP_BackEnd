using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuickHRP.Utility;

namespace QuickHRP.DataAccess.SQL.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureDataBaseServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            string? connectionString = configuration[Constant.Key.App.ConnectionStringKey];
            serviceCollection.AddDbContext<QuickHRPDbContext>(options => options.UseSqlServer(connectionString), ServiceLifetime.Singleton);
            serviceCollection.AddIdentity<IdentityUser, IdentityRole>()
                    .AddEntityFrameworkStores<QuickHRPDbContext>()
            .AddDefaultTokenProviders();
        }
    }
}
