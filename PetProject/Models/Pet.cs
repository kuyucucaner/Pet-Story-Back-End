using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Pet
{
    public int PetId { get; set; }

    public string? UserName { get; set; }

    public int? CategoryId { get; set; }

    public string? PetType { get; set; }

    public string? PetGenus { get; set; }

    public string? PetName { get; set; }

    public string? PetAge { get; set; }

    public bool? IsPetSick { get; set; }

    public string? PetColor { get; set; }

    public int PetStatusId { get; set; }

    public string? PetSeller { get; set; }

    public decimal? PetPrice { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<Basket> Baskets { get; set; } = new List<Basket>();

    public virtual Category? Category { get; set; }

    public virtual PetStatus PetStatus { get; set; } = null!;

    public virtual ICollection<Support> Supports { get; set; } = new List<Support>();
}
