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
    public class BasketsController : ControllerBase
    {
        private PetDatabaseContext _context;

        public BasketsController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool BasketExists(int id)
        {
            return (_context.Baskets?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        [HttpGet("BasketsList")]
        public IEnumerable<Basket> GetBaskets()
        {
            try
            {
                return _context.Baskets.Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("BasketDetail")]
        public IActionResult GetBasket(int id)
        {
            Basket basket = _context.Baskets.Where(x => x.Id == id && x.IsDeleted == false).FirstOrDefault();
            if (basket == null)
                return NotFound("Sepet Bulunamadı.");
            return Ok(basket);
        }
        [HttpPost("CreateBasket")]
        public IActionResult PostBasket(BasketDTO basket)
        {
            var Basket = new Basket()
            {
                Amount = basket.Amount,
                Price =basket.Price,
                CustomerId = basket.CustomerId,
                FoodId=basket.FoodId,
                PetId=basket.PetId,
                ItemId=basket.ItemId,
                IsDeleted=basket.IsDeleted,
            };
            _context.Baskets.Add(Basket);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("UpdateBasket")]
        public IActionResult PostBasket(int id, BasketDTO  basket)
        {
            var Basket = new Basket()
            {   Id=basket.Id,
                Amount = basket.Amount,
                Price = basket.Price,
                CustomerId = basket.CustomerId,
                FoodId = basket.FoodId,
                PetId = basket.PetId,
                ItemId = basket.ItemId,
                IsDeleted = basket.IsDeleted,
            };
            if (id != Basket.Id)
            {
                return BadRequest();
            }

            _context.Entry(Basket).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!BasketExists(id))
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
        [HttpPost("DeleteBasket")]
        public IActionResult PostBasket(int id)
        {
            var basket = _context.Baskets.Where(x => x.Id == id).SingleOrDefault();
            if (basket == null)
            {
                return NotFound("Sepet Bulunamadı.");
            }
            basket.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
