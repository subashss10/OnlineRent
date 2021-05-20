<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineRent.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--<script src="Js/validation.js"></script>--%>
    <%--<script src="Js/formValidation.js"></script>--%>
    <style>
        body {
          margin: 0;
          padding: 0;
          /*background-color: #17a2b8;*/
          background-image: url(Images/H1.jfif);
          height: 100%;

          /* Center and scale the image nicely */
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          /*height: 100vh;*/
        }
        #login .container #login-row #login-column #login-box {
          margin-top: 30px;
          max-width: 600px;
          height: 900px;
          border: 1px solid #9C9C9C;
          background-color: #EAEAEA;
        }
        #login .container #login-row #login-column #login-box #loginform {
          padding: 20px;
        }
        #login .container #login-row #login-column #login-box #loginform #register-link {
          margin-top: -65px;
        }
    </style>
   <%-- <script>
        window.onload = function () {
            var txtPassword = document.getElementById("password");
            var txtConfirmPassword = document.getElementById("confirm");
            //var userType = document.getElementById("usertype").value;
            //userType.setCustomValidity("");
            //if (userType == "") {
            //    userType.setCustomValidity("Please Select Valid User Type");
            //}
            txtPassword.onchange = ConfirmPassword;
            txtConfirmPassword.onkeyup = ConfirmPassword;
            function ConfirmPassword() {
                txtConfirmPassword.setCustomValidity("");
                if (txtPassword.value != txtConfirmPassword.value) {
                    txtConfirmPassword.setCustomValidity("Passwords do not match.");
                }
            }
        }
    </script>--%>
</head>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Registration form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="loginform" class="form" runat="server" method ="post">
                            <h3 class="text-center text-info">Register</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">First Name:</label><br>

                                <asp:TextBox type="text" name="firstName" ID ="fName" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is Required*" ControlToValidate="fName" ForeColor="Red" SetFocusOnError="False" Display="Dynamic" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                               
                            </div>
                            <div class="form-group">
                                <label for="username" class="text-info">Last Name:</label><br>
                                <asp:TextBox type="text" name="lastName" id="lName" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is Required*" Display="Dynamic" ControlToValidate="lName" SetFocusOnError="False" ForeColor="Red" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="username" class="text-info">E-mail id:</label><br>
                                <asp:TextBox name="E-mail" data-purpose="email" type="email" id="email" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Id is Required*" ForeColor="Red" Display="Dynamic" SetFocusOnError="False" ControlToValidate="email" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" SetFocusOnError="False"></asp:RegularExpressionValidator>
                                
                                <%--<asp:Label ID="email_message" runat="server" Text=""></asp:Label>--%>
                               
                            </div>
                            
                            <div class="form-group">
                                <label for="PhoneNumber" class="text-info">Phone Number:</label><br>
                                <asp:TextBox type="text" name="phnnumber" id="phn" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number is Required*" Display="Dynamic" ForeColor="Red" ControlToValidate="phn" SetFocusOnError="False" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone Number*" Display="Dynamic" ControlToValidate="phn" ValidationExpression="^[0-9]{10}$" SetFocusOnError="False" ValidationGroup="SubmitGroup" ForeColor="Red"></asp:RegularExpressionValidator>
                                <%--<asp:Label ID="phmessage" runat="server" Text=""></asp:Label>--%>
                               
                            </div>
                            <div class="form-group">
                                <label for="UserType" class="text-info">User Type:</label><br>
                                <asp:DropDownList name="userType" id="usertype" class="form-control" runat="server" >
                                    <asp:ListItem >Please Select</asp:ListItem>
                                    <asp:ListItem Value="1">Customer</asp:ListItem>
                                    <asp:ListItem Value="2">Seller</asp:ListItem>
                                </asp:DropDownList>    
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Choose User Type*" Display="Dynamic" ControlToValidate="usertype" InitialValue="Please Select" ForeColor="Red" SetFocusOnError="False" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <asp:TextBox type="password" name="password" id="password" class="form-control" runat="server" ></asp:TextBox>   
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password is Required*" Display="Dynamic" ControlToValidate="password" SetFocusOnError="False" ForeColor="Red" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" ControlToValidate="password" EnableClientScript="True" Display="Dynamic" SetFocusOnError="False" ValidationGroup="SubmitGroup" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Confirm Password:</label><br>
                                <asp:TextBox type="password" name="username" id="confirm" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirm Password is Required*" Display="Dynamic" SetFocusOnError="False" ControlToValidate="confirm" ForeColor="Red" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password And Confirm Password Should Match" ControlToCompare="password" ControlToValidate="confirm" SetFocusOnError="False" Display="Dynamic" ValidationGroup="SubmitGroup" ForeColor="Red"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button type="submit" name="submit" class="btn btn-info btn-md" value="submit" ID="Button1" runat="server" Text="Submit"  OnClick="Button1_Click" ValidationGroup="SubmitGroup" />
                                
       
                                <asp:Label ID="lblmessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                
       
                            </div>
                            <div class="form-group">
                                <label for="login" class="text-info"><span>Already Have an Account!</span> </label><br>
                                <asp:LinkButton ID="LoginButton" class="text-info" runat="server" OnClick="LoginButton_Click">Login Here</asp:LinkButton>
                            </div>
                            
           
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
</body>
</html>
