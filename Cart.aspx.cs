using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClass
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindData();
            }
        }
        public void BindData()
        {
            gvcart.DataSource = null; gvcart.DataBind();
            dal dal = new dal();
            DataTable dt = new DataTable();
            dt = dal.FillcartById(Convert.ToString(Session["id"]));
            gvcart.DataSource = dt;
            gvcart.DataBind();
        }


        protected void gvcart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvcart.Rows[rowIndex];
                string id = (row.FindControl("txtcartID") as TextBox).Text;
                dal dal = new dal();
                DataTable dt = new DataTable();
                dal.DeletecartById(id);
                Response.Redirect("Cart.aspx");

            }
        }
    }
}