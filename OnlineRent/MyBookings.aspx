<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="OnlineRent.MyBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <!--Navbar Header Start Here-->
                    <div class="navbar-header">
                        <asp:LinkButton ID="BtnBrand" class="navbar-brand" OnClick="BtnBrand_Click" runat="server" Text="Online House Rent Management System" Font-Italic="True"></asp:LinkButton>
                        <%--<a class="navbar-brand" href="#">Online Rent</a>--%>
                    </div>
                    <!--Navbar Header End Here-->
                    <!--Menu Start Here-->
                    <ul class="nav navbar-nav">
                        <li >
                            <asp:LinkButton ID="BtnHome" runat="server" Text="Home" OnClick="BtnHome_Click"></asp:LinkButton></li>
                        <li class="active">
                            <asp:LinkButton ID="BtnMyBooking" runat="server" Text="My Bookings" OnClick="BtnMyBooking_Click"></asp:LinkButton></li>
                       
                    </ul>
                    <!--Menu End Here-->
                    <!--Right Aligned Menu Start-->
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:LinkButton ID="lblEdit" runat="server" Text="Edit Profile" OnClick="lblEdit_Click"></asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lblLogout" runat="server" Text="Logout" OnClick="lblLogout_Click"></asp:LinkButton></li>
                            
                    </ul>
                    <!--Right Aligned Menu End-->
                </div>
            </nav>
        </div>
        <div class="container">
            <!--Creating Jumbotron inside container-->
            <div class="jumbotron">
                <asp:GridView CssClass="table table-bordered"  HeaderStyle-CssClass="bg-primary text-white" AutoGenerateColumns="false" ID="GridView1" runat="server" DataKeyNames="Id,statusId" OnRowDataBound="GridView1_RowDataBound" >
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' Height="100px" Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:ImageField HeaderText="Image" ControlStyle-Height="50" DataImageUrlField=""></asp:ImageField>--%>
                        <asp:BoundField HeaderText="House Name" DataField="HouseName" />
                        <asp:BoundField HeaderText="Rent" DataField="Rent" />
                        <asp:BoundField HeaderText="Status" DataField="Status" />
                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>
                                <asp:LinkButton ID="BtnCancel" Text="Cancel Booking" runat="server" OnClick="BtnCancel_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>

                            <ItemTemplate>
                                <asp:LinkButton ID="BtnView" Text="View More" runat="server" OnClick="BtnView_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="BtnBack" runat="server" Text="Go Back" class="btn btn-primary btn-lg" OnClick="BtnBack_Click"/>
        </div>
    </form>
   <%-- <script src="Js/jquery-2.1.4.min.js"></script>
    <script src="Js/bootstrap.min.js"></script>--%>
</body>
</html>
