using QuickHRP.Core.Permission.Models;
namespace QuickHRP.BusinessService.Contract
{
    public interface IAuthService
    {
        Task<Claims> UserLogin(string userName, string password);
    }
}
