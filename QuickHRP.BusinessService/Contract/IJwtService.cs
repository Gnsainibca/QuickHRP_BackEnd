using System.Security.Claims;
using Microsoft.AspNetCore.Identity;

namespace QuickHRP.BusinessService.Contract
{
    public interface IJwtService
    {
        string GenerateEncodedToken(IdentityUser user, ClaimsIdentity identity, Claim userRoleClaims, IList<Claim> userClaims, IList<Claim> roleClaims);

        ClaimsIdentity GenerateClaimsIdentity(IdentityUser user, string role);
    }
}
