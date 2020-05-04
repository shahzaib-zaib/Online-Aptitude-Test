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
    public partial class Addquestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string eid = Request.QueryString["eid"];
                if (eid == null)
                {
                    Response.Redirect("~/admin/Interview.aspx");
                }
            }
        }


        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString; //string of connection
                                                                                       //for adding the question having exam id
        protected void btn_addQuestion_Click(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("spAddQuestion", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@questionname", txt_questionname.Text);
                    cmd.Parameters.AddWithValue("@optionone", txt_optionone.Text);
                    cmd.Parameters.AddWithValue("@optiontwo", txt_optiontwo.Text);
                    cmd.Parameters.AddWithValue("@optionthree", txt_optionthree.Text);
                    cmd.Parameters.AddWithValue("@optionfour", txt_optionfour.Text);
                    cmd.Parameters.AddWithValue("@questionanswer", rdo_correctanswer.SelectedValue);
                    cmd.Parameters.AddWithValue("@interviewfid", Convert.ToInt32(eid));
                    try
                    {
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/admin/Interview.aspx");
                        }
                        else
                        {
                            txt_questionname.Focus();
                            panel_addQuestion_warning.Visible = true;
                            lbl_addQuestionwarning.Text = "Try again. Criteria is not added";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_questionname.Focus();
                        panel_addQuestion_warning.Visible = true;
                        lbl_addQuestionwarning.Text = "Something went wrong. Criteria is not added </br>" + ex.Message;
                    }
                } //end of using
            }
            else
            {
                txt_questionname.Focus();
                panel_addQuestion_warning.Visible = true;
                lbl_addQuestionwarning.Text = "You must fill all the requirements";
            }
        }
    }
}