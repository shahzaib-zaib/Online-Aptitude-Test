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
    public partial class DetailinterviewQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (!IsPostBack)
            {

                if (eid == null)
                {
                    Response.Redirect("~/Admin/Question.aspx");
                }
                getInterviewQuestionDetails(Convert.ToInt32(eid));
            }
        }
        //method for getting question for the exam id
        public void getInterviewQuestionDetails(int id)
        {
            string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spInterviewQuestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@interviewfid", id);
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            gridview_InterviewDetails.DataSource = tb;
                            gridview_InterviewDetails.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_InterviewDetails_Warning.Visible = true;
                    lbl_InterviewDetailsWarning.Text = "Something went wrong. Please contact your provider </br>" + ex.Message;
                }

            }
        }
    }
}