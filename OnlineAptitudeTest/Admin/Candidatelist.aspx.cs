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
    public partial class Candidatelist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllCandidates();
            }
        }
        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //method for get all result
        public void getAllCandidates()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Candidates", con);
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
                                gridAllCandidates.DataSource = tb;
                                gridAllCandidates.DataBind();
                            }
                            else
                            {
                                panel_CandidateListShow_Warning.Visible = true;
                                lbl_CandidateListShowWarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_CandidateListShow_Warning.Visible = true;
                    lbl_CandidateListShowWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }

        //for paging
        protected void gridAllCandidates_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridAllCandidates.PageIndex = e.NewPageIndex;
            getAllCandidates();
        }
    }
}