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
    public class VeterinaryController : ControllerBase
    {
        private PetDatabaseContext _context;

        public VeterinaryController(PetDatabaseContext context)
        {

            _context = context;
        }
        [HttpGet("VetList")]
        public IEnumerable<Veterinary> GetVet()
        {
            try
            {
                return _context.Veterinaries.Where(x => x.IsActive == true).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }

        }
        [HttpPost("CreateVet")]
        public IActionResult PostVeterinary(VeterinaryDTO vet)
        {
            var Veterinary = new Veterinary()
            {
                UserName = vet.UserName,
                LastName = vet.LastName,
                Email=vet.Email,
                Age = vet.Age,
                Education = vet.Education,
                IsActive = true
            };
            _context.Veterinaries.Add(Veterinary);
            _context.SaveChanges();

            return NoContent();
        }

    }
}
