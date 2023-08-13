using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Donate
{
    public int Id { get; set; }

    public string Donate1 { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Email { get; set; } = null!;
}
