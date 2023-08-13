using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Category
{
    public int Id { get; set; }

    public string CategoryType { get; set; } = null!;

    public virtual ICollection<Food> Foods { get; set; } = new List<Food>();

    public virtual ICollection<Item> Items { get; set; } = new List<Item>();

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();
}
