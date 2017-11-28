using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void SubmitOrder (string name)
        {
            Session["nameOnOrder"] = name;
            Response.Redirect("OrderReceivedPage.aspx");
        }
    }
}