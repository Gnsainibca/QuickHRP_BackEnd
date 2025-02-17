using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using QuickHRP.API.ModelBinder;
using QuickHRP.BusinessService.Bootstrap;
using QuickHRP.Core.Permission.AuthUtils.PolicyProvider;
using QuickHRP.Core.Permission.Models;

namespace QuickHRP.API.Bootstrap
{
    public static class ServiceCollectionConfig
    {
        public static void ConfigureAPIServices(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.AddHttpClient();
            serviceCollection.ConfigureBusinessServices(configuration);
            serviceCollection.AddAuthentication(configuration);
            serviceCollection.AddAuthorization();
            serviceCollection.AddModelBinderErrorHandler();
            serviceCollection.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Quick HRP API",
                    Version = "v1"
                });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Description = "Please insert JWT with Bearer into field",
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement {
                   {
                     new OpenApiSecurityScheme
                     {
                       Reference = new OpenApiReference
                       {
                         Type = ReferenceType.SecurityScheme,
                         Id = "Bearer"
                       }
                      },
                      Array.Empty<string>()
                    }
                  });
            });
            serviceCollection.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
        }

        private static void AddAuthorization(this IServiceCollection serviceCollection)
        {
            //// api user claim policy
            //serviceCollection.AddAuthorizationBuilder()
            //                 .AddPolicy("Appointment_Delete", policy => policy.RequireClaim("Permission", "Permissions.Appointment.View"));

            // Register our custom Authorization handler
            serviceCollection.AddSingleton<IAuthorizationHandler, PermissionHandler>();

            // Overrides the DefaultAuthorizationPolicyProvider with our own
            serviceCollection.AddSingleton<IAuthorizationPolicyProvider, PermissionAuthorizationPolicyProvider>();
        }

        /// <summary>
        /// This method can be used to register a custom Model binder's error handler.
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        private static IServiceCollection AddModelBinderErrorHandler(this IServiceCollection services)
        {
            services.AddSingleton<IModelBindingErrorHandler, ModelBindingErrorHandler>();

            var serviceProvider = services.BuildServiceProvider();
            var handler = serviceProvider.GetService<IModelBindingErrorHandler>()!;
            services.PostConfigure((ApiBehaviorOptions options) =>
                options.InvalidModelStateResponseFactory = handler.HandleInvalidModelState);

            return services;
        }

        private static void AddAuthentication(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            string secretKey = configuration["Keys:SecretKey"]!;
            SymmetricSecurityKey _signingKey = new(Encoding.ASCII.GetBytes(secretKey));
            var jwtAppSettingOptions = configuration.GetSection(nameof(JwtIssuerOptions));

            // Configure JwtIssuerOptions
            serviceCollection.Configure<JwtIssuerOptions>(options =>
            {
                options.Issuer = jwtAppSettingOptions[nameof(JwtIssuerOptions.Issuer)]!;
                options.Audience = jwtAppSettingOptions[nameof(JwtIssuerOptions.Audience)]!;
                options.SigningCredentials = new SigningCredentials(_signingKey, SecurityAlgorithms.HmacSha256);
            });

            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwtAppSettingOptions[nameof(JwtIssuerOptions.Issuer)],

                ValidateAudience = true,
                ValidAudience = jwtAppSettingOptions[nameof(JwtIssuerOptions.Audience)],

                ValidateIssuerSigningKey = true,
                IssuerSigningKey = _signingKey,

                RequireExpirationTime = false,
                ValidateLifetime = true,
                ClockSkew = TimeSpan.Zero
            };

            serviceCollection.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            }).AddJwtBearer(configureOptions =>
            {
                configureOptions.ClaimsIssuer = jwtAppSettingOptions[nameof(JwtIssuerOptions.Issuer)];
                configureOptions.TokenValidationParameters = tokenValidationParameters;
                configureOptions.SaveToken = true;
                configureOptions.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            context.Response.Headers.Append("Token-Expired", "true");
                        }
                        return Task.CompletedTask;
                    }
                };
            });
        }
    }
}
