using AutoMapper;
using QuickHRP.Entities;
using QuickHRP.Message.Master;

namespace QuickHRP.DataAccess.Mapping
{
    public class DTOToEntityMappingProfile : Profile
    {
        public DTOToEntityMappingProfile()
        {
            CreateMap<MasterData, MaterDataDTO>()
               //.ForMember(dest => dest.testid, memberOptions => memberOptions.MapFrom(src => (src.TypeId + 10)))
                .ReverseMap();
        }
    }
}