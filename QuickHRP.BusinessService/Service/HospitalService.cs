using AutoMapper;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Service;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities.Hospital;
using QuickHRP.MessageCore;

namespace QuickHRP.BusinessService.Service
{
    public class HospitalService(IHospitalDataService hospitalDataService, IMapper mapper) : IHospitalService
    {
        /// <summary>
        /// Get all the hospitals
        /// </summary>
        /// <returns></returns>
        public async Task<ServiceResponseOf<IList<HospitalRegistrationViewModel>>> List()
        {
            var result = await hospitalDataService.List();
            return ResponseHelpers.GetServiceResponse(() => mapper.Map<IList<HospitalRegistrationViewModel>>(result), "Failed to get master data list");
        }
    }
}
