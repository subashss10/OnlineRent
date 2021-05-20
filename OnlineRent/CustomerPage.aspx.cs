using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class CustomerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            BindGridView();
            


        }
        private void BindGridView()
        {
            try
            {
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                Post post = new Post();
                User user = new User();
                //var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                //var postDetails = houseRent.Posts.Where(a => (a.CreatedBy == emailCheck.id)).FirstOrDefault();
                //var postDetails1 = (from x in houseRent.Posts select x).ToList();
                var postDetails = (from a in houseRent.Posts
                                   
                                   
                                   select new
                                   {
                                      
                                       Id = a.Id,
                                       HouseName = a.HouseName,
                                       Rent = a.Rent,
                                       Image = a.Image,
                                       
                                   }
                                       ).DefaultIfEmpty().ToList();

                //var postDetails = houseRent.Posts.ToList();

                GridView1.DataSource = postDetails;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkBtn = (LinkButton)e.Row.FindControl("BtnBookHouse");
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                int postId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                UserPost userPost = houseRent.UserPosts.FirstOrDefault(i => i.PostId == postId && i.RequestedUserId == emailCheck.id);

                if (userPost != null && (userPost.PostStatus == 1 || userPost.PostStatus == 2))
                {
                    lblStatus.Text = userPost.Status.StatusDescription;
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



        protected void BtnBookHouse_Click(object sender, EventArgs e)
        {
            try
            {

                int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
                int postId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
                string email = Session["email"].ToString();
                HouseRentEntities houseRent = new HouseRentEntities();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                int requestedUserId = emailCheck.id;
                int statusId = 1;
                UserPost userPost = houseRent.UserPosts.Where(a => a.PostId == postId && a.RequestedUserId == emailCheck.id).FirstOrDefault();
                if (userPost != null && userPost.PostStatus != 1)
                {
                    userPost.PostStatus = statusId;
                    userPost.UpdatedBy = requestedUserId;
                    userPost.UpdatedDate = DateTime.Now;
                    houseRent.SaveChanges();

                }
                else
                {
                    UserPost userP = new UserPost();

                    userP.PostId = postId;
                    userP.RequestedUserId = requestedUserId;
                    userP.PostStatus = statusId;
                    userP.CreatedDate = DateTime.Now;
                    userP.CreatedBy = requestedUserId;
                    userP.UpdatedBy = requestedUserId;
                    userP.UpdatedDate = DateTime.Now;
                    houseRent.UserPosts.Add(userP);
                    houseRent.SaveChanges();
                }
                

                
                Response.Redirect("CustomerPage.aspx");
                //var userPostCheck = houseRent.UserPosts.Where(a => a.PostId == postId && a.RequestedUserId == requestedUserId).FirstOrDefault();
                //if(userPostCheck != null)
                //{
                //    LinkButton BtnBookHouse = (LinkButton)sender;
                //    BtnBookHouse.Visible = false;
                //    Label lblStatus = (Label)sender;
                //    lblStatus.Text = "Requested";
                //}

                //((Label)GridView1.SelectedRow.FindControl("lblStatus")).Text = "Requested";
            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            //finally
            //{
            //    int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            //    int postId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            //    string email = Session["email"].ToString();
            //    HouseRentEntities houseRent = new HouseRentEntities();
            //    var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //    int requestedUserId = emailCheck.id;

            //    var userPostCheck = houseRent.UserPosts.Where(a => a.PostId == postId && a.RequestedUserId == requestedUserId).FirstOrDefault();
            //    if (userPostCheck != null)
            //    {

            //        LinkButton BtnBookHouse = (LinkButton)sender;
            //        BtnBookHouse.Visible = false;
            //        //int index = GridView1.EditIndex;
            //        //GridViewRow row = GridView1.Rows[index];
            //        //Label lblStatus = (Label)row.FindControl("lblStatus");
            //        //lblStatus.Text = "Requested";
            //    }
            //}
           
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
    