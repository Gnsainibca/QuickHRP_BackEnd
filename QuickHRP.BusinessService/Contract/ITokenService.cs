using QuickHRP.Core.Permission.Models;

namespace QuickHRP.BusinessService.Contract
{
    public interface ITokenService
    {
        Task<Claims> ValidateUserAndClaims(string userName, string password);
    }
}
