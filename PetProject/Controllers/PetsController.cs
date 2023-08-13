using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetProject.DTO;

namespace PetProject.Controllers
{
    [EnableCors]
    [AllowAnonymous]
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PetsController : ControllerBase
    {
        private PetDatabaseContext _context;

        public PetsController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool PetExists(int id)
        {
            return (_context.Pets?.Any(e => e.PetId == id)).GetValueOrDefault();
        }
        [HttpGet("PetsList")]
        public IEnumerable<Pet> GetPet()
        {
            try
            {
                return _context.Pets.Include(a=> a.PetStatus).Where(x => x.IsDeleted == false && (  x.PetStatusId == 2 || x.PetStatusId == 5)).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("PetShopList")]
        public IEnumerable<Pet> GetPetShop()
        {
            try
            {
                return _context.Pets.Include(a => a.PetStatus).Where(x => x.IsDeleted == false && (x.PetStatusId == 3 || x.PetStatusId == 6)).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("PetsDetail")]
        public IActionResult GetPet(int id)
        {
            Pet pet = _context.Pets.Where(x => x.PetId == id && x.IsDeleted == false).FirstOrDefault();
            if (pet == null)
                return NotFound("Hayvan Bulunamadı.");
            return Ok(pet);
        }
        [HttpPost("CreatePets")]
        public IActionResult PostPet(PetDTO pet)
        {
            var Pets = new Pet()
            {   UserName=pet.UserName,
                CategoryId =1,
                PetType=pet.PetType,
                PetGenus=pet.PetGenus,
                PetName=pet.PetName,
                PetAge=pet.PetAge,
                IsPetSick=pet.IsPetSick,
                PetColor=pet.PetColor,
                PetStatusId=2,
            };

            var user = _context.LoginUsers.FirstOrDefault(x => x.UserName == pet.UserName);
            if (user != null)
            {
                if (user.LastAddedDate != null && (DateTime.Now - user.LastAddedDate.Value).TotalDays < 30)
                {
                    return BadRequest("Son eklemeden sonra bir ay geçmedi!");
                }

                user.LastAddedDate = DateTime.Now;
            }
            _context.Pets.Add(Pets);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("CreateForSalePets")]
        public IActionResult PostPet2(PetDTO pet)
        {
            var Pets = new Pet()
            {
                UserName = "Admin",
                CategoryId = 1,
                PetType = pet.PetType,
                PetGenus = pet.PetGenus,
                PetName = pet.PetName,
                PetAge = pet.PetAge,
                IsPetSick = pet.IsPetSick,
                PetColor = pet.PetColor,
                PetSeller= pet.PetSeller,
                PetPrice= pet.PetPrice,
                PetStatusId = 3,
            };
            _context.Pets.Add(Pets);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("UpdatePets")]
        public IActionResult PostPet(int id, PetDTO pet)
        {
            var Pets = new Pet()
            {
                PetId = pet.PetId,
                CategoryId = pet.CategoryId,
                PetType = pet.PetType,
                PetGenus = pet.PetGenus,
                PetName = pet.PetName,
                PetAge = pet.PetAge,
                IsPetSick = pet.IsPetSick,
                PetColor = pet.PetColor,
                PetStatusId = pet.PetStatusId,
                PetPrice = pet.PetPrice,
                IsDeleted = false,
            };
            if (id != Pets.PetId)
            {
                return BadRequest();
            }

            _context.Entry(Pets).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!PetExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        [HttpPost("DeletePets")]
        public IActionResult PostPet(int id)
        {
            var pet = _context.Pets.Where(x => x.PetId == id).SingleOrDefault();
            if (pet == null)
            {
                return NotFound("Hayvan Bulunamadı.");
            }
            pet.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
