using QuickHRP.Message.Master;

namespace QuickHRP.BusinessService.Contract
{
    public interface IMasterService
    {
        IList<MasterDataViewModel> GetMaterData();

        MasterDataViewModel GetMaterDataById(int id);

        Task<bool> AddMaterData(MasterDataViewModel materData);

        Task<bool> UpdateMaterData(int id, MasterDataViewModel materData);

        Task<bool> DeleteMaterData(int id);

        Task<bool> InactiveMaterData(int id);
    }
}
