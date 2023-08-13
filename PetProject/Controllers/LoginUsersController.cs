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
    public class LoginUsersController : ControllerBase
    {
        private PetDatabaseContext _context;

        public LoginUsersController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool LoginUserExists(int id)
        {
            return (_context.LoginUsers?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        private bool LoginUserExists2(string username)
        {
            return (_context.LoginUsers?.Any(e => e.UserName == username)).GetValueOrDefault();
        }
        [HttpGet("LoginUserList")]
        public IEnumerable<LoginUser> GetLoginUser()
        {
            try
            {
                return _context.LoginUsers.Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
    
        }
        [HttpGet("VetList")]
        public IEnumerable<LoginUser> GetVet()
        {
            try
            {
                return _context.LoginUsers.Include(a=>a.Role).Where(x => x.IsDeleted == false && x.RoleId == 4  ).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }

        }
        [HttpGet("LoginUserDetail")]
        public IActionResult GetLoginUser(string name)
        {
            LoginUser loginuser = _context.LoginUsers.Where(x => x.UserName == name && x.IsDeleted == false).FirstOrDefault();
            if (loginuser == null)
                return NotFound("Kullanıcı Bulunamadı.");
            return Ok(loginuser);
        }
        [HttpPost("CreateLoginUser")]
        public IActionResult PostLoginUser(LoginUserDTO loginuser)
        {
            var LoginUser = new LoginUser()
            {
                UserName = loginuser.UserName,
                Password = loginuser.Password,
                FirstName = loginuser.FirstName,
                LastName = loginuser.LastName,
                PhoneNumber=loginuser.PhoneNumber,
                Address=loginuser.Address,
                RoleId = 2,
                CreateDate = DateTime.Now,
                IsDeleted = false
            };
       
            _context.LoginUsers.Add(LoginUser);
            _context.SaveChanges();



            return NoContent();
        }
        [HttpPost("UpdateLoginUser")]
        public IActionResult PostLoginUser(int id, LoginUserDTO loginuser)
        {
            var LoginUser = new LoginUser()
            {   Id=loginuser.Id,
                UserName = loginuser.UserName,
                Password = loginuser.Password,
                RoleId = loginuser.RoleId,
                CreateDate = loginuser.CreateDate
            };
            if (id != LoginUser.Id)
            {
                return BadRequest();
            }

            _context.Entry(LoginUser).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!LoginUserExists(id))
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
        [HttpPost("DeleteLoginUser")]
        public IActionResult PostLoginUser(int id)
        {
            var loginuser = _context.LoginUsers.Where(x => x.Id == id).SingleOrDefault();
            if (loginuser == null)
            {
                return NotFound("Kullanıcı Bulunamadı.");
            }
            loginuser.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }


    }
}
