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
    public partial class Criteria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_CriteriaList.Visible = true;
                panel_AddCriteria.Visible = false;
                btn_panelCriteriaList.BackColor = ColorTranslator.FromHtml("#000222");
                btn_panelAddCriteria.BackColor = ColorTranslator.FromHtml("#ffc107");
                getCriteriaList();

            }
        }
        //This is button for the enable list of subject list panel
        protected void btn_panelCriteriaList_Click(object sender, EventArgs e)
        {
            panel_CriteriaList.Visible = true;
            panel_AddCriteria.Visible = false;
            btn_panelCriteriaList.BackColor = ColorTranslator.FromHtml("#000222");
            btn_panelAddCriteria.BackColor = ColorTranslator.FromHtml("#ffc107");
            getCriteriaList();
        }
        //This is button for the enable list of add subject panel
        protected void btn_panelAddCriteria_Click(object sender, EventArgs e)
        {
            panel_CriteriaList.Visible = false;
            panel_AddCriteria.Visible = true;
            btn_panelCriteriaList.BackColor = ColorTranslator.FromHtml("#ffc107");
            btn_panelAddCriteria.BackColor = ColorTranslator.FromHtml("#000222");
            get_categorydrp();
        }
        //This is button for adding the subject in databse 
        protected void btn_AddCriteria_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("insert into Criteria (criteria_name, category_fid) values (@criteria_name,@category_fid)", con);
                    cmd.Parameters.AddWithValue("@criteria_name", txt_criteria.Text);
                    cmd.Parameters.AddWithValue("@category_fid", drp_category.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Criteria.aspx");
                        }
                        else
                        {
                            txt_criteria.Focus();
                            panel_AddCriteria_Warning.Visible = true;
                            lbl_AddCriteria_Warning.Text = "Try again. Criteria is not added";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_criteria.Focus();
                        panel_AddCriteria_Warning.Visible = true;
                        lbl_AddCriteria_Warning.Text = "Something went wrong. Criteria is not added </br>" + ex.Message;
                    }
                } //end of using
            }
            else
            {
                txt_criteria.Focus();
                panel_AddCriteria_Warning.Visible = true;
                lbl_AddCriteria_Warning.Text = "You must fill all the requirements";
            }


        }
        //for row command
        protected void grdview_CriteriaList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                deleteCriteria(Convert.ToInt32(e.CommandArgument));
                getCriteriaList();
            }
        }
        //for paging
        protected void grdview_CriteriaList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_CriteriaList.PageIndex = e.NewPageIndex;
            getCriteriaList();
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //method for dropdown
        public void get_categorydrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                try
                {
                    con.Open();
                    drp_category.DataSource = cmd.ExecuteReader();
                    drp_category.DataBind();
                    ListItem li = new ListItem("Select Category", "-1");
                    drp_category.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_criteria.Focus();
                    panel_AddCriteria_Warning.Visible = true;
                    lbl_AddCriteria_Warning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
        // Method for getting subject list
        public void getCriteriaList()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spCriteriaList", con);
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
                            grdview_CriteriaList.DataSource = dtatble;
                            grdview_CriteriaList.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_CriteriaList_Warning.Visible = true;
                    lbl_CriteriaListWarning.Text = "Something went wrong </br>" + ex.Message;
                }
            }
        }

        //Method for delete
        public void deleteCriteria(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("delete Criteria where criteria_id = @criteriaid", con);
                cmd.Parameters.AddWithValue("@criteriaid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/Admin/Criteria.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_CriteriaList_Warning.Visible = true;
                        lbl_CriteriaListWarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_CriteriaList_Warning.Visible = true;
                    lbl_CriteriaListWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }

            }
        }
    }
}