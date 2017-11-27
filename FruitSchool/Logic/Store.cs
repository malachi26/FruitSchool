using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using FruitSchool.Models;

namespace FruitSchool.Logic
{
    public class Store
    {
        public List<Fruit> FruitItemsInStore { get; set; }
        
        public Store()
        {

        }
        public void AddItem(FruitSchool.Models.Fruit fruit)
        {
            using (var db = new FruitSchoolContext())
            {
                db.Fruits.Add(fruit);
            }
        }
        public void AddItem(List<FruitSchool.Models.Fruit> fruitList)
        {
            //maybe need to openup the context outside of this foreach
            foreach (var fruit in fruitList)
            {
                AddItem(fruit);
            }
        }
    }
}