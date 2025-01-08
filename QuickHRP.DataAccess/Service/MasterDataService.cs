using QuickHRP.DataAccess.Contract;
using QuickHRP.Entities;

namespace QuickHRP.DataAccess.Service
{
    public class MasterDataService(IDatabaseUnitOfWork unitOfWork) : IMasterDataService
    {
        /// <summary>
        /// Get all the master data
        /// </summary>
        /// <param name="hospitalId"></param>
        /// <returns></returns>
        public IList<MasterData> GetMaterData(int hospitalId)
        {
            return unitOfWork.Repository<MasterData>().All().Where(masterData => masterData.HospitalId == hospitalId).ToList();
        }

        /// <summary>
        /// Get Mater Data By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MasterData GetMaterDataById(int id)
        {
            return unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> AddMaterData(MasterData masterData)
        {
            unitOfWork.Repository<MasterData>().Insert(masterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> UpdateMaterData(MasterData materData)
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
        public async Task<bool> DeleteMaterData(int id, int modifiedBy, DateTime modifiedOn)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
            dbMasterData.IsDeleted = true;
            dbMasterData.ModifiedBy = modifiedBy;
            dbMasterData.ModifiedOn = modifiedOn;
            unitOfWork.Repository<MasterData>().Update(dbMasterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> InactiveMaterData(int id, int modifiedBy, DateTime modifiedOn)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(masterData => masterData.Id == id);
            dbMasterData.Inactive = true;
            dbMasterData.ModifiedBy = modifiedBy;
            dbMasterData.ModifiedOn = modifiedOn;
            unitOfWork.Repository<MasterData>().Update(dbMasterData);
            return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
        }
    }
}
