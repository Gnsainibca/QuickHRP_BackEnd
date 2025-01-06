using QuickHRP.Message.Master;

namespace QuickHRP.BusinessService.Contract
{
    public interface IMasterService
    {
        IList<MaterDataDTO> GetMaterData();

        MaterDataDTO GetMaterDataById(int id);

        Task<bool> AddMaterData(MaterDataViewModel materData);

        Task<bool> UpdateMaterData(int id, MaterDataViewModel materData);

        Task<bool> DeleteMaterData(int id);

        Task<bool> InactiveMaterData(int id);
    }
}
