using QuickHRP.BusinessService.Bootstrap;

namespace QuickHRP.API.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureAPIServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.ConfigureBusinessServices(configuration);
            serviceCollection.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
        }
    }
}
