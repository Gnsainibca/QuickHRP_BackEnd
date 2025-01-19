using Microsoft.AspNetCore.Mvc;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Message.Master;

namespace QuickHRP.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MasterController (IMasterService masterService) : ControllerBase
    {
        [HttpGet]
        [Route("MaterData/GetAll")]
        public IActionResult GetMasterData()
        {
            return Ok(masterService.GetMaterData());
        }

        [HttpGet]
        [Route("MasterData/Get/{id}")]
        public IActionResult GetMaterDataById(int id)
        {
            return Ok(masterService.GetMaterDataById(id));
        }

        /// <summary>
        /// Add Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("MaterData/Add")]
        public async Task<IActionResult> AddMaterData(MasterDataViewModel materData)
        {
            return Ok(await masterService.AddMaterData(materData));
        }

        /// <summary>
        /// Update Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("MaterData/Update/{id}")]
        public async Task<IActionResult> UpdateMaterData(int id, [FromBody] MasterDataViewModel materData)
        {
            return Ok(await masterService.UpdateMaterData(id, materData));
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("MaterData/Delete/{id}")]
        public async Task<IActionResult> DeleteMaterData(int id)
        {
            return Ok(await masterService.DeleteMaterData(id));
        }

        /// <summary>
        /// Delete Mater Data
        /// </summary>
        /// <param name="materData"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("MaterData/Inactive/{id}")]
        public async Task<IActionResult> InactiveMaterData(int id)
        {
            return Ok(await masterService.InactiveMaterData(id));
        }
    }
}
