using QuickHRP.Message.Master;
using QuickHRP.MessageCore;

namespace QuickHRP.BusinessService.Contract
{
    public interface IMasterService
    {
        ServiceResponseOf<IList<MasterDataViewModel>> GetMaterData();

        ServiceResponseOf<MasterDataViewModel> GetMaterDataById(int id);

        Task<ServiceResponseOf<bool>> AddMaterData(MasterDataViewModel materData);

        Task<ServiceResponseOf<bool>> UpdateMaterData(int id, MasterDataViewModel materData);

        Task<ServiceResponseOf<bool>> DeleteMaterData(int id);

        Task<ServiceResponseOf<bool>> InactiveMaterData(int id);
    }
}
