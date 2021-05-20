<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewHouseDetails.aspx.cs" Inherits="OnlineRent.ViewHouseDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-6">
                        <asp:Image ID="Image1" runat="server" Height="276px" Width="366px" />
                    </div>

                    <div class="col-sm-6">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblHouse" runat="server" Text="House Name : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblHouseNameValue" runat="server" Text=""></asp:Label></td>
                                </tr>

                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblAddressValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblPhnValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblFloor" runat="server" Text="Floor : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblFloorValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblBedRoom" runat="server" Text="Bedroom : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblBedRoomValue" runat="server" Text=""></asp:Label></td>
                                </tr>


                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblKitchen" runat="server" Text="Kitchen : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblKitchenValue" runat="server" Text=""></asp:Label></td>
                                </tr>


                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblDining" runat="server" Text="Dining : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblDiningValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblFamily" runat="server" Text="Family : "></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblFamilyValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblBachelor" runat="server" Text="Bachelor : "></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblBachelorValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblOffice" runat="server" Text="Office : "></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblOfficeValue" runat="server" Text=""></asp:Label></td>
                                </tr>






                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblRent" runat="server" Text="Rent : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblRentValue" runat="server" Text=""></asp:Label></td>
                                </tr>

                                <tr>
                                    <td class="success">
                                        <asp:Label ID="lblAdditional" runat="server" Text="Additional Remarks : "></asp:Label></td>

                                    <td>
                                        <asp:Label ID="lblAdditionalValue" runat="server" Text=""></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                </div>
            </div>
            <asp:Button ID="BtnBack" runat="server" Text="Go Back" class="btn btn-primary btn-lg" OnClick="BtnBack_Click" />


        </div>
        
       
        <%--<script src="Js/jquery-2.1.4.min.js"></script>
        <script src="Js/bootstrap.min.js"></script>--%>
    </form>
</body>
</html>
