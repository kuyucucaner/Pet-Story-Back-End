using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Veterinary
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Age { get; set; } = null!;

    public string Education { get; set; } = null!;

    public bool? IsActive { get; set; }
}
