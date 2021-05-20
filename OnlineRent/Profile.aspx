<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineRent.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <style>
        .circular--square {
          border-radius: 50%;
          width:200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        

        <div class="container">
            <div class="jumbotron">
                <div class="container bootstrap snippet">
                    <div class="row">
                        <div class="col-sm-10">
                            <h1>
                                <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></h1>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">


                             
                                <%--<asp:LinkButton ID="EditButton" runat="server" class="btn btn-lg btn-success pull-right"  ><i class="glyphicon glyphicon-edit"></i> Edit</asp:LinkButton>--%><%--<button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-edit"></i> Edit</button>--%>
                                <!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">



                            <asp:Image ImageUrl="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="circular--square" alt="avatar" ID="Image1" runat="server" />
                            <br />
                            <asp:Label ID="lblUpload" runat="server" Text="Upload a different photo..." Visible="False"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                            <asp:Button ID="BtnUpload" runat="server" Text="Upload" Visible="False" OnClick="BtnUpload_Click" />


                            <!--left col-->
                            <%--<div class="text-center">
                    <asp:Panel ID="Panel1" runat="server">
                        <form id="form1" runat="server">
                               <asp:Image ImageUrl="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar" ID="Image1" runat="server" />
                          
                            <h6>Upload a different photo...</h6>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
                            <asp:Label runat="server" ID="lblMessage" ForeColor="Green" runat="server" />
                            
                        </form>
                    </asp:Panel>
                </div>--%>
                            <br />
                            <br />
                            <asp:Label ID="lblImagePath" runat="server" Text="" Visible="False"></asp:Label>
                            <asp:LinkButton ID="EditButton" runat="server" class="btn btn-lg btn-success pull-right" OnClick="EditButton_Click"><i class="glyphicon glyphicon-edit"></i> Edit</asp:LinkButton>

                        </div>
                        <!--/col-3-->
                        <div class="col-sm-9">
                            

                            <div class="tab-content">
                                <div class="tab-pane active" id="home">

                                    <div class="tab-pane" id="settings">


                                        
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="first_name"><h4>First name</h4></asp:Label>
                                                <%--<input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">--%>
                                                <asp:TextBox runat="server" ID="txtFirst" class="form-control" name="First_Name" placeholder="First Name" title="Enter your First Name" Visible="False" ValidationGroup="EditGroup"></asp:TextBox>
                                                <asp:Label ID="lblFirst" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="last_name"><h4>Last name</h4></asp:Label>
                                                <asp:TextBox ID="txtLast" class="form-control" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lbllast" runat="server" Text="Label"></asp:Label>
                                                <%--<input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">--%>
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="phone"><h4>Phone</h4></asp:Label>
                                                <%--<input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">--%>
                                                <asp:TextBox ID="txtPhn" class="form-control" name="phone" placeholder="Enter phone Number" title="Enter your Phone Number" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblPhn" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="mobile"><h4>User Type</h4></asp:Label>
                                                <asp:TextBox class="form-control" ID="txtUser" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblUser" runat="server" Text="Label" Visible="True"></asp:Label>
                                                <%--<input type="text" class="form-control" name="usertype" id="usertype" placeholder="User type" title="enter your mobile number if any.">--%>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="email"><h4>Email</h4></asp:Label>
                                                <%--<input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">--%>
                                                <asp:TextBox class="form-control" ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblEmail" runat="server" Text="Label" Visible="True"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="Location"><h4>Location</h4></asp:Label>
                                                <asp:TextBox class="form-control" ID="txtLocation" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblLocation" runat="server" Text="Label" Visible="True"></asp:Label>
                                                <%--<input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">--%>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="password" ID="lblPass" Visible="False"><h4>Password</h4></asp:Label>
                                                <asp:TextBox class="form-control" ID="txtPassword" type="password" runat="server" Visible="False"></asp:TextBox>
                                                <asp:Label ID="lblPassword" runat="server" Text="Label" Visible="False"></asp:Label>
                                                <%--<input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">--%>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <asp:Label runat="server" for="password2" ID="lblConfirmPass" Visible="False"><h4>Confirm Password</h4></asp:Label>
                                                <asp:TextBox class="form-control" type="password" ID="txtConfirm" runat="server" Visible="False"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password And Confirm Password Should Match" ControlToCompare="txtPassword" ControlToValidate="txtConfirm"></asp:CompareValidator>
                                                <asp:Label ID="lblConfirm" runat="server" Text="Label" Visible="False"></asp:Label>
                                                <%--<input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">--%>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <br />
                                                <asp:LinkButton ID="SaveButton" runat="server" class="btn btn-lg btn-success pull-right" OnClick="SaveButton_Click" Visible="False"><i class="glyphicon glyphicon-ok-sign"></i> Save</asp:LinkButton>

                                                <%--<asp:Button class="btn btn-lg btn-success pull-right" type="submit" ID="sSaveButton" runat="server" Text="Save" />--%><%--<button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>Save</button>--%>
                                                <!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!--/tab-pane-->
                            </div>
                            <!--/tab-content-->

                        </div>
                        <!--/col-9-->
                    </div>
                    <!--/row-->
                </div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="BtnBack" runat="server" Text="Go Back" class="btn btn-primary btn-lg" OnClick="BtnBack_Click"/>
        </div>


    </form>
</body>
</html>
