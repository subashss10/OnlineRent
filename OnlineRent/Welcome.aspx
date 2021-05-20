<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="OnlineRent.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <%--<script src="js/jquery-2.1.4.min.js"></script>  
    <script src="js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h1>Welcome <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label></h1>
        </div>
        <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>
        <br />

        <asp:LinkButton ID="profile" runat="server" OnClick="profile_Click">Profile</asp:LinkButton>
        <br />

        <asp:LinkButton ID="homePage" runat="server" OnClick="homePage_Click">HomePage</asp:LinkButton>
    </form>
    <nav class="navbar navbar-inverse">  
        <div class="container-fluid">  
            <!--Navbar Header Start Here-->  
            <div class="navbar-header">  
                <a class="navbar-brand" href="#">C-sharp Corner</a>  
            </div>  
            <!--Navbar Header End Here-->  
            <!--Menu Start Here-->  
            <ul class="nav navbar-nav">  
                <li class="active"><a href="#">Home</a></li>  
                <li><a href="#">About Us</a></li>  
                <!--dropdown Menu Start-->  
                <li class="dropdown">  
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">  
                        Technology  
                        <span class="caret"></span>  
                    </a>  
                    <ul class="dropdown-menu">  
                        <li><a href="#">.NET</a></li>  
                        <li><a href="#">HTML5</a></li>  
                        <li><a href="#">ASP.NET MVC</a></li>  
                        <li><a href="#">Java</a></li>  
                    </ul>  
                </li>  
                <!--dropdown Menu End-->  
                <li><a href="#">Contact Us</a></li>  
            </ul>  
            <!--Menu End Here-->  
            <!--Right Aligned Menu Start-->  
            <ul class="nav navbar-nav navbar-right">  
                <li><a href="#">Login</a></li>  
                <li><a href="#">Register Profile</a></li>  
            </ul>  
            <!--Right Aligned Menu End-->  
        </div>  
    </nav>  
    <%--<script src="Js/jquery-2.1.4.min.js"></script>  
    <script src="Js/bootstrap.min.js"></script>  --%>
</body>
</html>
