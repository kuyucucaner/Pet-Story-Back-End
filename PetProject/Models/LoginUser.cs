﻿using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class LoginUser
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? PhoneNumber { get; set; }

    public string? Address { get; set; }

    public int RoleId { get; set; }

    public DateTime? CreateDate { get; set; }

    public bool IsOwnership { get; set; }

    public bool IsPurchase { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime? LastAddedDate { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual Role Role { get; set; } = null!;
}
