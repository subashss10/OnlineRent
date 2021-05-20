using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineRent.Business;

namespace OnlineRent
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void LinkButton1_Click(object sender, EventArgs e)
        { 
            Response.Redirect("Register.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Registration registration = new Registration();
            string message = registration.RetrieveUser(email.Text, password.Text);
            if (registration.flag == true)
            {
                lblmessage.Text = message;
            }
            else
            {
                Session["id"] = 1;
                Session["email"] = email.Text;
                Session["password"] = password.Text;
                HouseRentEntities houseRent = new HouseRentEntities();
                User user = new User();
                var emailCheck = houseRent.Users.Where(a => a.Email.ToLower() == email.Text.ToLower()).FirstOrDefault();
                Session["UserRoleId"] = emailCheck.UserRoleId;
                if(emailCheck.UserRoleId == 1)
                {
                    Response.Redirect("CustomerPage.aspx");
                }
                else
                {

                    Response.Redirect("SellerPage.aspx");
                }
                Session.RemoveAll();
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}