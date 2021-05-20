using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineRent.Business;

namespace OnlineRent
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Registration registerUser = new Registration();
            string message = registerUser.InsertUser(fName.Text, lName.Text, email.Text, phn.Text, usertype.Text, password.Text);
            if (registerUser.flag == true)
            {
                lblmessage.Text = message;
            }
            else
            {
                if(usertype.Text=="Customer")
                {
                    Response.Redirect("CustomerPage.aspx");
                }
                else
                {
                    Response.Redirect("SellerPage.aspx");
                }
            }
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

       
    }
}