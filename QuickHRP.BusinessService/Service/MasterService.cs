using AutoMapper;
using QuickHRP.BusinessService.Contract;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities;
using QuickHRP.Message.Master;

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
        public IList<MasterDataViewModel> GetMaterData()
        {
            var masterDataList = masterDataService.GetMaterData(hospitalId);
            return mapper.Map<IList<MasterDataViewModel>>(masterDataList);
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MasterDataViewModel GetMaterDataById(int id)
        {
            var masterData = masterDataService.GetMaterDataById(id);
            return mapper.Map<MasterDataViewModel>(masterData);
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> AddMaterData(MasterDataViewModel materData)
        {
            var masterData =  mapper.Map<MasterData>(materData);
            masterData.HospitalId = hospitalId;
            masterData.CreatedBy = actionPerformedBy;
            masterData.CreatedOn = DateTime.UtcNow;
            masterData.Inactive = false;
            masterData.IsDeleted = false;
            return await masterDataService.AddMaterData(masterData);
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> UpdateMaterData(int id, MasterDataViewModel materData)
        {
            var masterData =  mapper.Map<MasterData>(materData);
            masterData.HospitalId = hospitalId;
            masterData.ModifiedBy = actionPerformedBy;
            masterData.ModifiedOn = DateTime.UtcNow;
            return await masterDataService.UpdateMaterData(masterData);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> DeleteMaterData(int id)
        {
            return await masterDataService.DeleteMaterData(id, actionPerformedBy, DateTime.UtcNow);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> InactiveMaterData(int id)
        {
            return await masterDataService.InactiveMaterData(id, actionPerformedBy, DateTime.UtcNow);
        }
    }
}
