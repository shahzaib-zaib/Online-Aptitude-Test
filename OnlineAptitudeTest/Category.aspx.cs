using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            if (cid == null)
            {
                Response.Redirect("Index.aspx");
            }
            criterialistmethod(Convert.ToInt32(cid));
            categorynamemethod(Convert.ToInt32(cid));
        }


        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;

        //method for subjectlist
        public void criterialistmethod(int id)
        {

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Criteria where category_fid = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_categoryitem.DataSource = rd;
                        gridview_categoryitem.DataBind();
                    }
                    else
                    {
                        panel_scriteriashow_warning.Visible = true;
                        lbl_scriteriashowwarning.Text = "Sorry! There is no scriteria in this category";
                    }
                }
                catch (Exception ex)
                {
                    panel_scriteriashow_warning.Visible = true;
                    lbl_scriteriashowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        //method for categorylist
        public void categorynamemethod(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Category where category_id = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        lbl_categoryscriteria.Text = rd["category_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_scriteriashow_warning.Visible = true;
                    lbl_scriteriashowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
                }
            }
        }
    }
}