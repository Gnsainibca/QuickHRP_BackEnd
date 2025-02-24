using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuickHRP.BusinessService.Contract;

namespace QuickHRP.API.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    [Route("api/[controller]")]
    [ApiController]
    public class HospitalController(IHospitalService hospitalService) : ControllerBase
    {
        [HttpGet]
        [Route("list")]
        public async Task<IActionResult> Get()
        {
           return Ok(await hospitalService.List());
        }
    }
}