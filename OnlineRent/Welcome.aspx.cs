using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineRent.Business;

namespace OnlineRent
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null )
            {
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                User user = new User();

                try
                {
                    var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                    if (emailCheck != null)
                    {

                        lblUsername.Text = emailCheck.FirstName + " " + emailCheck.LastName;
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lblUsername.Text = ex.Message;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void profile_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Response.Redirect("Profile.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void homePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}