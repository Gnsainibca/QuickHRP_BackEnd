using AutoMapper;
using QuickHRP.Entities;
using QuickHRP.Message.Master;

namespace QuickHRP.BusinessService.Mapping
{
    public class BusinessToExternalMappingProfile : Profile
    {
        public BusinessToExternalMappingProfile()
        {
            CreateMap<MasterData, MasterDataViewModel>().ReverseMap();
        }
    }
}