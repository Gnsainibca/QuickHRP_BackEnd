using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Principal;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Permission.Models;
using QuickHRP.Utility;
using QuickHRP.Utility.Functional;

namespace QuickHRP.BusinessService.Service
{
    public class JwtService : IJwtService
    {
        private readonly JwtIssuerOptions _jwtOptions;

        public JwtService(IOptions<JwtIssuerOptions> jwtOptions, IConfiguration configuration)
        {
            _jwtOptions = jwtOptions.Value;
            _jwtOptions.ValidFor = TimeSpan.FromMinutes(Convert.ToInt32(configuration["Keys:TokenExpiry"]));
            ThrowIfInvalidOptions(_jwtOptions);
        }

        /// <summary>
        /// Generate Encoded Token
        /// </summary>
        /// <param name="user"></param>
        /// <param name="identity"></param>
        /// <param name="userRoleClaims"></param>
        /// <param name="userClaims"></param>
        /// <param name="roleClaims"></param>
        /// <returns></returns>
        public string GenerateEncodedToken(IdentityUser user, ClaimsIdentity identity, Claim userRoleClaims, IList<Claim> userClaims, IList<Claim> roleClaims)
        {
            var claims = new[]
            {
                 new Claim(JwtRegisteredClaimNames.Sub, user.UserName!),
                 new Claim(JwtRegisteredClaimNames.Iat, ToUnixEpochDate(_jwtOptions.IssuedAt).ToString(Helper.CultureInfo),
                 ClaimValueTypes.Integer64),
                 identity.FindFirst(Constant.JwtClaimIdentifiers.Role),
                 identity.FindFirst(Constant.JwtClaimIdentifiers.Id),
                 identity.FindFirst(Constant.JwtClaimIdentifiers.UserName)
                }.Union(userClaims)
                .Union(roleClaims)
                .Union([userRoleClaims]);

            // Create the JWT security token and encode it.
            var jwt = new JwtSecurityToken(
                issuer: _jwtOptions.Issuer,
                audience: _jwtOptions.Audience,
                claims: claims,
                notBefore: _jwtOptions.NotBefore,
                expires: _jwtOptions.Expiration,
                signingCredentials: _jwtOptions.SigningCredentials);

            var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);
            return encodedJwt;
        }

        /// <summary>
        /// Generate Claims Identity.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="role"></param>
        /// <returns></returns>
        public ClaimsIdentity GenerateClaimsIdentity(IdentityUser user, string role)
        {
            return new ClaimsIdentity(new GenericIdentity(user.UserName!, "Token"),
            [
                new Claim(Constant.JwtClaimIdentifiers.Id, user.Id),
                new Claim(Constant.JwtClaimIdentifiers.Role, role),
                new Claim(Constant.JwtClaimIdentifiers.UserName, user.UserName!),
            ]);
        }

        private static long ToUnixEpochDate(DateTime date) => (long)Math.Round((date.ToUniversalTime() - new DateTimeOffset(1970, 1, 1, 0, 0, 0, TimeSpan.Zero)).TotalSeconds);

        private static void ThrowIfInvalidOptions(JwtIssuerOptions options)
        {
            ArgumentNullException.ThrowIfNull(options);

            if (options.ValidFor <= TimeSpan.Zero)
            {
                string validFor = nameof(JwtIssuerOptions.ValidFor);
                throw new ArgumentException("Must be a non-zero TimeSpan.", validFor);
            }

            if (options.SigningCredentials == null)
            {
                string signingCredentials = nameof(JwtIssuerOptions.SigningCredentials);
                throw new ArgumentNullException(signingCredentials);
            }

            if (options.JtiGenerator == null)
            {
                string jtiGenerator = nameof(JwtIssuerOptions.JtiGenerator);
                throw new ArgumentNullException(jtiGenerator);
            }
        }
    }
}
