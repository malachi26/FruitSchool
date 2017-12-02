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
        protected FruitSchoolContext dbConnection;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nameOnOrder"] == null)
            {
                Response.Redirect("ShoppingCartPage.aspx");
            }
            else
            {
                dbConnection = new FruitSchoolContext();
                var cartID = Guid.Parse(Session["CartID"].ToString());
                cartItems = dbConnection.CartItems.Where(c => c.CartID == cartID).ToList();

                Gratitude.Text = "Thank you for buying our Fruit and supporting the Kids, " + Session["nameOnOrder"].ToString() + "!";


            }
        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            if (!(dbConnection is null))
            {
                dbConnection.Dispose();
            }
        }
    }
}