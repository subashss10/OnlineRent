using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineRent.Business
{
    public class Registration
    {
        public bool flag = false;
        public string InsertUser(string fName, string lName, string email, string phnNumber, string userRole, string password)
        {
            string message;
                       
            try
            {

                HouseRentEntities houseRent = new HouseRentEntities();

                User user = new User();
                var emailCheck = houseRent.Users.Where(a => a.Email.ToLower() == email.ToLower()).FirstOrDefault();
                if (emailCheck != null)
                {
                    message = "Email id already exists";
                    flag = true;
                }
                else
                {
                    user.FirstName = fName;
                    user.LastName = lName;
                    user.Email = email;
                    user.PhoneNumber = phnNumber;
                    user.UserRoleId = Convert.ToInt32(userRole);
                    user.Password = password;

                    houseRent.Users.Add(user);
                    houseRent.SaveChanges();
                    message = "User Saved Successfully";
                    flag = false;
                }

                //houseRent.RegistrationInsert();
            }
            catch(Exception e)
            {
                message = e.Message;
            }
            return message;
        }
        public string RetrieveUser(string email,string password)
        {
           
            string message = "";
            
            try
            {
                HouseRentEntities houseRent = new HouseRentEntities();

                User user = new User();
                var emailCheck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower()) && (a.Password == password)).FirstOrDefault();
                if (emailCheck != null)
                {
                   
                    flag = false;
                }
                else
                {
                    var echeck = houseRent.Users.Where(a => (a.Email.ToLower() == email.ToLower())).FirstOrDefault();
                    if(echeck != null)
                    {
                        message = "Invalid Password";
                    }
                    else
                    {
                        message = "There was a problem logging in. Check your email and password or create an account.";
                    }
                    flag = true;
                    
                }

            }
            catch (Exception e)
            {
                message = e.Message;
            }
            return message;
        }
        

        public string UpdateUser(string email,string fname,string lname,string phn,string password,string location, byte[] image)
        {
            string message = "";
            try
            {
                HouseRentEntities houseRent = new HouseRentEntities();

                User user = houseRent.Users.First(i => i.Email == email);
                
                user.FirstName = fname;
                user.LastName = lname;
                user.Password = password;
                user.PhoneNumber = phn;
                user.Location = location;
                if(image != null)
                {
                    user.Images = image;
                }
                
                houseRent.SaveChanges();
                message = "Changes Updated Sucessfully";

            }
            catch (Exception e)
            {
                message = e.Message;
            }
            return message;
        }
    }
}