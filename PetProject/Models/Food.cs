using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Food
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

    public virtual ICollection<Basket> Baskets { get; set; } = new List<Basket>();

    public virtual Category? Category { get; set; }

    public virtual ICollection<Support> Supports { get; set; } = new List<Support>();
}
