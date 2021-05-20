<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerPage.aspx.cs" Inherits="OnlineRent.SellerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <%--<script src="js/jquery-2.1.4.min.js"></script>  
    <script src="js/bootstrap.min.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!--Navbar Header Start Here-->
                <div class="navbar-header">
                    <asp:LinkButton ID="BtnBrand" class="navbar-brand" Font-Italic="True" OnClick="BtnBrand_Click" runat="server">Online House Rent Management System</asp:LinkButton>
                    <%--<a class="navbar-brand" href="#">Online House Rent Management System</a>--%>
                </div>
                <!--Navbar Header End Here-->
                <!--Menu Start Here-->
                <ul class="nav navbar-nav">
                    <li class="active">
                        <asp:LinkButton ID="BtnViewMyAdd" runat="server" Text="My House List" OnClick="BtnViewMyAdd_Click"></asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BtnPostAdd" runat="server" Text="Post Add" OnClick="BtnPostAdd_Click"></asp:LinkButton></li>
                    
                </ul>
                <!--Menu End Here-->
                <!--Right Aligned Menu Start-->
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <asp:LinkButton ID="BtnEditProfile" runat="server" Text="Edit Profile" OnClick="BtnEditProfile_Click"></asp:LinkButton></li>
                        
                    <li>
                        <asp:LinkButton ID="BtnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click"></asp:LinkButton></li>
                </ul>
                <!--Right Aligned Menu End-->
            </div>
        </nav>
            </div>
        <div class="container">
            <!--Creating Jumbotron inside container--><div class="jumbotron">
                <h1><asp:Label ID="lblPostMessage" runat="server" Text=""></asp:Label></h1>
                <asp:GridView CssClass="table table-bordered" HeaderStyle-CssClass="bg-primary text-white" AutoGenerateColumns="false" ID="GridView1" DataKeyNames="Id" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="OnRowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' Height="100px" Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:ImageField HeaderText="Image" ControlStyle-Height="50" DataImageUrlField="Image"></asp:ImageField>--%>
                        <asp:BoundField HeaderText="House Name" DataField="HouseName" />
                        <asp:BoundField HeaderText="Rent" DataField="Rent" />
                        <asp:TemplateField HeaderText="Edit House Details">
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnEdit" Text="Edit" runat="server" OnClick="BtnEdit_Click" />
                            </ItemTemplate>
                        </asp:TemplateField >
                        <asp:TemplateField HeaderText="Delete Add" >
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnDelete" Text="Delete" runat="server" OnClick="BtnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField >
                        <asp:TemplateField HeaderText="View Requested Users">
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnViewRequests" Text="View Requests" runat="server" OnClick="BtnViewRequests_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
    </form>
    <%--<script src="Js/jquery-2.1.4.min.js"></script>
    <script src="Js/bootstrap.min.js"></script>--%>
</body>
</html>
