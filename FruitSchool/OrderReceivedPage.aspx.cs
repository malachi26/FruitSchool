using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitSchool
{
    public partial class OrderReceivedPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nameOnOrder"] != null)
            {
                Gratitude.Text = "Thank you for buying our Fruit and supporting the Kids, " + Session["nameOnOrder"].ToString() + "!";
                Session.Clear();
            }
            else
            {
                Response.Redirect("ShoppingCartPage.aspx");
            }
        }
    }
}