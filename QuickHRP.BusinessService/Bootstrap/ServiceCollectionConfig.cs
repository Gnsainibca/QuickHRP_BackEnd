using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuickHRP.BusinessService.Contract;
using QuickHRP.BusinessService.Service;
using QuickHRP.DataAccess.Bootstrap;

namespace QuickHRP.BusinessService.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureBusinessServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.AddDependency();
            serviceCollection.ConfigureDataServices(configuration);
        }

        private static void AddDependency(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IMasterService, MasterService>();
            serviceCollection.AddScoped<IHospitalService, HospitalService>();
            serviceCollection.AddScoped<IJwtService, JwtService>();
            serviceCollection.AddScoped<ITokenService, TokenService>();
            serviceCollection.AddScoped<IUserService, UserService>();
            serviceCollection.AddScoped<IAuthService, AuthService>();
        }
    }
}
