using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PetProject.Models;

public partial class PetDatabaseContext : DbContext
{
    public PetDatabaseContext()
    {
    }

    public PetDatabaseContext(DbContextOptions<PetDatabaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Basket> Baskets { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Donate> Donates { get; set; }

    public virtual DbSet<Food> Foods { get; set; }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<LoginUser> LoginUsers { get; set; }

    public virtual DbSet<Pet> Pets { get; set; }

    public virtual DbSet<PetStatus> PetStatuses { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Support> Supports { get; set; }

    public virtual DbSet<Veterinary> Veterinaries { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS01;Database=pet_database;Trusted_Connection=true;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Basket>(entity =>
        {
            entity.ToTable("Basket");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.FoodId).HasColumnName("FoodID");
            entity.Property(e => e.ItemId).HasColumnName("ItemID");
            entity.Property(e => e.PetId).HasColumnName("PetID");
            entity.Property(e => e.Price).HasColumnType("money");

            entity.HasOne(d => d.Customer).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_Basket_Customers");

            entity.HasOne(d => d.Food).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.FoodId)
                .HasConstraintName("FK_Basket_Foods");

            entity.HasOne(d => d.Item).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.ItemId)
                .HasConstraintName("FK_Basket_Items");

            entity.HasOne(d => d.Pet).WithMany(p => p.Baskets)
                .HasForeignKey(d => d.PetId)
                .HasConstraintName("FK_Basket_Pets");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CategoryType).HasMaxLength(50);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.Biography).HasMaxLength(500);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.LoginUserId).HasColumnName("LoginUserID");
            entity.Property(e => e.PhoneNumber).HasMaxLength(11);

            entity.HasOne(d => d.LoginUser).WithMany(p => p.Customers)
                .HasForeignKey(d => d.LoginUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_LoginUser1");
        });

        modelBuilder.Entity<Donate>(entity =>
        {
            entity.ToTable("Donate");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Donate1)
                .HasMaxLength(10)
                .HasColumnName("Donate");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Food>(entity =>
        {
            entity.Property(e => e.FoodId).HasColumnName("FoodID");
            entity.Property(e => e.CategoryId).HasColumnName("CategoryID");
            entity.Property(e => e.FoodBrand).HasMaxLength(50);
            entity.Property(e => e.FoodDescription).HasMaxLength(50);
            entity.Property(e => e.FoodName).HasMaxLength(50);
            entity.Property(e => e.FoodPrice).HasColumnType("money");
            entity.Property(e => e.FoodType).HasMaxLength(50);
            entity.Property(e => e.FoodWeight).HasMaxLength(50);

            entity.HasOne(d => d.Category).WithMany(p => p.Foods)
                .HasForeignKey(d => d.CategoryId)
                .HasConstraintName("FK_Foods_Categories");
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.ItemId).HasName("PK_Item");

            entity.Property(e => e.ItemId).HasColumnName("ItemID");
            entity.Property(e => e.CategoryId).HasColumnName("CategoryID");
            entity.Property(e => e.IsStock).HasDefaultValueSql("((1))");
            entity.Property(e => e.ItemBrand).HasMaxLength(50);
            entity.Property(e => e.ItemColor).HasMaxLength(50);
            entity.Property(e => e.ItemDescription).IsUnicode(false);
            entity.Property(e => e.ItemName).HasMaxLength(50);
            entity.Property(e => e.ItemPrice).HasColumnType("money");
            entity.Property(e => e.ItemSize).HasMaxLength(50);
            entity.Property(e => e.ItemType).HasMaxLength(50);

            entity.HasOne(d => d.Category).WithMany(p => p.Items)
                .HasForeignKey(d => d.CategoryId)
                .HasConstraintName("FK_Items_Categories");
        });

        modelBuilder.Entity<LoginUser>(entity =>
        {
            entity.ToTable("LoginUser");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastAddedDate).HasColumnType("datetime");
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.UserName).HasMaxLength(50);

            entity.HasOne(d => d.Role).WithMany(p => p.LoginUsers)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_LoginUser_Roles");
        });

        modelBuilder.Entity<Pet>(entity =>
        {
            entity.Property(e => e.PetId).HasColumnName("PetID");
            entity.Property(e => e.CategoryId).HasColumnName("CategoryID");
            entity.Property(e => e.IsPetSick).HasDefaultValueSql("((0))");
            entity.Property(e => e.PetAge).HasMaxLength(50);
            entity.Property(e => e.PetColor).HasMaxLength(50);
            entity.Property(e => e.PetGenus).HasMaxLength(50);
            entity.Property(e => e.PetName).HasMaxLength(50);
            entity.Property(e => e.PetPrice).HasColumnType("money");
            entity.Property(e => e.PetSeller).HasMaxLength(50);
            entity.Property(e => e.PetStatusId).HasColumnName("PetStatusID");
            entity.Property(e => e.PetType).HasMaxLength(100);
            entity.Property(e => e.UserName).HasMaxLength(50);

            entity.HasOne(d => d.Category).WithMany(p => p.Pets)
                .HasForeignKey(d => d.CategoryId)
                .HasConstraintName("FK_Pets_Categories");

            entity.HasOne(d => d.PetStatus).WithMany(p => p.Pets)
                .HasForeignKey(d => d.PetStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Pets_PetStatus");
        });

        modelBuilder.Entity<PetStatus>(entity =>
        {
            entity.ToTable("PetStatus");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.StatusType).HasMaxLength(50);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.RoleType).HasMaxLength(50);
        });

        modelBuilder.Entity<Support>(entity =>
        {
            entity.ToTable("Support");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.Age).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FoodId).HasColumnName("FoodID");
            entity.Property(e => e.ItemId).HasColumnName("ItemID");
            entity.Property(e => e.Job).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.Message).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.PetId).HasColumnName("PetID");
            entity.Property(e => e.PhoneNumber).HasMaxLength(11);
            entity.Property(e => e.Subject).HasMaxLength(50);
            entity.Property(e => e.SupportType).HasMaxLength(50);
            entity.Property(e => e.UserName).HasMaxLength(50);

            entity.HasOne(d => d.Food).WithMany(p => p.Supports)
                .HasForeignKey(d => d.FoodId)
                .HasConstraintName("FK_Support_Foods");

            entity.HasOne(d => d.Item).WithMany(p => p.Supports)
                .HasForeignKey(d => d.ItemId)
                .HasConstraintName("FK_Support_Items");

            entity.HasOne(d => d.Pet).WithMany(p => p.Supports)
                .HasForeignKey(d => d.PetId)
                .HasConstraintName("FK_Support_Pets");
        });

        modelBuilder.Entity<Veterinary>(entity =>
        {
            entity.ToTable("Veterinary");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Age)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.Education).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.IsActive)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.UserName).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
