using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using OnlineRent.Business;

namespace OnlineRent
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendEmail(object sender, EventArgs e)
        {
            string username = string.Empty;
            string password = string.Empty;
            //string username = "Subash Senthil Kumar";
            //string password = "Sangeetha";
            try
            {
                HouseRentEntities houseRent = new HouseRentEntities();
                User user = new User();

                var query = from data in houseRent.Users orderby data.FirstName, data.LastName, data.Password select data;

                foreach (User details in query)
                {
                    if (details.Email == txtEmail.Text)
                    {
                        username = details.FirstName + " " + details.LastName;
                        password = details.Password;
                    }
                }


                //var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == txtEmail.Text.ToLower())).FirstOrDefault();
                //if (emailCheck != null)
                //{
                //    username = emailCheck.FirstName + " " + emailCheck.LastName;
                //    password = emailCheck.Password;
                //}

                if (!string.IsNullOrEmpty(password))
                {
                    //using (MailMessage mail = new MailMessage())
                    //{
                    //    mail.From = new MailAddress("subashss10@gmail.com");
                    //    mail.To.Add(txtEmail.Text.Trim());
                    //    mail.Subject = "Password Recovery";
                    //    mail.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", username, password);
                    //    mail.IsBodyHtml = true;
                    //    //mail.Attachments.Add(new Attachment("C:\\file.zip"));

                    //    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    //    {
                    //        smtp.Credentials = new NetworkCredential("subashss10@gmail.com", "Sangeethas10$");
                    //        smtp.EnableSsl = true;
                    //        smtp.Send(mail);
                    //    }
                    //}
                    MailMessage mm = new MailMessage("onlinerent10@gmail.com", txtEmail.Text.Trim());
                    mm.Subject = "Password Recovery";
                    mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", username, password);
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential();
                    NetworkCred.UserName = "onlinerent10@gmail.com";
                    NetworkCred.Password = "Onlinerent10$";
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Password has been sent to your email address.";
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "This email address does not match our records.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}