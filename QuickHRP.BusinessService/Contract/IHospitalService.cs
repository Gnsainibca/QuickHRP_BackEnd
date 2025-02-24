using QuickHRP.Entities.Hospital;
using QuickHRP.MessageCore;

namespace QuickHRP.BusinessService.Contract
{
    public interface IHospitalService
    {
        Task<ServiceResponseOf<IList<HospitalRegistrationViewModel>>> List();
    }
}
