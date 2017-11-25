namespace FruitSchool.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using System.ComponentModel.DataAnnotations;
    using System.Collections.Generic;



    public class CartItem
    {
        [Key]
        public string itemId { get; set; }
        public string cartId { get; set; }
        public int quantity { get; set; }
        public System.DateTime dateCreated { get; set; }
        public int fruitId { get; set; }
        public virtual Fruit fruit { get; set; }
    }


    public class Order
    {
        public int orderID { get; set; }
        public string name { get; set; }
        public List<CartItem> cartItems { get; set; }

    }

    // Add a DbSet for each entity type that you want to include in your model. For more information 
    // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

    // public virtual DbSet<MyEntity> MyEntities { get; set; }
}

//public class MyEntity
//{
//    public int Id { get; set; }
//    public string Name { get; set; }
//}
