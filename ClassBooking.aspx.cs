using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClass
{
    public partial class ClassBooking : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                int  id = Convert.ToInt32(Request.QueryString["id"]);
                bindata(id);
            }
        }
        private void bindata(int id)
        {
            dal dal = new dal();
            DataTable dt = new DataTable();
            dt = dal.FillClassBySubjectID(id);
            gvClassSchedule.DataSource = dt;
            gvClassSchedule.DataBind();


            int fullSeatsCount = dt.AsEnumerable().Count(row => row.Field<int>("AvailableSeats") != 0);
            lblFreeSeat.Text = "Free seat Left :" + fullSeatsCount;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "StartTimer", "startTimer();", true);

        }

        protected void gvClassSchedule_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvClassSchedule.Rows[rowIndex];
                string ClassDate = row.Cells[4].Text;
                string AvailableSeats = row.Cells[6].Text;
                string id = (row.FindControl("txtScheduleID") as TextBox).Text;
                string Subjects = (row.FindControl("txtSubjects") as Label).Text;
                if (AvailableSeats == "0")
                {
                    ScriptManager.RegisterClientScriptBlock(updj, this.GetType(), "script", "alert('Online Class of " + Subjects + " is Full on This date : " + ClassDate + "');", true);
                }
                else
                {
                    
                    dal dal = new dal();
                    DataTable dt = new DataTable();
                    dt = dal.CheckCart(Convert.ToInt32(id), Convert.ToInt32(Session["id"]));
                    if (dt.Rows.Count == 1)
                    {
                        ScriptManager.RegisterClientScriptBlock(updj, this.GetType(), "script", "alert('Alraedy Booked');", true);
                    }
                    else
                    {
                        dal dal1 = new dal();
                        DataTable dt1 = new DataTable();
                        dt1 = dal1.FillcartByIdmax(Convert.ToInt32(Session["id"]));
                        if (dt1.Rows.Count == 0)
                        {                            
                            ScriptManager.RegisterClientScriptBlock(updj, this.GetType(), "script", "alert('You can only book maximum 3 classes per week');", true);
                        }
                        else 
                        { 
                        dal.FillCart(Convert.ToInt32(id), Convert.ToInt32(Session["id"]));
                        int id1 = Convert.ToInt32(Request.QueryString["id"]);
                        bindata(id1);
                        }
                    }


                }                
            }
        }

        protected void gvClassSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Access the button in the current row
                Button btnBookNow = (Button)e.Row.FindControl("btnBook");

                // Get the value of a column from the current row
                int availableSeats = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "AvailableSeats"));

                // Change the button text based on the value
                if (availableSeats == 0)
                {
                    btnBookNow.Text = "Full";
                    //this.Page.Body.Style["background-color"] = "lightblue";
                    btnBookNow.Style["background-color"] = "Red";
                }
                else
                {
                    btnBookNow.Text = "Book Now";

                }
            }
        }
    }
}