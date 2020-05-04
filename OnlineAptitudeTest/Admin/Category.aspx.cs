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
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_categorylist.Visible = true;
                panel_AddCategory.Visible = false;
                btn_panelCategoryList.BackColor = ColorTranslator.FromHtml("#000222");
                btn_panelAddCategory.BackColor = ColorTranslator.FromHtml("#ffc107");
                categorylistmethod();
            }
        }
        //This is button for the enable list of category panel 
        protected void btn_panelCategoryList_Click(object sender, EventArgs e)
        {
            panel_categorylist.Visible = true;
            panel_AddCategory.Visible = false;
            btn_panelCategoryList.BackColor = ColorTranslator.FromHtml("#000222");
            btn_panelAddCategory.BackColor = ColorTranslator.FromHtml("#ffc107");
            categorylistmethod();

        }
        //This is button for enable the adding in category panel
        protected void btn_panelAddCategory_Click(object sender, EventArgs e)
        {
            txt_category.Focus();
            panel_categorylist.Visible = false;
            panel_AddCategory.Visible = true;
            btn_panelCategoryList.BackColor = ColorTranslator.FromHtml("#ffc107");
            btn_panelAddCategory.BackColor = ColorTranslator.FromHtml("#000222");
        }

        //This is for adding the category in databse 
        protected void btn_AddCategory_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                using (SqlConnection con = new SqlConnection(s))
                {
                    SqlCommand cmd = new SqlCommand("insert into Category (category_name) values (@category_name)", con);
                    cmd.Parameters.AddWithValue("@category_name", txt_category.Text);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            txt_category.Text = string.Empty;
                            Response.Redirect("~/Admin/Category.aspx");
                            Response.Write("Added Succesfully");
                        }
                        else
                        {
                            txt_category.Focus();
                            panel_AddCategory_Warning.Visible = true;
                            lbl_CategoryAddWarning.Text = "Something went wrong";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_category.Focus();
                        panel_AddCategory_Warning.Visible = true;
                        lbl_CategoryAddWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                    }

                }
            }
            else
            {
                txt_category.Focus();
                panel_AddCategory_Warning.Visible = true;
                lbl_CategoryAddWarning.Text = "You must fill all the requirements";
            }

        }
        // For row command argument
        protected void grdview_CategoryList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delete_category")
            {
                deletecategory(Convert.ToInt32(e.CommandArgument));
                categorylistmethod();
            }
        }
        // from page index changing 
        protected void grdview_CategoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_CategoryList.PageIndex = e.NewPageIndex;
            categorylistmethod();
        }

        string s = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        //Mehtod for retriving category into list item 
        public void categorylistmethod()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                try
                {
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdview_CategoryList.DataSource = dt;
                            grdview_CategoryList.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_CategoryList_Warning.Visible = true;
                    lbl_CategoryListWarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        //Method for deleting category
        public void deletecategory(int id)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("delete category  where category_id = @catgeryid", con);
                cmd.Parameters.AddWithValue("@catgeryid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/Admin/Category.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_CategoryList_Warning.Visible = true;
                        lbl_CategoryListWarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_CategoryList_Warning.Visible = true;
                    lbl_CategoryListWarning.Text = "Something went wrong. Please try after sometime later</br> Contact your developer for this problem" + ex.Message;
                }

            }
        }
    }
}