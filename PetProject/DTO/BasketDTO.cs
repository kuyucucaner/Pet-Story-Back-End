namespace PetProject.DTO
{
    public class BasketDTO
    {
        public int Id { get; set; }

        public int Amount { get; set; }

        public decimal Price { get; set; }

        public int CustomerId { get; set; }

        public int? FoodId { get; set; }

        public int? PetId { get; set; }

        public int? ItemId { get; set; }

        public bool IsDeleted { get; set; }
    }
}
