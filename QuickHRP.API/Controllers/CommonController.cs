using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Entities;
using QuickHRP.Message.Master;

namespace QuickHRP.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommonController (IMasterService masterService, IMapper mapper) : ControllerBase
    {
        [HttpGet]
        [Route("MaterData/GetAll")]
        public IEnumerable<MaterDataViewModel> GetMasterData()
        {
            var masterData = masterService.GetMaterData();
            return mapper.Map<IList<MaterDataViewModel>>(masterData);
        }

        [HttpGet]
        [Route("MasterData/Get/{id}")]
        public MaterDataViewModel GetMaterDataById(int id)
        {
            var masterData = masterService.GetMaterDataById(id);
            return mapper.Map<MaterDataViewModel>(masterData);
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("MaterData/Add")]
        public async Task<bool> AddMaterData(MaterDataViewModel materData)
        {
            return await masterService.AddMaterData(materData);
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("MaterData/Update/{id}")]
        public async Task<bool> UpdateMaterData(int id, [FromBody] MaterDataViewModel materData)
        {
            return await masterService.UpdateMaterData(id, materData);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("MaterData/Delete/{id}")]
        public async Task<bool> DeleteMaterData(int id)
        {
            return await masterService.DeleteMaterData(id);
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("MaterData/Inactive/{id}")]
        public async Task<bool> InactiveMaterData(int id)
        {
            return await masterService.InactiveMaterData(id);
        }
    }
}
