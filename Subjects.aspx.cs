using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClass
{
    public partial class Subjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindata();
            }
        }
        private void bindata()
        {
            dal dal = new dal();
            DataTable dt = new DataTable();
            dt = dal.FillSubjects();
            gvClassSchedule.DataSource = dt;
            gvClassSchedule.DataBind();

        }

        protected void gvClassSchedule_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvClassSchedule.Rows[rowIndex];
                string name = row.Cells[1].Text;
                string country = row.Cells[2].Text;
                string id = (row.FindControl("txtId") as TextBox).Text;
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
                Response.Redirect("ClassBooking.aspx?id=" + id);
            }
        }
    }
}