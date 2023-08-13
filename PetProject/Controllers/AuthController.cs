using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetProject.DTO;

namespace PetProject.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private PetDatabaseContext _context;

        public AuthController(PetDatabaseContext context)
        {
            _context = context;
        }
        [HttpGet("GetRoleType")]
        public async Task<Role> GetRoleType(int id)
        {
            var role = await _context.Roles.SingleOrDefaultAsync(x => x.Id == id);
            return role;
        }
        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login([FromBody] LoginUserDTO model)
        {
            LoginUser loginuser = await _context.LoginUsers.FirstOrDefaultAsync(x => x.UserName == model.UserName && x.Password == model.Password);

            if (loginuser != null)
            {
                return Ok(new { hata = true });
            }
            else
            {
                return Ok(new { hata = false });
            }

        }
    }
}
