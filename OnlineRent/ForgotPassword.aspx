<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineRent.ForgotPassword" %>

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
          height: 300px;
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
</head>
<body>
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="loginform" class="form" runat="server" method ="post">
                            <h3 class="text-center text-info">Forgot Password</h3>
                            <div class="form-group">
                                <label for="Email" class="text-info">Please Enter your E-mail Address:</label>
                                <asp:TextBox data-purpose="email" type="email" name="email" class="form-control"  runat="server" ID="txtEmail"  />
                                <asp:Label ID="lblMessage" runat="server" />
                           </div>
                            
                            <div class="form-group">
                                <asp:Button type="submit" name="submit" class="btn btn-info btn-md" value="submit" ID="Button1" runat="server" Text="Send" OnClick="SendEmail" />
                                 
                            </div>
                            <div class="form-group">
                                <label for="login" class="text-info"><span>Click here to Login Again</span> </label><br />
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
