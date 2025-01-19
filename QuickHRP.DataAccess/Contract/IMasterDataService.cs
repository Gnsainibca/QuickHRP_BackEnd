using QuickHRP.Entities;

namespace QuickHRP.DataAccess.Contract
{
    public interface IMasterDataService
    {
        IList<MasterData> GetMaterData(int hospitalId);

        Task<bool> AddMaterData(MasterData materData);

        Task<bool> UpdateMaterData(MasterData materData);

        Task<bool> DeleteMaterData(int id, int modifiedBy, DateTime modifiedOn);

        Task<bool> InactiveMaterData(int id, int modifiedBy, DateTime modifiedOn);
    }
}
