using QuickHRP.Entities.Hospital;

namespace QuickHRP.DataAccess.Contract
{
    public interface IHospitalDataService
    {
        Task<IList<HospitalRegistration>> List();
    }
}
