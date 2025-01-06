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
            string connectionString = configuration[Constant.Key.App.ConnectionStringKey];

            serviceCollection.AddDbContext<QuickHRPDbContext>(db => db.UseSqlServer(connectionString), ServiceLifetime.Singleton);
        }
    }
}
