using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineRent.Business;
using System.Text;
using System.Net;

namespace OnlineRent
{
    public partial class Profile : System.Web.UI.Page
    {
        public string email;
        public byte[] bytes;
        public string userType;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                GetProfileDetails();
                GetProfilePicture();
            }
            
        }
        public void GetProfilePicture()
        {
            email = Session["email"].ToString();
            string base64String;
            HouseRentEntities houseRent = new HouseRentEntities();
            User user = new User();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            byte[] bytes = emailCheck.Images;
            if (bytes != null)
            {
                base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image1.ImageUrl = "data:image/png;base64," + base64String;
            }
            else {
                Image1.ImageUrl = "http://ssl.gstatic.com/accounts/ui/avatar_2x.png";
            }
        }
        public void GetProfileDetails()
        {
            email = Session["email"].ToString();
            HouseRentEntities houseRent = new HouseRentEntities();
            User user = new User();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            string userName = emailCheck.FirstName + " " + emailCheck.LastName;
            lblUserName.Text = userName;
            lblFirst.Visible = true;
            txtFirst.Visible = false;
            lbllast.Visible = true;
            txtLast.Visible = false;
            lblPhn.Visible = true;
            txtPhn.Visible = false;
            lblEmail.Text = Session["email"].ToString();
            lblLocation.Visible = true;
            txtLocation.Visible = false;
            lblFirst.Text = emailCheck.FirstName;
            lbllast.Text = emailCheck.LastName;
            lblPhn.Text = emailCheck.PhoneNumber;
            if (emailCheck.UserRoleId == 1)
            {
                lblUser.Text = "Customer";
                userType = "Customer";
            }
            else
            {
                lblUser.Text = "Seller";
                userType = "Seller";
            }
            if (emailCheck.Location == null)
            {
                lblLocation.Text = "Not Specified";
            }
            else
            {
                lblLocation.Text = emailCheck.Location;
            }
        }

       

        protected void EditButton_Click(object sender, EventArgs e)
        {
            

            lblFirst.Visible = false;
            txtFirst.Visible = true;
            lbllast.Visible = false;
            txtLast.Visible = true;
            lblPhn.Visible = false;
            txtPhn.Visible = true;
            lblEmail.Text = Session["email"].ToString();
            lblLocation.Visible = false;
            txtLocation.Visible = true;
            lblPass.Visible = true;
            lblConfirmPass.Visible = true;
            txtPassword.Visible = true;
            txtConfirm.Visible = true;
            lblUpload.Visible = true;
            FileUpload1.Visible = true;
            BtnUpload.Visible = true;
            HouseRentEntities houseRent = new HouseRentEntities();
            User user = new User();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            txtFirst.Text = emailCheck.FirstName;
            txtLast.Text = emailCheck.LastName;
            txtPhn.Text = emailCheck.PhoneNumber;
            txtPassword.Text = emailCheck.Password;
            txtConfirm.Text = emailCheck.Password;
            
            if (emailCheck.UserRoleId == 1)
            {
                lblUser.Text = "Customer";
            }
            else
            {
                lblUser.Text = "Seller";
            }
            if(emailCheck.Location == null)
            {
                txtLocation.Text = "Not Specified";
            }
            else
            {
                txtLocation.Text = emailCheck.Location;
            }
            SaveButton.Visible = true;
            EditButton.Visible = false;


        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Registration registration = new Registration();
            if (lblImagePath.Text != "")
            {
                using (WebClient webClient = new WebClient())
                {
                    bytes = webClient.DownloadData(lblImagePath.Text);
                }
            }

            string message = registration.UpdateUser(email, txtFirst.Text, txtLast.Text, txtPhn.Text, txtPassword.Text,txtLocation.Text,bytes);
            lblMessage.Text = message;
            //Response.Write(message);
            GetProfileDetails();
            GetProfilePicture();
            SaveButton.Visible = false;
            lblUpload.Visible = false;
            FileUpload1.Visible = false;
            BtnUpload.Visible = false;
            lblPass.Visible = false;
            txtPassword.Visible = false;
            lblConfirmPass.Visible = false;
            txtConfirm.Visible = false;
            EditButton.Visible = true;

        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            //Display the Picture in Image control.
            Image1.ImageUrl = "~/Images/" + Path.GetFileName(FileUpload1.FileName);

            lblImagePath .Text = folderPath + Path.GetFileName(FileUpload1.FileName);
            
            


        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            if(userType == "Customer")
            {
                Response.Redirect("CustomerPage.aspx");
            }
            else
            {
                Response.Redirect("SellerPage.aspx");
            }
        }
    }
}