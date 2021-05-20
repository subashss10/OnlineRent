<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostAdd.aspx.cs" Inherits="OnlineRent.PostAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
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
                        <asp:LinkButton class="navbar-brand" ID="BtnBrand" runat="server" OnClick="BtnBrand_Click" Font-Italic="True">Online House Rent Management System</asp:LinkButton>
                        <%--<a class="navbar-brand text-success" href="#">Online Rent</a>--%>
                    </div>
                    <!--Navbar Header End Here-->
                    <!--Menu Start Here-->
                    <ul class="nav navbar-nav">
                        <li>
                            <asp:LinkButton ID="BtnViewMyAdd" runat="server" Text="My House List" OnClick="BtnViewMyAdd_Click"></asp:LinkButton></li>
                        <li class="active">
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
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-6">
                        <asp:Label ID="lblHouse" runat="server" Text="House Name"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtHouse" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" class="form-control" ID="txtAddress" TextMode="MultiLine" Rows="3" Height="56px" Width="495px" />
                        <br />
                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblFloor" runat="server" Text="Floor"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtFloor" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblBedRoom" runat="server" Text="BedRoom"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddBedRoom" class="form-control" runat="server">
                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="lblAdditional" runat="server" Text="Additional Remarks"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtAdditional" class="form-control" runat="server" Text=""></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <asp:Label ID="lblKitchen" runat="server" Text="Kitchen"></asp:Label>
                        <asp:RadioButton ID="rbKitchenYes" class="form-check-input" runat="server" Text="Yes" GroupName="Kitchen" />
                        <asp:RadioButton ID="rbKitchenNo" class="form-check-input" runat="server" Text="No" GroupName="Kitchen" />
                        <br />
                        <br />
                        <asp:Label ID="lblDining" runat="server" Text="Dining"></asp:Label>
                        <asp:RadioButton ID="rbDiningYes" class="form-check-input" runat="server" Text="Yes" GroupName="Dining" />
                        <asp:RadioButton ID="rbDiningNo" class="form-check-input" runat="server" Text="No" GroupName="Dining" />
                        <br />
                        <br />
                        <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                        <br />
                        <asp:Label ID="lblFamily" runat="server" Text="Family"></asp:Label>
                        <asp:RadioButton ID="rbFamilyYes" class="form-check-input" Text="Yes" runat="server" GroupName="Family" />
                        <asp:RadioButton ID="rbFamilyNo" class="form-check-input" Text="No" runat="server" GroupName="Family" />
                        <br />
                        <br />
                        <asp:Label ID="lblBachelor" runat="server" Text="Bachelor"></asp:Label>
                        <asp:RadioButton ID="rbBachelorYes" class="form-check-input" Text="Yes" runat="server" GroupName="Bachelor" />
                        <asp:RadioButton ID="rbBachelorNo" class="form-check-input" Text="No" runat="server" GroupName="Bachelor" />
                        <br />
                        <br />
                        <asp:Label ID="lblOffice" runat="server" Text="Office"></asp:Label>
                        <asp:RadioButton ID="rbOfficeYes" class="form-check-input" Text="Yes" runat="server" GroupName="Office" />
                        <asp:RadioButton ID="rbOfficeNo" class="form-check-input" Text="No" runat="server" GroupName="Office" />
                        <br />
                        <br />
                        <asp:Label ID="lblRent" runat="server" Text="Rent"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtRent" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        
                        <asp:Label ID="lblImage" runat="server" Text="Upload an Image"></asp:Label>
                        <br />
                        <asp:FileUpload class="custom-file-input" ID="fuImage" runat="server" />
                        <br />
                       

                        
                    </div>

                </div>
                <br />
                <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />


                <br />


                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="BtnBack" runat="server" Text="Go Back" class="btn btn-primary btn-lg" OnClick="BtnBack_Click" />
        </div>
    </form>
    <%--<script src="Js/jquery-2.1.4.min.js"></script>
    <script src="Js/bootstrap.min.js"></script>--%>
</body>
</html>
