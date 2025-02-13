using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuickHRP.Entities;
using QuickHRP.Utility;

namespace QuickHRP.DataAccess.SQL.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureDataBaseServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            string? connectionString = configuration[Constant.Key.App.ConnectionStringKey];
            serviceCollection.AddDbContext<QuickHRPDbContext>(options => options.UseSqlServer(connectionString), ServiceLifetime.Singleton);

            // add identity
            var builder = serviceCollection.AddIdentityCore<User>(o =>
            {
                // configure identity options
                o.Password.RequireDigit = false;
                o.Password.RequireLowercase = false;
                o.Password.RequireUppercase = false;
                o.Password.RequireNonAlphanumeric = false;
                o.Password.RequiredLength = 4;
            });
            builder = new IdentityBuilder(builder.UserType, typeof(IdentityRole), builder.Services);

            builder.AddEntityFrameworkStores<QuickHRPDbContext>().AddDefaultTokenProviders();

            serviceCollection.AddIdentity<User, IdentityRole>(options =>
            {
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(Convert.ToInt32(configuration[Constant.Key.App.LockoutEndTimeSpan]));
                options.Lockout.MaxFailedAccessAttempts = Convert.ToInt32(configuration[Constant.Key.App.MaxFailedAccessAttempts]);
            });
        }
    }
}
