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
    public class SupportController : ControllerBase
    {
        private PetDatabaseContext _context;

        public SupportController(PetDatabaseContext context)
        {

            _context = context;
        }
        [HttpGet("SupportList")]
        public IEnumerable<Support> GetSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("SupportListNeed")]
        public IEnumerable<Support> GetNeedSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Destek").ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
  
        [HttpPost("CreateSupport")]
        public IActionResult PostSupoort(SupportDTO support)
        {
            var Support = new Support()

            {
                UserName = support.UserName,
                SupportType = "Destek",
                Name = support.Name,
                Email=support.Email,
                Message=support.Message,
                IsDeleted=false,

            };
            _context.Supports.Add(Support);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("CreateSupportVet")]
        public IActionResult PostSupportVet(SupportDTO support)
        {
            var Support = new Support()
            {
                UserName = support.UserName,
                SupportType = "Veteriner",
                Name =null,
                Email = support.Email,
                Message = support.Message,
                Subject =support.Subject,
                IsDeleted = false,

            };
            _context.Supports.Add(Support);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpGet("SupportListVet")]
        public IEnumerable<Support> GetVetSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Veteriner").ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpPost("CreateSupportConfirmOwner")]
        public IActionResult PostSupportConfirmOwner(PetDTO support)
        {
         
            var pet = _context.Pets.Where(x => x.PetId == support.PetId).SingleOrDefault();
            if (pet != null)
            {
                pet.PetStatusId = 1;
            }
           
            _context.SaveChanges();
            return NoContent();
        }
        [HttpPost("CreateSupportOwner")]
        public IActionResult PostSupportOwner(SupportDTO support)
        {
            var Support = new Support()
            {
                UserName = support.UserName,
                SupportType = "Sahiplenme",
                PetId=support.PetId,
                Name = support.Name,
                LastName=support.LastName,
                Age=support.Age,
                Job=support.Job,
                Email = support.Email,
                Address = null,
                Message = null,
                Subject = null,
                IsDeleted = false,

            };
            var pet = _context.Pets.Where(x => x.PetId == support.PetId).SingleOrDefault();
            pet.PetStatusId = 5;
          var user = _context.LoginUsers.FirstOrDefault(x => x.UserName == support.UserName);

            if (user != null)
            {
                user.IsOwnership = true;
            }

            _context.Supports.Add(Support);
            _context.SaveChanges();
            return NoContent();
        }
        [HttpGet("SupportListOwner")]
        public IEnumerable<Support> GetOwnerSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Sahiplenme").ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpPost("CreateSupportToBuyPet")]
        public IActionResult PostSupportToBuyPet(SupportDTO support)
        {
            var Support = new Support()
            {
                UserName = support.UserName,
                SupportType = "Satın Alma",
                PetId = support.PetId,
                Name = support.Name,
                LastName = support.LastName,
                Age = support.Age,
                Job = support.Job,
                Email = support.Email,
                Address = null,
                Message = null,
                Subject = null,
                IsDeleted = false,

            };
            var pet = _context.Pets.Where(x => x.PetId == support.PetId).SingleOrDefault();
            pet.PetStatusId = 6;
            var user = _context.LoginUsers.FirstOrDefault(x => x.UserName == support.UserName);
            if (user != null)
            {
                user.IsPurchase = true;
            }
            _context.Supports.Add(Support);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpGet("SupportListToBuyPet")]
        public IEnumerable<Support> GetToBuyPetSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Satın Alma" ).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpPost("CreateSupportToBuyItem")]
        public IActionResult PostSupportToBuyItem(SupportDTO support)
        {
            var Support = new Support()
            {
                UserName = support.UserName,
                SupportType = "Eşya",
                ItemId = support.ItemId,
                Name = support.Name,
                LastName = null,
                Age = null,
                Job = null,
                Email = null,
                Address = support.Address,
                PhoneNumber = support.PhoneNumber,
                Message = null,
                Subject = null,
                IsDeleted = false,
            };
            _context.Supports.Add(Support);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpGet("SupportListToBuyItem")]
        public IEnumerable<Support> GetToBuyItemSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Eşya").ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpPost("CreateSupportToBuyFood")]
        public IActionResult PostSupportToBuyFood(SupportDTO support)
        {
      
            var Support = new Support()

            { 
                UserName = support.UserName,
                SupportType = "Yemek",
                FoodId = support.FoodId,
                Name = support.Name,
                LastName = null,
                Age = null,
                Job = null,
                Email = null,
                Address = support.Address,
                PhoneNumber = support.PhoneNumber,
                Message = null,
                Subject = null,
                IsDeleted = false,
            };
            _context.Supports.Add(Support);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpGet("SupportListToBuyFood")]
        public IEnumerable<Support> GetToBuyFoodSupport()
        {
            try
            {
                return _context.Supports.Where(x => x.IsDeleted == false && x.SupportType == "Yemek").ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
    }   
}
