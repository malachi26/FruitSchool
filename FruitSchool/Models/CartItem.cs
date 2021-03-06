namespace FruitSchool.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using System.ComponentModel.DataAnnotations;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;



    public class CartItem
    {
        [Key]
        public Guid CartItemID { get; set; }
        public int FruitID { get; set; }
        public Guid CartID { get; set; }
        public System.DateTime DateCreated { get; set; }
        public int Quantity { get; set; }

        [ForeignKey("CartID")]
        public Cart Cart { get; set; }
        [ForeignKey("FruitID")]
        public Fruit Fruit { get; set; }

        
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
