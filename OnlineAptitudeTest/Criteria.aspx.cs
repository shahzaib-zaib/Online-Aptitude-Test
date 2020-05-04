using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest
{
    public partial class Criteria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            if (sid == null)
            {
                Response.Redirect("Category.aspx");
            }
            interviewlistmethod(Convert.ToInt32(sid));
            criterianamemethod(Convert.ToInt32(sid));
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //method for examlist
        public void interviewlistmethod(int id)
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spInterviewSearchCategory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@criteriaid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_criteriainterview.DataSource = rd;
                        gridview_criteriainterview.DataBind();
                    }
                    else
                    {
                        panel_interviewshow_warning.Visible = true;
                        lbl_interviewshowwarning.Text = "Sorry! There is no interview in this criteria";
                    }
                }
                catch (Exception ex)
                {
                    panel_interviewshow_warning.Visible = true;
                    lbl_interviewshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        //method for sujectlist
        public void criterianamemethod(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Criteria where criteria_id = @criteriaid", con);
                cmd.Parameters.AddWithValue("@criteriaid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        lbl_criteriainterview.Text = rd["criteria_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_interviewshow_warning.Visible = true;
                    lbl_interviewshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
                }
            }
        }
    }
}