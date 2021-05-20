<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineRent.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
          margin-top: 120px;
          max-width: 600px;
          height: 450px;
          border: 1px solid #9C9C9C;
          background-color: #EAEAEA;
        }
        #login .container #login-row #login-column #login-box #loginform {
          padding: 20px;
        }
        #login .container #login-row #login-column #login-box #loginform #register-link {
          margin-top: -65px;
        }
        #text{
            display:block;
            color:#000;
            font-weight:300;
            font-style:italic;
            padding :5px;
        }
    </style>

    <%--<script>
        function validation() {
            var form = document.getElementById("loginform");
            var email = document.getElementById("email").value;
            var text = document.getElementById("text");
            var pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/ ;
            if (email.match(pattern)) {
                //form.classList.add("valid");
                //form.classList.remove("invalid");
                text.innerHTML = "Your Email Address is Valid.";
                text.style.color = "#00ff00";
            }
            else {
                //form.classList.remove("valid");
                //form.classList.add("invalid");
                text.innerHTML = "Please Enter Valid Email Address";
                text.style.color = "#ff0000";
            }
            if (email == "") {
                //form.classList.remove("valid");
                //form.classList.remove("invalid");
                text.innerHTML = "";
                text.style.color = "#00ff00";
            }
        }


    </script>--%>
</head>
<body>
     <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="loginform" class="form" runat="server" method ="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">E-mail id:</label><br>
                                <asp:TextBox data-purpose="email" type="email" name="email" id="email" class="form-control"  runat="server"  ></asp:TextBox>
                                <asp:Label ID="email_message" runat="server" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Email Address" ControlToValidate="email" ValidationGroup="LoginGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <asp:TextBox type="password" name="username" id="password" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Password" ControlToValidate="password" ValidationGroup="LoginGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                            <div class="form-group">
                                <asp:Button type="submit" name="submit" class="btn btn-info btn-md" value="submit" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="LoginGroup" />
                                 <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                             </div>
                             
                            <div id="register-link" class="text-right">
                                
                                <asp:Button type="submit" name="forgot" class="btn btn-info btn-md" value="Forgot" ID="Button2" runat="server" Text="Forgot Password"  OnClick="Button2_Click" />
                                
                                
                            </div>
                             <div  class="text-center">
                          
                                
                                
                            </div>
                            <br />
                            <label for="register" class="text-info"><span>Don't Have an Account!</span> </label><br>
                                <asp:LinkButton ID="LinkButton2" class="text-info" runat="server" OnClick="LinkButton1_Click">Register Here</asp:LinkButton>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    
</body>
</html>
