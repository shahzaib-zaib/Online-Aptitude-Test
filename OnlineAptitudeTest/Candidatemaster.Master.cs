using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAptitudeTest
{
    public partial class Candidatemaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                HttpCookie candidatecookie = Request.Cookies["candidate_cookies"];
                if (Session["candidateemail"] != null || candidatecookie != null)
                {
                    link_loginout.Text = "Log out";
                }
                else
                {
                    link_loginout.Text = "Log in";
                }
            }
        }

        //for clicking the log in out button
        protected void link_loginout_Click(object sender, EventArgs e)
        {
            if (link_loginout.Text == "Log out")
            {
                Response.Cookies["candidate_cookies"].Expires = DateTime.Now.AddYears(-1);
                Response.Cookies.Clear();
                Session.Clear();
                Response.Redirect("~/Login.aspx");
            }
            else if (link_loginout.Text == "Log in")
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}