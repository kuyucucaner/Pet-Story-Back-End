using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class PetStatus
{
    public int Id { get; set; }

    public string? StatusType { get; set; }

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();
}
