using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Customer
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

    public virtual ICollection<Basket> Baskets { get; set; } = new List<Basket>();

    public virtual LoginUser LoginUser { get; set; } = null!;
}
