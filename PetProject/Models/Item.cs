using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Item
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

    public virtual ICollection<Basket> Baskets { get; set; } = new List<Basket>();

    public virtual Category? Category { get; set; }

    public virtual ICollection<Support> Supports { get; set; } = new List<Support>();
}
