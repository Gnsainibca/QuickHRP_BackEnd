using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuickHRP.BusinessService.Contract;
using QuickHRP.Core;
using QuickHRP.Core.Permission.AuthUtils.PolicyProvider;
using QuickHRP.Message.Master;

namespace QuickHRP.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class MasterController (IMasterService masterService) : ControllerBase
    {
        [HttpGet]
        [Route("MaterData/GetAll")]
        //[PermissionAuthorize(PermissionOperator.Or, Permissions.Setup.View)]
        [PermissionAuthorize(Permissions.Setup.View)]
        public IActionResult GetMasterData()
        {
            return Ok(masterService.GetMaterData());
        }

        [HttpGet]
        [Route("MasterData/Get/{id}")]
        [PermissionAuthorize(Permissions.Setup.View)]
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
        [PermissionAuthorize(Permissions.Setup.Create)]
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
        [PermissionAuthorize(Permissions.Setup.Edit)]
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
        [PermissionAuthorize(Permissions.Setup.Delete)]
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
        [PermissionAuthorize(Permissions.Setup.Edit)]
        public async Task<IActionResult> InactiveMaterData(int id)
        {
            return Ok(await masterService.InactiveMaterData(id));
        }
    }
}
