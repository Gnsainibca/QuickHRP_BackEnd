using AutoMapper;
using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities;
using QuickHRP.Message.Master;

namespace QuickHRP.DataAccess.Service
{
    public class MasterDataService(IDatabaseUnitOfWork unitOfWork, IMapper mapper) : IMasterDataService
    {
        /// <summary>
        /// Get all the master data
        /// </summary>
        /// <param name="hospitalId"></param>
        /// <returns></returns>
        public IList<MaterDataDTO> GetMaterData(int hospitalId)
        {
            var masterData = unitOfWork.Repository<MasterData>().All().Where(masterData => masterData.HospitalId == hospitalId);
            return mapper.Map<IList<MaterDataDTO>>(masterData);
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MaterDataDTO GetMaterDataById(int id)
        {
            var masterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
            return mapper.Map<MaterDataDTO>(masterData);
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> AddMaterData(MaterDataDTO materDataDto)
        {
            var materData = mapper.Map<MasterData>(materDataDto);
            unitOfWork.Repository<MasterData>().Insert(materData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> UpdateMaterData(MaterDataDTO materData)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == materData.Id);
            dbMasterData.ParentId = materData.ParentId;
            dbMasterData.Name = materData.Name;
            dbMasterData.Description = materData.Name;
            dbMasterData.ModifiedBy = materData.ModifiedBy;
            dbMasterData.ModifiedOn = materData.ModifiedOn;
            unitOfWork.Repository<MasterData>().Update(dbMasterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> DeleteMaterData(int id, int modifiedBy)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
            dbMasterData.IsDeleted = true;
            dbMasterData.ModifiedBy = modifiedBy;
            dbMasterData.ModifiedOn = DateTime.UtcNow;
            unitOfWork.Repository<MasterData>().Update(dbMasterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> InactiveMaterData(int id, int modifiedBy)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
            dbMasterData.Inactive = true;
            dbMasterData.ModifiedBy = modifiedBy;
            dbMasterData.ModifiedOn = DateTime.UtcNow;
            unitOfWork.Repository<MasterData>().Update(dbMasterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }
    }
}
