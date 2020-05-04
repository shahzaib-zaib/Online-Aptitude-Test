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
    public partial class Addcandidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //add Candidate
        protected void btn_AddCandidate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("spCandidateRegisterInsert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@candidate_fname", txt_candifname.Text);
                    cmd.Parameters.AddWithValue("@candidate_lname", txt_candilname.Text);
                    cmd.Parameters.AddWithValue("@candidate_fathername", txt_candifathername.Text);
                    cmd.Parameters.AddWithValue("@candidate_nicnumber", txt_candinicnumber.Text);
                    cmd.Parameters.AddWithValue("@email", txt_candiemail.Text);
                    cmd.Parameters.AddWithValue("@password", txt_candipass.Text);
                    cmd.Parameters.AddWithValue("@candidate_gender", txt_candigender.Text);
                    cmd.Parameters.AddWithValue("@candidate_dob", txt_candidob.Text);
                    cmd.Parameters.AddWithValue("@candidate_address", txt_candiaddress.Text);
                    cmd.Parameters.AddWithValue("@candidate_city", txt_candicity.Text);
                    cmd.Parameters.AddWithValue("@candidate_country", txt_candicountry.Text);
                    cmd.Parameters.AddWithValue("@candidate_number", txt_candinumber.Text);
                    cmd.Parameters.AddWithValue("@candidate_eduname", txt_candiedu.Text);
                    cmd.Parameters.AddWithValue("@candidate_eduuniversity", txt_candiuni.Text);
                    cmd.Parameters.AddWithValue("@candidate_eduaddress", txt_candiuniadd.Text);
                    cmd.Parameters.AddWithValue("@candidate_eduphone", txt_candieduphone.Text);
                    cmd.Parameters.AddWithValue("@candidate_edudgree", txt_candiedudgree.Text);
                    cmd.Parameters.AddWithValue("@candidate_edusdate", txt_candiedusdate.Text);
                    cmd.Parameters.AddWithValue("@candidate_eduedate", txt_candieduedate.Text);
                    cmd.Parameters.AddWithValue("@candidate_comname", txt_candicomname.Text);
                    cmd.Parameters.AddWithValue("@candidate_comaddress", txt_candicomaddress.Text);
                    cmd.Parameters.AddWithValue("@candidate_comjob", txt_candicomjob.Text);
                    cmd.Parameters.AddWithValue("@candidate_comexp", txt_candicomexp.Text);
                    cmd.Parameters.AddWithValue("@candidate_comsdate", txt_candicomsdate.Text);
                    cmd.Parameters.AddWithValue("@candidate_comedate", txt_candicomedate.Text);
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
                            txt_candiemail.Focus();
                            panel_AddCandidate_Warning.Visible = true;
                            lbl_AddCandidateWarning.Text = "CNIC is already in use";
                        }

                    }
                    catch (Exception ex)
                    {
                        txt_candiemail.Focus();
                        panel_AddCandidate_Warning.Visible = true;
                        lbl_AddCandidateWarning.Text = "Something went wrong! Contact your devloper </br>" + ex.Message;
                    }
                }
            }
            else
            {
                txt_candiemail.Focus();
                panel_AddCandidate_Warning.Visible = true;
                lbl_AddCandidateWarning.Text = "Please fill all the requirements";
            }
        }
    }
}