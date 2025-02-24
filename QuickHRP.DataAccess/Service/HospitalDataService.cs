using Microsoft.EntityFrameworkCore;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities.Hospital;

namespace QuickHRP.DataAccess.Service
{
    public class HospitalDataService(IDatabaseUnitOfWork unitOfWork) : IHospitalDataService
    {
        /// <summary>
        /// Get all the hospitals
        /// </summary>
        /// <returns></returns>
        public async Task<IList<HospitalRegistration>> List()
        {
            return await unitOfWork.Repository<HospitalRegistration>().All().ToListAsync();
        }
    }
}
