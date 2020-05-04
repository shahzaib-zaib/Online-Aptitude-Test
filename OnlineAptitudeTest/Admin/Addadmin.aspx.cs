using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest.Admin
{
    public partial class Addadmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //add admin
        protected void btn_addadmin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("spAdminRegisterInsert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@admin_name", txt_adminame.Text);
                    cmd.Parameters.AddWithValue("@admin_email", txt_admiemail.Text);
                    cmd.Parameters.AddWithValue("@password", txt_adminpass.Text);
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteScalar(); // as procedure return number
                        if (value == 1)
                        {
                            Response.Redirect("~/Admin/Index.aspx");
                        }
                        else
                        {
                            txt_adminame.Focus();
                            panel_addamin_warning.Visible = true;
                            lbl_addaminwarning.Text = "Email is already in use";
                        }

                    }
                    catch (Exception ex)
                    {
                        txt_admiemail.Focus();
                        panel_addamin_warning.Visible = true;
                        lbl_addaminwarning.Text = "Something went wrong! Contact your devloper </br>" + ex.Message;
                    }
                }
            }
            else
            {
                txt_admiemail.Focus();
                panel_addamin_warning.Visible = true;
                lbl_addaminwarning.Text = "Please fill all the requirements";
            }
        }
    }
}