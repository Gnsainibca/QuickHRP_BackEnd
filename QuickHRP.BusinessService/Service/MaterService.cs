using AutoMapper;
using QuickHRP.BusinessService.Contract;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Message.Master;

namespace QuickHRP.BusinessService.Service
{
    public class MaterService (IMasterDataService masterDataService, IMapper mapper) : IMasterService
    {
        private const int hospitalId = 1;
        private const int modifiedBy = 1;

        /// <summary>
        /// Get all the master data
        /// </summary>
        /// <param name="hospitalId"></param>
        /// <returns></returns>
        public IList<MaterDataDTO> GetMaterData()
        {
            return masterDataService.GetMaterData(hospitalId);
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MaterDataDTO GetMaterDataById(int id)
        {
            return masterDataService.GetMaterDataById(id);
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> AddMaterData(MaterDataViewModel materData)
        {
            var masterDataDto =  mapper.Map<MaterDataDTO>(materData);
            return await masterDataService.AddMaterData(masterDataDto);
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> UpdateMaterData(int id, MaterDataViewModel materData)
        {
            var masterDataDto =  mapper.Map<MaterDataDTO>(materData);
            return await masterDataService.UpdateMaterData(masterDataDto);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> DeleteMaterData(int id)
        {
            
            return await masterDataService.DeleteMaterData(id, modifiedBy);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> InactiveMaterData(int id)
        {
            return await masterDataService.InactiveMaterData(id, modifiedBy);
        }
    }
}
