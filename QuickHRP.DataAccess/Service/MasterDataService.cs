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
            return [.. unitOfWork.Repository<MasterData>().All()
                .Where(x => x.HospitalId == hospitalId && !x.IsDeleted)
                .OrderBy(x => x.TypeId)
                .ThenBy(x => x.OrderNumber)
                .ThenBy(x => x.MasterType.Name)];
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
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(x => x.Id == materData.Id);
            if (dbMasterData != null)
            {
                dbMasterData.ParentId1 = materData.ParentId1;
                dbMasterData.ParentId2 = materData.ParentId2;
                dbMasterData.Field1 = materData.Field1;
                dbMasterData.Field2 = materData.Field2;
                dbMasterData.Field3 = materData.Field3;
                dbMasterData.Field4 = materData.Field4;
                dbMasterData.OrderNumber = materData.OrderNumber;
                dbMasterData.ModifiedBy = materData.ModifiedBy;
                dbMasterData.ModifiedOn = materData.ModifiedOn;
                unitOfWork.Repository<MasterData>().Update(dbMasterData);
                return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
            }
            return false;
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> DeleteMaterData(int id, int modifiedBy, DateTime modifiedOn)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(x => x.Id == id);
            if (dbMasterData != null)
            {
                dbMasterData.IsDeleted = true;
                dbMasterData.ModifiedBy = modifiedBy;
                dbMasterData.ModifiedOn = modifiedOn;
                unitOfWork.Repository<MasterData>().Update(dbMasterData);
                return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
            }
            return false;
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        public async Task<bool> InactiveMaterData(int id, int modifiedBy, DateTime modifiedOn)
        {
            var dbMasterData = unitOfWork.Repository<MasterData>().GetSingleOrDefault(x => x.Id == id);
            if (dbMasterData != null)
            {
                dbMasterData.Inactive = true;
                dbMasterData.ModifiedBy = modifiedBy;
                dbMasterData.ModifiedOn = modifiedOn;
                unitOfWork.Repository<MasterData>().Update(dbMasterData);
                return Convert.ToBoolean(await unitOfWork.SaveChangesAsync());
            }
            return false;
        }
    }
}
