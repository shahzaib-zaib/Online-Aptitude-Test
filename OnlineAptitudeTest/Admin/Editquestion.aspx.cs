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
    public partial class Editquestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string qid = Request.QueryString["qid"];
            if (!IsPostBack)
            {
                if (qid == null)
                {
                    Response.Redirect("~/Admin/Question.aspx");
                }
                get_EditInterviewQuestion(Convert.ToInt32(qid));
                get_EditInterviewDrp();
                // get_editsubjectdrp();
            }
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;

        protected void btn_EditQuestion_Click(object sender, EventArgs e)
        {
            string qid = Request.QueryString["qid"];
            if (IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spEditQuestion", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@questionid", Convert.ToInt32(qid));
                    cmd.Parameters.AddWithValue("@questionname", txt_editquestionname.Text);
                    cmd.Parameters.AddWithValue("@optionone", txt_editoptionone.Text);
                    cmd.Parameters.AddWithValue("@optiontwo", txt_editoptiontwo.Text);
                    cmd.Parameters.AddWithValue("@optionthree", txt_edtoptionthree.Text);
                    cmd.Parameters.AddWithValue("@optionfour", txt_editoptionfour.Text);
                    cmd.Parameters.AddWithValue("@questionanswer", rdo_EditCorrectAnswer.SelectedValue);
                    cmd.Parameters.AddWithValue("@interviewfid", drp_EditInterview.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Question.aspx");
                        }
                        else
                        {
                            txt_editquestionname.Focus();
                            panel_EditQuestion_Warning.Visible = true;
                            lbl_EditQuestionWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_editquestionname.Focus();
                        panel_EditQuestion_Warning.Visible = true;
                        lbl_EditQuestionWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                    }
                } // end of using 
            }
            else
            {
                txt_editquestionname.Focus();
                panel_EditQuestion_Warning.Visible = true;
                lbl_EditQuestionWarning.Text = "You must fill all the requirements";
            }
        }
        //method for editfill
        public void get_EditInterviewQuestion(int id)
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spEditQuestionFill", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@questionid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txt_editquestionname.Text = rd["question_name"].ToString();
                        txt_editoptionone.Text = rd["option_one"].ToString();
                        txt_editoptiontwo.Text = rd["option_two"].ToString();
                        txt_edtoptionthree.Text = rd["option_three"].ToString();
                        txt_editoptionfour.Text = rd["option_four"].ToString();

                    }
                }
                catch (Exception ex)
                {
                    panel_EditQuestion_Warning.Visible = true;
                    lbl_EditQuestionWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }
        //method for category dropdown
        public void get_EditInterviewDrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Interview", con);
                try
                {
                    con.Open();
                    drp_EditInterview.DataSource = cmd.ExecuteReader();
                    drp_EditInterview.DataBind();
                    ListItem li = new ListItem("Select category", "-1");
                    drp_EditInterview.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_editquestionname.Focus();
                    panel_EditQuestion_Warning.Visible = true;
                    lbl_EditQuestionWarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
    }
}