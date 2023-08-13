using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PetProject.DTO;

namespace PetProject.Controllers
{

    [EnableCors]
    [AllowAnonymous]
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DonateController : ControllerBase
    {
        private PetDatabaseContext _context;

        public DonateController(PetDatabaseContext context)
        {

            _context = context;
        }
        [HttpGet("DonateList")]
        public IEnumerable<Donate> Donates()
        {
            try
            {
                return _context.Donates.ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpPost("CreateDonate")]
        public IActionResult PostBasket(DonateDTO donate)
        {
            var Donate = new Donate()
            {
               Donate1=donate.Donate,
               Name=donate.Name,
               Email=donate.Email

            };
            _context.Donates.Add(Donate);
            _context.SaveChanges();

            return NoContent();
        }
    }
}
