using AutoMapper;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core.Caching;
using QuickHRP.Core.Service;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities;
using QuickHRP.Message.Master;
using QuickHRP.MessageCore;

namespace QuickHRP.BusinessService.Service
{
    public class MasterService(IMasterDataService masterDataService, IMapper mapper) : IMasterService
    {
        private const int hospitalId = 1;
        private const int actionPerformedBy = 1;
        private static readonly SimpleCache _cache = new();
        private static readonly string key = $"MasterData_HOSPID_{hospitalId}";

        /// <summary>
        /// Get all the master data
        /// </summary>
        /// <param name="hospitalId"></param>
        /// <returns></returns>
        public ServiceResponseOf<IList<MasterDataViewModel>> GetMaterData()
        {
            return ResponseHelpers.GetServiceResponse(() => GetCachedMasterData(), "Failed to get master data list");
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ServiceResponseOf<MasterDataViewModel> GetMaterDataById(int id)
        {
            var result = GetCachedMasterData().First(x => x.Id == id);
            return ResponseHelpers.GetServiceResponse(() => result, "Failed to get master data");
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> AddMaterData(MasterDataViewModel materData)
        {
            var masterData = mapper.Map<MasterData>(materData);
            masterData.HospitalId = hospitalId;
            masterData.CreatedBy = actionPerformedBy;
            masterData.CreatedOn = DateTime.UtcNow;
            masterData.Inactive = false;
            masterData.IsDeleted = false;
            var hasAdded = await masterDataService.AddMaterData(masterData);
            if (hasAdded)
            {
                _cache.Remove(key);
                _ = Task.Run(GetCachedMasterData);
            }
            return await ResponseHelpers.GetServiceResponseAsync(() => Task.FromResult(hasAdded), "Failed to add master data");
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> UpdateMaterData(int id, MasterDataViewModel materData)
        {
            var masterData = mapper.Map<MasterData>(materData);
            masterData.ModifiedBy = actionPerformedBy;
            masterData.ModifiedOn = DateTime.UtcNow;

            var hasUpdated = await masterDataService.UpdateMaterData(masterData);
            if (hasUpdated)
            {
                _cache.Remove(key);
                _ = Task.Run(GetCachedMasterData);
            }
            return await ResponseHelpers.GetServiceResponseAsync(() => Task.FromResult(hasUpdated), "Failed to update master data");
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<ServiceResponseOf<bool>> DeleteMaterData(int id)
        {
            var hasDeleted = await masterDataService.DeleteMaterData(id, actionPerformedBy, DateTime.UtcNow);
            if (hasDeleted)
            {
                _cache.Remove(key);
                _ = Task.Run(GetCachedMasterData);
            }
            return await ResponseHelpers.GetServiceResponseAsync(() => Task.FromResult(hasDeleted), "Failed to delete master data");
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

        private IList<MasterDataViewModel> GetCachedMasterData()
        {
            return _cache.Get(key, fun =>
            {
                var result = masterDataService.GetMaterData(hospitalId);
                return mapper.Map<IList<MasterDataViewModel>>(result);
            }, 30, 30);
        }
    }
}
