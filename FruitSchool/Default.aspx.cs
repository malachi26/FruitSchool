using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FruitSchool.Models;
using FruitSchool.Logic;

namespace FruitSchool
{
    public partial class Fruit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void AddFruitToCart(Object sender, CommandEventArgs e)
        {
            using (ShoppingCart cart = new ShoppingCart())
            {
                cart.AddToCart(Convert.ToInt32(e.CommandArgument));
            }
        }
        
    }
}