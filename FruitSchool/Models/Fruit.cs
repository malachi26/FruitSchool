using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FruitSchool.Models
{
    public class Fruit
    {
        public int FruitID { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string ImageLocation { get; set; }

    }
}