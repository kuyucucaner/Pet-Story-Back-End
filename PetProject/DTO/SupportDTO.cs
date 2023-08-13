namespace PetProject.DTO
{
    public class SupportDTO
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? SupportType { get; set; }

        public int? FoodId { get; set; }

        public int? PetId { get; set; }

        public int? ItemId { get; set; }

        public string? Name { get; set; }

        public string? LastName { get; set; }

        public string? Age { get; set; }

        public string? Job { get; set; }

        public string? Email { get; set; }

        public string? Subject { get; set; }

        public string? Message { get; set; }
        public string? PhoneNumber { get; set; }

        public string? Address { get; set; }

        public bool IsDeleted { get; set; }
    }
}
