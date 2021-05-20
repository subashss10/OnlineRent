using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class ViewAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] == null)
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
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                var postDetails = houseRent.Posts.Where(a => (a.CreatedBy == emailCheck.id)).FirstOrDefault();
                var postDetails1 = (from x in houseRent.Posts select x).Where(a => (a.CreatedBy == emailCheck.id) && (a.isDeleted == 0)).ToList();
                
                GridView1.DataSource = postDetails1;
                GridView1.DataBind();


            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //try
            //{
            //    if (e.Row.RowType == DataControlRowType.DataRow)
            //    {
            //        string email = Session["email"].ToString();
            //        HouseRentEntities houseRent = new HouseRentEntities();
            //        Post post = new Post();
            //        User user = new User();
            //        var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            //        var postDetails = houseRent.Posts.Where(a => (a.CreatedBy == emailCheck.id)).FirstOrDefault();
            //        byte[] bytes = postDetails.Image;

            //        string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
            //        (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            //    }
            //}
            //catch(Exception ex)
            //{
            //    lblMessage.Text = ex.Message;
            //}
        }
        protected void BtnViewRequests_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int postId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            Session["postId"] = postId;
            Response.Redirect("ViewRequestedUsers.aspx");

        }
        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int postId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            Session["postId"] = postId;
            Response.Redirect("EditPostDetails.aspx");

        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            HouseRentEntities houseRent = new HouseRentEntities();
            Post post = new Post();
            var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
            var postDetails = houseRent.Posts.Where(a => (a.CreatedBy == emailCheck.id)).FirstOrDefault();
            postDetails.isDeleted = 1;
            houseRent.SaveChanges();
            Response.Redirect("ViewAdd.aspx");
        }
        
    }
}