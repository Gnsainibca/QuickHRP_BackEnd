using System.Security.Claims;
using System.Security.Cryptography;
using System.Security.Principal;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Permission.Models;
using QuickHRP.Entities;
using QuickHRP.Utility;
using QuickHRP.Utility.Extensions;
using QuickHRP.Utility.Functional;

namespace QuickHRP.BusinessService.Service
{
    public class TokenService(ILogger<TokenService> logger, SignInManager<User> signInManager, IJwtService jwtService,
        IUserService userService, IOptions<JwtIssuerOptions> jwtOptions, IHttpContextAccessor httpContextAccessor) : ITokenService
    {
        private readonly ILogger<TokenService> _logger = logger;
        private readonly SignInManager<User> _signInManager = signInManager;
        private readonly IJwtService _jwtService = jwtService;
        private readonly IUserService _userService = userService;
        private readonly JwtIssuerOptions _jwtOptions = jwtOptions.Value;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

        /// <summary>
        /// Validating user Account, Locking and claims.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<Claims> ValidateUserAndClaims(string userName, string password)
        {
            var correlationId = _logger.LogFunctionEntry();
            var user = await _userService.GetUser(userName).ConfigureAwait(false);

            if (user != null)
            {
                user.UserName = user.Email!;
                if (!user.IsActive)
                    return new Claims()
                    {
                        IsAccountDisabled = !user.IsActive,
                        Message = Constant.MessageKey.ErrorAccountDisable
                    };

                SignInResult signInResult = await _signInManager.PasswordSignInAsync(user.UserName, password, false, true).ConfigureAwait(false);

                if (signInResult.IsLockedOut)
                    return new Claims()
                    {
                        IsLockedOut = true,
                        Message = Constant.MessageKey.AccountLocked
                    };

                if (signInResult.Succeeded)
                {
                    var role = await _userService.GetRolesAsync(user).ConfigureAwait(false) ?? throw new Exception("No role is assigned to the logged-in user.");

                    ClaimsIdentity identity = _jwtService.GenerateClaimsIdentity(user, role);
                    Claims claims = await GenerateJwt(identity, _jwtService, role, user, _jwtOptions).ConfigureAwait(false);

                    // Set user in http context.
                    _httpContextAccessor.HttpContext.User = new GenericPrincipal(identity, [role]);

                    if (_httpContextAccessor.HttpContext.User != null && _httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
                    {
                        // Set user property to log user id in logs
                        Helper.SetLogUser(user.Id);
                    }

                    var token = GenerateToken();
                    var dbOperationDone = true; // await DBOperationOnValidateUserSuccess(browser, deviceToken, user, token);
                    if (dbOperationDone)
                    {
                        claims.RefreshToken = token;
                        _logger.LogFunctionExit(correlationId);
                        return claims;
                    }
                    else
                    {
                        return new Claims() { Message = Constant.MessageKey.DBOperationFailed };
                    }
                }
                else
                    // since the user object received from calling function is not updated (from db) after PasswordSignInAsync attempt
                    // we will manually update AccessFailedCount it to reflect it's true value as it is in the db
                    return new Claims() { AccessFailedCount = user.AccessFailedCount + 1 };
            }
            return null;
        }

        private async Task<Claims> GenerateJwt(ClaimsIdentity identity, IJwtService jwtFactory, string role, User user, JwtIssuerOptions jwtOptions)
        {
            var userIdentityRole = await _userService.GetIdentityRoleAsync(role) ?? throw new Exception("No role is assigned to the logged-in user.");

            var userRolesClaims = new Claim(ClaimTypes.Role, role);
            var userClaims = await _userService.GetClaimsAsync(user).ConfigureAwait(false);
            var roleClaims = await _userService.GetRolesClaimsAsync(userIdentityRole);

            return new Claims()
            {
                Id = identity.Claims.Single(c => c.Type == Constant.JwtClaimIdentifiers.Id).Value,
                AuthToken = jwtFactory.GenerateEncodedToken(user, identity, userRolesClaims,
                    userClaims, roleClaims),
                ExpiresIn = (int)jwtOptions.ValidFor.TotalSeconds,
                Name = identity.FindFirst(Constant.JwtClaimIdentifiers.Name)?.Value!,
                UserName = identity.FindFirst(Constant.JwtClaimIdentifiers.UserName)?.Value!,
                Role = identity.FindFirst(Constant.JwtClaimIdentifiers.Role)?.Value!,
                IsActive = user.IsActive
            };
        }

        private static string GenerateToken()
        {
            var randomNumber = new byte[32];
            using var rng = RandomNumberGenerator.Create();
            rng.GetBytes(randomNumber);
            return Convert.ToBase64String(randomNumber);
        }
    }
}
