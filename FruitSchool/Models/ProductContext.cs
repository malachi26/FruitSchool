using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;


namespace FruitSchool.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("FruitSchool")
        {
            
        }
        public DbSet<CartItem> ShoppingCartItems { get; set; }
    }
}