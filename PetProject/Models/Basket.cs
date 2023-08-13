using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Basket
{
    public int Id { get; set; }

    public int Amount { get; set; }

    public decimal Price { get; set; }

    public int? CustomerId { get; set; }

    public int? FoodId { get; set; }

    public int? PetId { get; set; }

    public int? ItemId { get; set; }

    public bool IsDeleted { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual Food? Food { get; set; }

    public virtual Item? Item { get; set; }

    public virtual Pet? Pet { get; set; }
}
