using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest.Admin
{
    public partial class Resetpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_ResetPass_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update admin set admin_password= @adminpass where admin_password = @adminoldpassword", con);
                    cmd.Parameters.AddWithValue("@adminpass", txt_adminewpass.Text);
                    cmd.Parameters.AddWithValue("@adminoldpassword", txt_admipresentpass.Text);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Index.aspx");
                        }
                        else
                        {
                            txt_admipresentpass.Focus();
                            panel_ResetPass_Warning.Visible = true;
                            lbl_ResetPassWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_admipresentpass.Focus();
                        panel_ResetPass_Warning.Visible = true;
                        lbl_ResetPassWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                    }
                } // end of using 
            }
            else
            {
                txt_admipresentpass.Focus();
                panel_ResetPass_Warning.Visible = true;
                lbl_ResetPassWarning.Text = "You must fill all the requirements";
            }
        }
    }
}