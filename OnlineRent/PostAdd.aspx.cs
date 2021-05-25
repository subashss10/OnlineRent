using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class PostAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }
        protected void BtnViewMyAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerPage.aspx");
        }

        protected void BtnPostAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("PostAdd.aspx");
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void BtnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                Post post = new Post();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                post.HouseName = txtHouse.Text;
                post.Address = txtAddress.Text;
                post.PhoneNumber = txtPhoneNumber.Text;
                post.Floor = Convert.ToInt32(txtFloor.Text);
                post.Bedroom = Convert.ToInt32(ddBedRoom.SelectedValue);
                if (rbKitchenYes.Checked)
                {
                    post.Kitchen = true;
                }
                else
                {
                    post.Kitchen = false;
                }
                if (rbDiningYes.Checked)
                {
                    post.Dining = true;
                }
                else
                {
                    post.Dining = false;
                }
                if (rbFamilyYes.Checked)
                {
                    post.Family = "Yes";
                }
                else
                {
                    post.Family = "No";
                }
                if (rbBachelorYes.Checked)
                {
                    post.Bachelor = "Yes";
                }
                else
                {
                    post.Bachelor = "No";
                }
                if (rbOfficeYes.Checked)
                {
                    post.Office = "Yes";
                }
                else
                {
                    post.Office = "No";
                }
               
                post.CreatedDate = DateTime.Now;
                
                post.CreatedBy = emailCheck.id;
                post.UpdatedDate = null;
                post.Rent = Convert.ToInt32(txtRent.Text);
                if(txtAdditional.Text != "")
                {
                    post.Additional = txtAdditional.Text;
                }
                int length = fuImage.PostedFile.ContentLength;
                byte[] pic = new byte[length];

                fuImage.PostedFile.InputStream.Read(pic, 0, length);
                post.Image = pic;

                houseRent.Posts.Add(post);
                houseRent.SaveChanges();
                lblMessage.Text = "Post Saved Successfully";



            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
            }

        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("SellerPage.aspx");
           
        }

        protected void BtnBrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerPage.aspx");
        }
    }
}