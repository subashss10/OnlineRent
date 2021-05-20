using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //string email = "subash10@gmail.com";
            //HouseRentEntities houseRent = new HouseRentEntities();
            //User user = new User();
            //var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //byte[] bytes = emailCheck.Images;
            //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //Image1.ImageUrl = "data:image/png;base64," + base64String;
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {

            

            int length = FileUpload1.PostedFile.ContentLength;
            byte[] pic = new byte[length];

            FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
            string email = "subash10@gmail.com";
            HouseRentEntities houseRent = new HouseRentEntities();
            User user = new User();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();

            try
            {

                emailCheck.Images = pic;
                houseRent.SaveChanges();
                Label1.Visible = true;
                Label1.Text = "Image Uploaded Sucessfully";  //after Sucessfully uploaded image
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                byte[] bytes = emailCheck.Images;
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image1.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
    }
}