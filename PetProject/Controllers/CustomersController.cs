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
    public class CustomersController : ControllerBase
    {
        private PetDatabaseContext _context;

        public CustomersController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool CustomerExists(int id)
        {
            return (_context.Customers?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        [HttpGet("CustomersList")]
        public IEnumerable<Customer> GetCustomers()
        {
            try
            {
                return _context.Customers.Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("CustomerDetail")]
        public IActionResult GetFood(int id)
        {
            Customer customer = _context.Customers.Where(x => x.Id == id && x.IsDeleted == false).FirstOrDefault();
            if (customer == null)
                return NotFound("Müşteri Bulunamadı.");
            return Ok(customer);
        }
        [HttpPost("CreateCustomer")]
        public IActionResult PostCustomer(CustomerDTO customer)
        {
            var Customer = new Customer()
            {
              FirstName = customer.FirstName,
              LastName =  null,
              Address=customer.Address,
              City=null,
              PhoneNumber=customer.PhoneNumber, 
              LoginUserId=2,
              Biography=null,
              IsDeleted=false


            };
            _context.Customers.Add(Customer);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("UpdateCustomer")]
        public IActionResult PostCustomer(int id, CustomerDTO customer)
        {
            var Customer = new Customer()
            {   Id=customer.Id,
                FirstName = customer.FirstName,
                LastName = customer.LastName,
                Address = customer.Address,
                City = customer.City,
                PhoneNumber = customer.PhoneNumber,
                LoginUserId = customer.LoginUserId,
                Biography = customer.Biography,
                IsDeleted = customer.IsDeleted


            };
            if (id != Customer.Id)
            {
                return BadRequest();
            }

            _context.Entry(Customer).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!CustomerExists(id))
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
        [HttpPost("DeleteCustomer")]
        public IActionResult PostCustomer(int id)
        {
            var customer = _context.Customers.Where(x => x.Id == id).SingleOrDefault();
            if (customer == null)
            {
                return NotFound("Müşteri Bulunamadı.");
            }
            customer.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
