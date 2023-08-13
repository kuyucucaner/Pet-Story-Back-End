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
    public class ItemsController : ControllerBase
    {
        private PetDatabaseContext _context;

        public ItemsController(PetDatabaseContext context)
        {

            _context = context;
        }
        private bool ItemExists(int id)
        {
            return (_context.Items?.Any(e => e.ItemId == id)).GetValueOrDefault();
        }
        [HttpGet("ItemsList")]
        public IEnumerable<Item> GetItem()
        {
            try
            {
                return _context.Items.Include(a=> a.Category).Where(x => x.IsDeleted == false).ToList();
            }
            catch (Exception ee)
            {
                throw;
            }
        }
        [HttpGet("ItemsDetail")]
        public IActionResult GetItem(int id)
        {
            Item item = _context.Items.Where(x => x.ItemId == id && x.IsDeleted == false).FirstOrDefault();
            if (item == null)
                return NotFound("Eşya Bulunamadı.");
            return Ok(item);
        }
        [HttpPost("CreateItems")]
        public IActionResult PostItem(ItemDTO item)
        {
            var Items = new Item()
            {
                CategoryId = 5,
                ItemName = item.ItemName,
                ItemBrand = item.ItemBrand,
                ItemColor = item.ItemColor,
                ItemType = item.ItemType,
                ItemSize = item.ItemSize,
                ItemDescription = item.ItemDescription,
                ItemAmount = item.ItemAmount,
                ItemPrice = item.ItemPrice,
            };
            _context.Items.Add(Items);
            _context.SaveChanges();
         
            return NoContent();
        }
        [HttpPost("UpdateItems")]
        public IActionResult PostItem(int id, ItemDTO item)
        {
            var Items = new Item()
            {   ItemId = item.ItemId,
                CategoryId = item.CategoryId,
                ItemName = item.ItemName,
                ItemBrand = item.ItemBrand,
                ItemColor = item.ItemColor,
                ItemType = item.ItemType,
                ItemSize = item.ItemSize,
                ItemDescription = item.ItemDescription,
                ItemAmount = item.ItemAmount,
                ItemPrice = item.ItemPrice,
            };
            if (id != Items.ItemId)
            {
                return BadRequest();
            }

            _context.Entry(Items).State = EntityState.Modified;

            try
            {
                _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {

                if (!ItemExists(id))
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
        [HttpPost("UnStockItems")]
        public IActionResult PostItem(int id)
        {
            var item = _context.Items.Where(x => x.ItemId == id).SingleOrDefault();
            if (item == null)
            {
                return NotFound("Eşya Bulunamadı.");
            }
            item.IsStock = false;
            _context.SaveChanges();
            return NoContent();
        }
        [HttpPost("DeleteItems")]
        public IActionResult PostStockItem(int id)
        {
            var item = _context.Items.Where(x => x.ItemId == id).SingleOrDefault();
            if (item == null)
            {
                return NotFound("Eşya Bulunamadı.");
            }
            item.IsDeleted = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
