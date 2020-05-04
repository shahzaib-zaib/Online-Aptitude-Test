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
    public partial class EditCriteria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sid = Request.QueryString["sid"];
                if (sid == null)
                {
                    Response.Redirect("~/Admin/Criteria.aspx");
                }
                txt_criteriaedit.Focus();
                get_categorydrp(); // calling for dropdown method
                categoryedit_fill(Convert.ToInt32(sid)); //calling for text method


            }
        }
        protected void btn_EditCriteria_Click(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("spCriteriaEdit", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@criteria_name", txt_criteriaedit.Text);
                    cmd.Parameters.AddWithValue("@criteria_id", Convert.ToInt32(sid));
                    cmd.Parameters.AddWithValue("@category_id", drp_categoryedit.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("~/Admin/Criteria.aspx");
                        }
                        else
                        {
                            txt_criteriaedit.Focus();
                            panel_EditCriteria_Warning.Visible = true;
                            lbl_EditCriteria_Warning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_criteriaedit.Focus();
                        panel_EditCriteria_Warning.Visible = true;
                        lbl_EditCriteria_Warning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                    }
                } // end of using
            }
            else
            {
                txt_criteriaedit.Focus();
                panel_EditCriteria_Warning.Visible = true;
                lbl_EditCriteria_Warning.Text = "You must fill all the requirements";
            }
        }
        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //edit fill text method
        public void categoryedit_fill(int id)
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spCriteriaEditFill", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txt_criteriaedit.Text = rd["criteria_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_EditCriteria_Warning.Visible = true;
                    lbl_EditCriteria_Warning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }
            }
        }
        //edit fill dropdownmethod
        public void get_categorydrp()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    drp_categoryedit.DataSource = rd;
                    drp_categoryedit.DataBind();
                    ListItem li = new ListItem("Select Category", "-1");
                    drp_categoryedit.Items.Insert(0, li);

                }
                catch (Exception ex)
                {
                    txt_criteriaedit.Focus();
                    panel_EditCriteria_Warning.Visible = true;
                    lbl_EditCriteria_Warning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
    }
}