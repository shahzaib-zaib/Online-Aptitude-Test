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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getTotalInterview();
            getTotalQuestion();
            getTotalCandidates();
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString; //calling the connection string

        //method for getting all the exam 
        public void getTotalInterview()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(interview_id) from Interview", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lblTotalInterview.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_Index_Warning.Visible = true;
                    lbl_IndexWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }

        //method for getting all the question 
        public void getTotalQuestion()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(question_id) from Question", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lblTotalQuestion.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_Index_Warning.Visible = true;
                    lbl_IndexWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }

        //method for getting all the students 
        public void getTotalCandidates()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(candidate_id) from Candidates", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lblTotalCandidates.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_Index_Warning.Visible = true;
                    lbl_IndexWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }
    }
}