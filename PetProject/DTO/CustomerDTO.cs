namespace PetProject.DTO
{
    public class CustomerDTO
    {
        public int Id { get; set; }

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        public string? Address { get; set; }

        public string? City { get; set; }

        public string? PhoneNumber { get; set; }

        public int LoginUserId { get; set; }

        public string? Biography { get; set; }

        public bool IsDeleted { get; set; }

    }
}
