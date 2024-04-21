using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClass
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlLogin.Visible = false;
            pnlregister.Visible = true;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text  != "" && txtEmail.Text  != "" &&  txtpassword.Text != "" && txtpassword2.Text  != "")
            {
                dal dal = new dal();
                dal.Register(txtUsername.Text, txtEmail.Text, txtpassword.Text);
                pnlregister.Visible = false;      
                pnlLogin.Visible=true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.pnlregister , this.GetType(), "script", "alert('Fill all the Field');", true);

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            pnlregister.Visible = false;
            pnlLogin.Visible = true;
        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            if (txtuser.Text != "" && txtpass.Text != "")
            {
                dal dal = new dal();
                DataTable dt = new DataTable();
                dt = dal.Login(txtuser.Text, txtpass.Text);
                if (dt.Rows.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.pnlregister, this.GetType(), "script", "alert('Invalid Login.');", true);
                }
                else
                {
                    Session["id"] = dt.Rows[0]["Id"].ToString();
                    Response.Redirect("Subjects.aspx");
                }
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.pnlregister, this.GetType(), "script", "alert('Fill all the Field');", true);

            }
        }

    }
}