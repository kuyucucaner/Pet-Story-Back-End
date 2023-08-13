namespace PetProject.DTO
{
    public class ItemDTO
    {
        public int ItemId { get; set; }

        public int? CategoryId { get; set; }

        public string? ItemName { get; set; }

        public string? ItemBrand { get; set; }

        public string? ItemColor { get; set; }

        public string? ItemType { get; set; }

        public string? ItemSize { get; set; }

        public string? ItemDescription { get; set; }

        public int? ItemAmount { get; set; }

        public decimal? ItemPrice { get; set; }

        public bool? IsStock { get; set; }

        public bool IsDeleted { get; set; }
    }
}
