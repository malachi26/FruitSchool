namespace FruitSchool.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class FruitSchoolContext : DbContext
    {
        public FruitSchoolContext()
            : base("name=FruitSchoolContext")
        {
        }

        //public DbSet<CartItem> ShoppingCartItems { get; set; }
        public DbSet<Fruit> Fruits { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
    }
}