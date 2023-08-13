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
    public class FoodsController : ControllerBase
    {
        private PetDatabaseContext _context;

        public FoodsController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool FoodExists(int id)
        {
            return (_context.Foods?.Any(e => e.FoodId == id)).GetValueOrDefault();
        }
        [HttpGet("FoodsList")]
        public IEnumerable<Food> GetFood()
        {
            try
            {
                return _context.Foods.Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("FoodsDetail")]
        public IActionResult GetFood(int id)
        {
            Food food = _context.Foods.Where(x => x.FoodId == id && x.IsDeleted == false).FirstOrDefault();
            if (food == null)
                return NotFound("Yemek Bulunamadı.");
            return Ok(food);
        }
        [HttpPost("CreateFoods")]
        public IActionResult PostFood(FoodDTO food)
        {
            var Foods = new Food()
            {   CategoryId=2,
                FoodName=food.FoodName,
                FoodType=food.FoodType,
                FoodWeight=food.FoodWeight,
                FoodAmount=food.FoodAmount,
                FoodDescription=food.FoodDescription,
                FoodBrand=food.FoodBrand,
                FoodPrice=food.FoodPrice,
            
            };
            _context.Foods.Add(Foods);
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPost("UpdateFoods")]
        public IActionResult PostFood(int id, FoodDTO food)
        {
            var Foods = new Food()
            {
                FoodId = food.FoodId,
                CategoryId = food.CategoryId,
                FoodName = food.FoodName,
                FoodType = food.FoodType,
                FoodWeight = food.FoodWeight,
                FoodAmount = food.FoodAmount,
                FoodDescription = food.FoodDescription,
                FoodBrand = food.FoodBrand,
                FoodPrice = food.FoodPrice,
            };
            if (id != Foods.FoodId)
            {
                return BadRequest();
            }

            _context.Entry(Foods).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!FoodExists(id))
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
        [HttpPost("DeleteFoods")]
        public IActionResult PostFood(int id)
        {
            var food = _context.Foods.Where(x => x.FoodId == id).SingleOrDefault();
            if (food == null)
            {
                return NotFound("Yemek Bulunamadı.");
            }
            food.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
