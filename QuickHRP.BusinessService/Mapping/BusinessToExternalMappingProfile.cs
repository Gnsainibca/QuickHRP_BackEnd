using AutoMapper;
using QuickHRP.Message.Master;

namespace QuickHRP.BusinessService.Mapping
{
    public class BusinessToExternalMappingProfile : Profile
    {
        public BusinessToExternalMappingProfile()
        {
            CreateMap<MaterDataDTO, MaterDataViewModel>().ReverseMap();
        }
    }
}