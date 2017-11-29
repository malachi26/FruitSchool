using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FruitSchool.Models;

namespace FruitSchool
{
    public partial class OrderReceivedPage : System.Web.UI.Page
    {
        protected ICollection<CartItem> cartItems;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nameOnOrder"] == null)
            {
                Response.Redirect("ShoppingCartPage.aspx");
            }
            else
            {
                using (var db = new FruitSchoolContext())
                {
                    var cartID = Guid.Parse(Session["CartID"].ToString());
                    //var cart = from c in db.Cart
                    //           where c.CartID == cartID
                    //           select c;
                    //Cart cartEntity = cart as Cart;
                    //cartItems = cartEntity.CartItems;
                    var cartItems = db.Cart.First(w => w.CartID == cartID);
                    Gratitude.Text = "Thank you for buying our Fruit and supporting the Kids, " + Session["nameOnOrder"].ToString() + "!";

                }
            }
        }
        
    }
}