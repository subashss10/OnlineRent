using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class ViewRequestedUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                ViewPostDetails();
                BindGridView();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void ViewPostDetails()
        {
            //Fetch the GridView Row from Session.
            //GridViewRow row = Session["Row"] as GridViewRow;

            //Fetch and display the Cell values.

            //string houseName = row.Cells[1].Text;
            int postId = Convert.ToInt32(Session["postId"]);
            string base64String;
            HouseRentEntities houseRent = new HouseRentEntities();
            Post post = houseRent.Posts.First(a => (a.Id == postId));
            byte[] bytes = post.Image;
            if (bytes != null)
            {
                base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image1.ImageUrl = "data:image/png;base64," + base64String;
            }
            lblHouseNameValue.Text = post.HouseName;
            lblAddressValue.Text = post.Address;
            lblPhnValue.Text = post.PhoneNumber;
            lblFloorValue.Text = post.Floor.ToString();
            lblBedRoomValue.Text = post.Bedroom.ToString();
            if (post.Kitchen == true)
            {
                lblKitchenValue.Text = "Yes";
            }
            else
            {
                lblKitchenValue.Text = "No";
            }
            if (post.Dining == true)
            {
                lblDiningValue.Text = "Yes";
            }
            else
            {
                lblDiningValue.Text = "No";
            }
            if (post.Family == "Yes")
            {
                lblFamilyValue.Text = "Yes";
            }
            else
            {
                lblFamilyValue.Text = "No";
            }
            if (post.Bachelor == "Yes")
            {
                lblBachelorValue.Text = "Yes";
            }
            else
            {
                lblBachelorValue.Text = "No";
            }
            if (post.Office == "Yes")
            {
                lblOfficeValue.Text = "Yes";
            }
            else
            {
                lblOfficeValue.Text = "No";
            }
            lblRentValue.Text = post.Rent.ToString();
            if(post.Additional != null)
            {
                lblAdditionalValue.Text = post.Additional;
            }
            else
            {
                lblAdditionalValue.Text = "Not Specified";
            }


        }
        private void BindGridView()
        {
            try
            {
                string email = Session["email"].ToString();
                int postId = Convert.ToInt32(Session["postId"]);
                HouseRentEntities houseRent = new HouseRentEntities();
                Post post = new Post();
                User user = new User();
                UserPost userPost = new UserPost();
                var userPostDetails = houseRent.UserPosts.Where(a => a.PostId == postId).DefaultIfEmpty();
                var userDetails = (from a in houseRent.Users
                                   join b in userPostDetails on a.id equals b.RequestedUserId
                                    
                                   select new
                                   {
                                       statusId = b.PostStatus,
                                       postId = postId,
                                       userId = a.id,
                                       Name = a.FirstName + " " + a.LastName, 
                                       Email = a.Email,
                                       PhoneNumber = a.PhoneNumber,
                                       Status = b.Status.StatusDescription
                                   }
                                       ).ToList();
                GridView1.DataSource = userDetails;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkBtnAccept = (LinkButton)e.Row.FindControl("BtnAccept");
                LinkButton lnkBtnReject = (LinkButton)e.Row.FindControl("BtnReject");
                //int id = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                int statusId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[3]);
                //string email = Session["email"].ToString();
                //HouseRentEntities houseRent = new HouseRentEntities();
                //var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                ////User user = houseRent.Users.First(i => i.Email == email);
                //UserPost userPost = houseRent.UserPosts.First(i => i.PostId == id && i.RequestedUserId == emailCheck.id);
                if (statusId == 4)
                {

                    lnkBtnAccept.Visible = false;
                    lnkBtnReject.Visible = false;
                }
                else if(statusId == 2 )
                {
                    lnkBtnAccept.Visible = false;
                }
                else if(statusId == 3)
                {
                    lnkBtnReject.Visible = false;
                    
                }
                
            }
        }
        protected void BtnAccept_Click(object sender, EventArgs e)
        {
           

            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;

            //Get the value of column from the DataKeys using the RowIndex.
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            int userId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[2]);
            string email = Session["email"].ToString();
            HouseRentEntities houseRent = new HouseRentEntities();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //User user = houseRent.Users.First(i => i.Email == email);
            UserPost userPost = houseRent.UserPosts.First(i => i.PostId == id && i.RequestedUserId == userId);
            userPost.PostStatus = 2;
            userPost.UpdatedDate = DateTime.Now;
            userPost.UpdatedBy = emailCheck.id;
            houseRent.SaveChanges();
            Response.Redirect("ViewRequestedUsers.aspx");
            
        }

        protected void BtnReject_Click(object sender, EventArgs e)
        {
            
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;

            //Get the value of column from the DataKeys using the RowIndex.
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            int userId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[2]);
            string email = Session["email"].ToString();
            HouseRentEntities houseRent = new HouseRentEntities();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //User user = houseRent.Users.First(i => i.Email == email);
            UserPost userPost = houseRent.UserPosts.First(i => i.PostId == id && i.RequestedUserId == userId);
            userPost.PostStatus = 3;
            userPost.UpdatedDate = DateTime.Now;
            userPost.UpdatedBy = emailCheck.id;
            houseRent.SaveChanges();
            Response.Redirect("ViewRequestedUsers.aspx");
        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
           
             Response.Redirect("SellerPage.aspx");
            
        }
    }
}