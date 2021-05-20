using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRent
{
    public partial class ViewHouseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Row"] != null)
                {
                    //Fetch the GridView Row from Session.
                    GridViewRow row = Session["Row"] as GridViewRow;

                    //Fetch and display the Cell values.
                    
                    string houseName = row.Cells[1].Text;
                    string base64String;
                    HouseRentEntities houseRent = new HouseRentEntities();
                    Post post = houseRent.Posts.First(a => (a.HouseName == houseName));
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
                    if(post.Kitchen == true)
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
                    lblAdditionalValue.Text = post.Additional;


                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("CustomerPage.aspx");
           
        }
    }
}