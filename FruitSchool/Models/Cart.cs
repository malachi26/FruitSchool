using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace FruitSchool.Models
{
    public class Cart
    {
        [Key]
        public Guid CartID { get; set; }
        public System.DateTime DateCreated { get; set; }

        public ICollection<CartItem> CartItems { get; set; }
    }
}