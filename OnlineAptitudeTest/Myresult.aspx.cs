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
    public partial class Myresult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie candidatecookie = Request.Cookies["candidate_cookies"];
            if (Session["candidateemail"] != null || candidatecookie != null)
            {
                if (Session["candidateemail"] == null)
                {
                    getemail.Text = candidatecookie["candidateemail"];
                }
                else
                {
                    getemail.Text = Session["candidateemail"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                getmyresults(getemail.Text);
            }
        }
        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        public void getmyresults(string email)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spCandidateResult", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email);
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            if (tb != null)
                            {
                                gridmyresult.DataSource = tb;
                                gridmyresult.DataBind();
                            }
                            else
                            {
                                panel_myresultshow_warning.Visible = true;
                                lbl_myresultshowwarning.Text = "Sorry! There is no result of your in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_myresultshow_warning.Visible = true;
                    lbl_myresultshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        protected void gridmyresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridmyresult.PageIndex = e.NewPageIndex;
            getmyresults(getemail.Text);
        }
    }
}