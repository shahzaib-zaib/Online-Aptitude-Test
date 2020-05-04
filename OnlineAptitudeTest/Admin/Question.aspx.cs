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
    public partial class Question : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getAllQuestion();
        }


        protected void gridview_InterviewQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridview_InterviewQuestion.PageIndex = e.NewPageIndex;
            getAllQuestion();
        }
        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //method for getting question 
        public void getAllQuestion()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spGetAllQuestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            gridview_InterviewQuestion.DataSource = tb;
                            gridview_InterviewQuestion.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_InterviewQuestion_Warning.Visible = true;
                    lbl_InterviewQuestionWarning.Text = "Something went wrong. Pleas contact your provider </br>" + ex.Message;
                }

            }
        }

        //method for deleting question for the question id 
        public void deleteQuestion(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("delete Question where question_id = @questionid", con);
                cmd.Parameters.AddWithValue("@questionid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/Admin/Question.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_InterviewQuestion_Warning.Visible = true;
                        lbl_InterviewQuestionWarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_InterviewQuestion_Warning.Visible = true;
                    lbl_InterviewQuestionWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }

            }
        }


        protected void gridview_InterviewQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteQuestion")
            {
                deleteQuestion(Convert.ToInt32(e.CommandArgument));
            }
        }
    }
}