using QuickHRP.Entities;
using QuickHRP.Message.Master;

namespace QuickHRP.DataAccess.Contract
{
    public interface IMasterDataService
    {
        IList<MaterDataDTO> GetMaterData(int hospitalId);

        MaterDataDTO GetMaterDataById(int id);

        Task<bool> AddMaterData(MaterDataDTO materData);

        Task<bool> UpdateMaterData(MaterDataDTO materData);

        Task<bool> DeleteMaterData(int id, int modifiedBy);

        Task<bool> InactiveMaterData(int id, int modifiedBy);
    }
}
