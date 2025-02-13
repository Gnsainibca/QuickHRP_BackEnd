using Microsoft.Extensions.Logging;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Permission.Models;
using QuickHRP.Utility;
using QuickHRP.Utility.Extensions;

namespace QuickHRP.BusinessService.Service
{
    public class AuthService(ILogger<AuthService> logger, ITokenService tokenService) : IAuthService
    {
        private readonly ILogger<AuthService> _logger = logger;
        private readonly ITokenService _tokenService = tokenService;

        /// <summary>
        /// Try logging in with supplied user and password. Return claims if login is successful.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<Claims> UserLogin(string userName, string password)
        {
            var correlationId = _logger.LogFunctionEntry();
            try
            {
                // validate user and get claims
                var claimResponse = await _tokenService.ValidateUserAndClaims(userName, password);

                Claims claims = claimResponse;
                if (claims != null)
                {
                    if (claims.Message == Constant.MessageKey.ErrorAccountDisable ||
                        claims.Message == Constant.MessageKey.AccountLocked ||
                        claims.AccessFailedCount > 0)
                    {
                        // check if claims contain error message
                        throw new Exception(claims.AccessFailedCount > 0 ?
                                Constant.MessageKey.InvalidUserNameOrPassword : claims.Message);
                    }
                    else
                    {
                        _logger.LogFunctionExit(correlationId);
                        return claims;
                    }
                }
                else
                {
                    _logger.LogFunctionExitWithError(correlationId);
                    throw new Exception(Constant.MessageKey.UserDoesNotExistAgainstEmail);
                }
            }
            catch
            {
                _logger.LogFunctionExitWithError(correlationId);
                throw new Exception(Constant.MessageKey.UserDoesNotExistAgainstEmail);
            }
        }
    }
}
