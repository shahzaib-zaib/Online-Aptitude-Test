using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest.Admin
{
    public partial class Interview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_InterviewList.Visible = true;
                panel_AddInterview.Visible = false;
                btn_panelInterviewList.BackColor = ColorTranslator.FromHtml("#000222");
                btn_panelAddInterview.BackColor = ColorTranslator.FromHtml("#ffc107");
                getInterviewList();
            }
        }
        protected void btn_panelInterviewList_Click(object sender, EventArgs e)
        {
            panel_InterviewList.Visible = true;
            panel_AddInterview.Visible = false;
            btn_panelInterviewList.BackColor = ColorTranslator.FromHtml("#000222");
            btn_panelAddInterview.BackColor = ColorTranslator.FromHtml("#ffc107");
            getInterviewList();
        }
        protected void btn_panelAddInterview_Click(object sender, EventArgs e)
        {
            panel_InterviewList.Visible = false;
            panel_AddInterview.Visible = true;
            btn_panelInterviewList.BackColor = ColorTranslator.FromHtml("#ffc107");
            btn_panelAddInterview.BackColor = ColorTranslator.FromHtml("#000222");
            get_CategoryDrp();
            get_CriteriaDrp();

        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString; //string of connection

        // this is for the add exam 
        protected void btn_AddInterview_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("spAddInterview", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@interviewname", txt_interviewname.Text);
                    cmd.Parameters.AddWithValue("@interviewdis", txt_interviewdis.Text);
                    cmd.Parameters.AddWithValue("@interviewdate", txt_interviewdate.Text);
                    cmd.Parameters.AddWithValue("@interviewduration", txt_interviewduration.Text);
                    cmd.Parameters.AddWithValue("@interviewpassmarks", txt_interviewpassmarks.Text);
                    cmd.Parameters.AddWithValue("@interviewmarks", txt_interviewmatotalmarks.Text);
                    cmd.Parameters.AddWithValue("@interviewcriteriafid", drp_CriteriaInterview.SelectedValue);
                    cmd.Parameters.AddWithValue("@interviewcategoryfid", drp_CategoryInterview.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Interview.aspx");
                        }
                        else
                        {
                            txt_interviewname.Focus();
                            panel_AddInterview_Warning.Visible = true;
                            lbl_InterviewAddWarning.Text = "Try again. Criteria is not added";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_interviewname.Focus();
                        panel_AddInterview_Warning.Visible = true;
                        lbl_InterviewAddWarning.Text = "Something went wrong. Criteria is not added </br>" + ex.Message;
                    }
                } //end of using
            }
            else
            {
                txt_interviewname.Focus();
                panel_AddInterview_Warning.Visible = true;
                lbl_InterviewAddWarning.Text = "You must fill all the requirements";
            }

        }
        // for deleting
        protected void grdview_InterviewList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteinterview")
            {
                deleteInterview(Convert.ToInt32(e.CommandArgument));
                getInterviewList();
            }
        }
        //When paging
        protected void grdview_InterviewList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_InterviewList.PageIndex = e.NewPageIndex;
            getInterviewList();
        }



        //method for category dropdown
        public void get_CategoryDrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    drp_CategoryInterview.DataSource = cmd.ExecuteReader();
                    drp_CategoryInterview.DataBind();
                    ListItem li = new ListItem("Select category", "-1");
                    drp_CategoryInterview.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_interviewname.Focus();
                    panel_AddInterview_Warning.Visible = true;
                    lbl_InterviewAddWarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }

        //method for subject dropdown
        public void get_CriteriaDrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select criteria_id, criteria_name from Criteria", con);
                try
                {
                    con.Open();
                    drp_CriteriaInterview.DataSource = cmd.ExecuteReader();
                    drp_CriteriaInterview.DataBind();
                    ListItem li = new ListItem("Select Criteria", "-1");
                    drp_CriteriaInterview.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_interviewname.Focus();
                    panel_AddInterview_Warning.Visible = true;
                    lbl_InterviewAddWarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
        //method for examlist 
        public void getInterviewList()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spInterviewList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable dtatble = new DataTable())
                        {
                            ad.Fill(dtatble);
                            grdview_InterviewList.DataSource = dtatble;
                            grdview_InterviewList.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_InterviewList_Warning.Visible = true;
                    lbl_InterviewListWarning.Text = "Something went wrong </br>" + ex.Message;
                }
            }
        }
        //Method for deleting category
        public void deleteInterview(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("delete Interview where interview_id = @interviewid", con);
                cmd.Parameters.AddWithValue("@interviewid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/Admin/Interview.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_InterviewList_Warning.Visible = true;
                        lbl_InterviewListWarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_InterviewList_Warning.Visible = true;
                    lbl_InterviewListWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }

            }
        }
    }
}