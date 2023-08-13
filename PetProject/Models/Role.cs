using System;
using System.Collections.Generic;

namespace PetProject.Models;

public partial class Role
{
    public int Id { get; set; }

    public string? RoleType { get; set; }

    public virtual ICollection<LoginUser> LoginUsers { get; set; } = new List<LoginUser>();
}
