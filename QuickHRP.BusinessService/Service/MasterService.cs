using AutoMapper;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Service;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities;
using QuickHRP.Message.Master;
using QuickHRP.MessageCore;

namespace QuickHRP.BusinessService.Service
{
    public class MasterService (IMasterDataService masterDataService, IMapper mapper) : IMasterService
    {
        private const int hospitalId = 1;
        private const int actionPerformedBy = 1;

        /// <summary>
        /// Get all the master data
        /// </summary>
        /// <param name="hospitalId"></param>
        /// <returns></returns>
        public ServiceResponseOf<IList<MasterDataViewModel>> GetMaterData()
        {
            var masterDataList = masterDataService.GetMaterData(hospitalId);
            var result = mapper.Map<IList<MasterDataViewModel>>(masterDataList);
            return ResponseHelpers.GetServiceResponse(() => result, "Failed to get master data list");
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ServiceResponseOf<MasterDataViewModel> GetMaterDataById(int id)
        {
            var masterData = masterDataService.GetMaterDataById(id);
            var result = mapper.Map<MasterDataViewModel>(masterData);
            return ResponseHelpers.GetServiceResponse(() => result, "Failed to get master data");
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> AddMaterData(MasterDataViewModel materData)
        {
            var masterData =  mapper.Map<MasterData>(materData);
            masterData.HospitalId = hospitalId;
            masterData.CreatedBy = actionPerformedBy;
            masterData.CreatedOn = DateTime.UtcNow;
            masterData.Inactive = false;
            masterData.IsDeleted = false;
            return await ResponseHelpers.GetServiceResponseAsync(() => masterDataService.AddMaterData(masterData), "Failed to add master data");

        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> UpdateMaterData(int id, MasterDataViewModel materData)
        {
            var masterData =  mapper.Map<MasterData>(materData);
            masterData.HospitalId = hospitalId;
            masterData.ModifiedBy = actionPerformedBy;
            masterData.ModifiedOn = DateTime.UtcNow;
            return await ResponseHelpers.GetServiceResponseAsync(() => masterDataService.UpdateMaterData(masterData), "Failed to add master data");
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> DeleteMaterData(int id)
        {
            return await ResponseHelpers.GetServiceResponseAsync(() => masterDataService.DeleteMaterData(id, actionPerformedBy, DateTime.UtcNow), "Failed to delete master data");
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> InactiveMaterData(int id)
        {
            return await ResponseHelpers.GetServiceResponseAsync(() => masterDataService.InactiveMaterData(id, actionPerformedBy, DateTime.UtcNow), "Failed to mark inactive master data");
        }
    }
}
