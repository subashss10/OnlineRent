using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                BindGridView();


            }
        }
        private void BindGridView()
        {
            try
            {
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                Post post = new Post();
                User user = new User();
                UserPost userPost = new UserPost();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                //var postdetailsCheck = houseRent.UserPosts.Where(a => a.RequestedUserId == emailCheck.id).Select(a=> a.PostId).;
                var postdetailsCheck = (from x in houseRent.UserPosts select x).Where(a => a.RequestedUserId == emailCheck.id).DefaultIfEmpty();
                //var postDetails = houseRent.Posts.Where(a => (a.Id == postdetailsCheck.)).ToList();

                //var postDetails = (from x in houseRent.Posts select x).Where(x => (x.Id == postdetailsCheck.Where(a=> a.PostId));
                var postDetails = (from a in houseRent.Posts
                                   join b in postdetailsCheck on a.Id equals b.PostId
                                   select new
                                   {
                                       Id = a.Id,
                                       HouseName = a.HouseName,
                                       Rent = a.Rent,
                                       Image = a.Image,
                                       Status = b.Status.StatusDescription,
                                       statusId = b.PostStatus
                                   }
                                       ).ToList();


                GridView1.DataSource = postDetails;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void BtnMyBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBookings.aspx");
        }



        protected void lblLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void lblEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkBtn = (LinkButton)e.Row.FindControl("BtnCancel");
                
                //int id = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                int statusId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[1]);
                //string email = Session["email"].ToString();
                //HouseRentEntities houseRent = new HouseRentEntities();
                //var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                ////User user = houseRent.Users.First(i => i.Email == email);
                //UserPost userPost = houseRent.UserPosts.First(i => i.PostId == id && i.RequestedUserId == emailCheck.id);
                if (statusId == 4 || statusId == 3)
                {

                    lnkBtn.Visible = false;
                }
            }
        }

        protected void BtnView_Click(object sender, EventArgs e)
        {
            //Reference the Button.
            LinkButton BtnView = sender as LinkButton;

            //Reference the GridView Row.
            GridViewRow row = BtnView.NamingContainer as GridViewRow;

            //Save the GridView Row in Session.
            Session["Row"] = row;

            //Redirect to other Page.
            Response.Redirect("ViewHouseDetails.aspx");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;

            //Get the value of column from the DataKeys using the RowIndex.
            
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            string email = Session["email"].ToString();
            HouseRentEntities houseRent = new HouseRentEntities();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //User user = houseRent.Users.First(i => i.Email == email);
            UserPost userPost = houseRent.UserPosts.First(i => i.PostId == id && i.RequestedUserId == emailCheck.id);
            userPost.PostStatus = 4;
            userPost.UpdatedDate = DateTime.Now;
            userPost.UpdatedBy = emailCheck.id;
            houseRent.SaveChanges();
            Response.Redirect("MyBookings.aspx");


        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("CustomerPage.aspx");
            
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPage.aspx");
        }

        protected void BtnBrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPage.aspx");
        }
    }
}