using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FruitSchool.Models;

namespace FruitSchool
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CartID"] != null)
            {
                SqlDataSource1.SelectCommand = "ShoppingCartItems";
                SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                SqlDataSource1.SelectParameters.Add("CartID", Session["CartID"].ToString());
                //EntityDataSource.
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void SubmitOrder(string name)
        {
            Session["nameOnOrder"] = name;
            Response.Redirect("OrderReceivedPage.aspx");
        }

        protected void SubmitFruitOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (var db = new FruitSchoolContext())
                {
                    var cartID = Guid.Parse(Session["CartID"].ToString());
                    //var cart = from c in db.Cart
                               //where c.CartID == cartID
                               //select c;
                    //Cart cartEntity = cart as Cart;
                    //cartEntity.UserName = NameOnOrder.Value;
                     var cart = db.Cart.First(w => w.CartID == cartID);
                    cart.UserName = NameOnOrder.Value;
                    Session["nameOnOrder"] = NameOnOrder.Value;
                    
                    Session["ConfirmedOrder"] = cart;
                    Response.Redirect("OrderReceivedPage.aspx");

                }
            }
        }
    }
}