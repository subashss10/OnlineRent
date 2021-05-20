using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class EditPostDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Session["email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {

                    string email = Session["email"].ToString();
                    int postId = Convert.ToInt32(Session["postId"]);
                    HouseRentEntities houseRent = new HouseRentEntities();
                    Post post = new Post();
                    User user = new User();
                    var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                    var postDetails = houseRent.Posts.Where(a => (a.Id == postId)).FirstOrDefault();
                    txtHouse.Text = postDetails.HouseName;
                    txtAddress.Text = postDetails.Address;
                    txtPhoneNumber.Text = postDetails.PhoneNumber;
                    ddBedRoom.SelectedValue = postDetails.Bedroom.ToString();
                    txtFloor.Text = postDetails.Floor.ToString();
                    if (postDetails.Kitchen == true)
                    {
                        rbKitchenYes.Checked = true;
                    }
                    else
                    {
                        rbKitchenNo.Checked = true;
                    }
                    if (postDetails.Dining == true)
                    {
                        rbDiningYes.Checked = true;
                    }
                    else
                    {
                        rbDiningNo.Checked = true;
                    }
                    if (postDetails.Family == "Yes")
                    {
                        rbFamilyYes.Checked = true;
                    }
                    else
                    {
                        rbFamilyNo.Checked = true;
                    }
                    if (postDetails.Bachelor == "Yes")
                    {
                        rbBachelorYes.Checked = true;
                    }
                    else
                    {
                        rbBachelorNo.Checked = true;
                    }
                    if (postDetails.Office == "Yes")
                    {
                        rbOfficeYes.Checked = true;
                    }
                    else
                    {
                        rbOfficeNo.Checked = true;
                    }
                    txtRent.Text = postDetails.Rent.ToString();
                    if (postDetails.Additional != null)
                    {
                        txtAdditional.Text = postDetails.Additional;
                    }







                }
            }

        }

        
        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                //Post post = new Post();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                Post post = houseRent.Posts.FirstOrDefault(a => (a.CreatedBy == emailCheck.id));
                //var postDetails = houseRent.Posts.Where(a => (a.CreatedBy == emailCheck.id)).FirstOrDefault();
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
                post.Approval = 0;
                post.CreatedDate = DateTime.Now;
                post.ApprovedDate = null;
                post.CreatedBy = emailCheck.id;
                post.UpdatedDate = null;
                post.Rent = Convert.ToInt32(txtRent.Text);
                if (txtAdditional.Text != "")
                {
                    post.Additional = txtAdditional.Text;
                }
                if (fuImage.HasFile)
                {
                    int length = fuImage.PostedFile.ContentLength;
                    byte[] pic = new byte[length];

                    fuImage.PostedFile.InputStream.Read(pic, 0, length);
                    post.Image = pic;
                }

                
                houseRent.SaveChanges();
                
                lblMessage.Text = "Post Updated Successfully";
                


            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }




        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("SellerPage.aspx");
            
        }
    }
}