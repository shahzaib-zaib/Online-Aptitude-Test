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
    public partial class Interviewdetails : System.Web.UI.Page
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

                getInterview_Details(Convert.ToInt32(eid));
            }
        }
        public void getInterview_Details(int id)
        {
            string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spInterviewListDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@interview_id", id);
                try
                {
                    con.Open();
                    Interview_Details.DataSource = cmd.ExecuteReader();
                    Interview_Details.DataBind();
                }
                catch (Exception ex)
                {
                    panel_InterviewDetails_Warning.Visible = true;
                    lbl_InterviewDetailsWarning.Text = "Something went wrong. Pleas contact your provider </br>" + ex.Message;
                }

            }
        }
    }
}