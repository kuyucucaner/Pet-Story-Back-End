namespace PetProject.DTO
{
    public class FoodDTO
    {
        public int FoodId { get; set; }

        public int? CategoryId { get; set; }

        public string? FoodName { get; set; }

        public string? FoodType { get; set; }

        public string? FoodWeight { get; set; }

        public int? FoodAmount { get; set; }

        public string? FoodDescription { get; set; }

        public string? FoodBrand { get; set; }

        public decimal? FoodPrice { get; set; }

        public bool IsDeleted { get; set; }
    }
}
