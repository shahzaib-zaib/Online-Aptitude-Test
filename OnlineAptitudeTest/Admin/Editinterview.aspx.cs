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
    public partial class Editinterview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (!IsPostBack)
            {
                if (eid == null)
                {
                    Response.Redirect("~/Admin/Interview.aspx");
                }
                get_EditInterviewFill(Convert.ToInt32(eid));
                get_EditCategoryDrp();
                get_EditCriteriaDrp();
            }
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //edit button to edit exam
        protected void btn_EditInterview_Click(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spEditInterview", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@interviewid", Convert.ToInt32(eid));
                    cmd.Parameters.AddWithValue("@interviewname", txt_editinterviewname.Text);
                    cmd.Parameters.AddWithValue("@interviewdiscription", txt_editinterviewdis.Text);
                    cmd.Parameters.AddWithValue("@interviewdate", txt_editinterviewdate.Text);
                    cmd.Parameters.AddWithValue("@interviewduration", txt_editinterviewduration.Text);
                    cmd.Parameters.AddWithValue("@interviewpassmarks", txt_editpassinterviewmarks.Text);
                    cmd.Parameters.AddWithValue("@interviewnmarks", txt_editinterviewtotalmarks.Text);
                    cmd.Parameters.AddWithValue("@categoryfid", drp_EditCategoryInterview.SelectedValue);
                    cmd.Parameters.AddWithValue("@criteriafid", drp_EditCriteriaInterview.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Interview.aspx");
                        }
                        else
                        {
                            txt_editinterviewname.Focus();
                            panel_EditInterview_Warning.Visible = true;
                            lbl_InterviewEditWarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_editinterviewname.Focus();
                        panel_EditInterview_Warning.Visible = true;
                        lbl_InterviewEditWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                    }
                } // end of using 
            }
            else
            {
                txt_editinterviewname.Focus();
                panel_EditInterview_Warning.Visible = true;
                lbl_InterviewEditWarning.Text = "You must fill all the requirements";
            }

        }

        //method for editfill
        public void get_EditInterviewFill(int id)
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spEditInterviewFill", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@interviewid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txt_editinterviewname.Text = rd["interview_name"].ToString();
                        txt_editinterviewdis.Text = rd["interview_description"].ToString();
                        txt_editinterviewduration.Text = rd["interview_duration"].ToString();
                        txt_editpassinterviewmarks.Text = rd["interviewpass_marks"].ToString();
                        txt_editinterviewtotalmarks.Text = rd["interview_marks"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_EditInterview_Warning.Visible = true;
                    lbl_InterviewEditWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }

        //method for category dropdown
        public void get_EditCategoryDrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                try
                {
                    con.Open();
                    drp_EditCategoryInterview.DataSource = cmd.ExecuteReader();
                    drp_EditCategoryInterview.DataBind();
                    ListItem li = new ListItem("Select Category", "-1");
                    drp_EditCategoryInterview.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_editinterviewname.Focus();
                    panel_EditInterview_Warning.Visible = true;
                    lbl_InterviewEditWarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }

        //method for subject dropdown
        public void get_EditCriteriaDrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select criteria_id, criteria_name from Criteria", con);
                try
                {
                    con.Open();
                    drp_EditCriteriaInterview.DataSource = cmd.ExecuteReader();
                    drp_EditCriteriaInterview.DataBind();
                    ListItem li = new ListItem("Select Criteria", "-1");
                    drp_EditCriteriaInterview.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_editinterviewname.Focus();
                    panel_EditInterview_Warning.Visible = true;
                    lbl_InterviewEditWarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
    }
}