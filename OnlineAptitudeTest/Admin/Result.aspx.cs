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
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string candidateemail = Request.QueryString["uid"];
            if (!IsPostBack)
            {
                if (candidateemail != null)
                {
                    getSpecificResults(candidateemail);
                    gridViewSpecific.Visible = true;
                    gridResult.Visible = false;
                }
                else
                {
                    getAllResults();
                    gridViewSpecific.Visible = false;
                    gridResult.Visible = true;
                }

            }
        }
        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //method for get all result
        public void getAllResults()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Result left join Interview on result.interview_fid = interview.interview_id", con);
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
                                gridResult.DataSource = tb;
                                gridResult.DataBind();
                            }
                            else
                            {
                                panel_ResultShow_Warning.Visible = true;
                                lbl_ResultShowWarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_ResultShow_Warning.Visible = true;
                    lbl_ResultShowWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }

        //method for spexific result

        public void getSpecificResults(string email)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Result left join Interview on result.interview_fid = interview.interview_id where candidate_email = @uemail", con);
                cmd.Parameters.AddWithValue("@uemail", email);
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
                                gridViewSpecific.DataSource = tb;
                                gridViewSpecific.DataBind();
                            }
                            else
                            {
                                panel_ResultShow_Warning.Visible = true;
                                lbl_ResultShowWarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_ResultShow_Warning.Visible = true;
                    lbl_ResultShowWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }
        //for paging
        protected void gridResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridResult.PageIndex = e.NewPageIndex;
            getAllResults();
            gridViewSpecific.Visible = false;
            gridResult.Visible = true;
        }

        // for specific result paging
        protected void gridViewSpecific_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string uemail = Request.QueryString["uid"];
            gridViewSpecific.PageIndex = e.NewPageIndex;
            getSpecificResults(uemail);
            gridViewSpecific.Visible = true;
            gridResult.Visible = false;
        }
    }
}