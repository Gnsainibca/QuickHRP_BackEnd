using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuickHRP.DataAccess.Contract;
using QuickHRP.DataAccess.Repository;
using QuickHRP.DataAccess.Service;
using QuickHRP.DataAccess.SQL.Bootstrap;
using QuickHRP.DataAccess.UnitOfWork;

namespace QuickHRP.DataAccess.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureDataServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.AddDependency();
            serviceCollection.ConfigureDataBaseServices(configuration);
        }

        private static void AddDependency(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IMasterDataService, MasterDataService>();
            serviceCollection.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            serviceCollection.AddScoped<IDatabaseUnitOfWork, DatabaseUnitOfWork>();
        }
    }
}
