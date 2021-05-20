<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAdd.aspx.cs" Inherits="OnlineRent.ViewAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> --%>
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!--Creating Jumbotron inside container--><div class="jumbotron">
                <asp:GridView CssClass="table table-bordered" HeaderStyle-CssClass="bg-primary text-white" AutoGenerateColumns="false" ID="GridView1" DataKeyNames="Id" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="OnRowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Image")) %>' Height="100px" Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:ImageField HeaderText="Image" ControlStyle-Height="50" DataImageUrlField="Image"></asp:ImageField>--%>
                        <asp:BoundField HeaderText="House Name" DataField="HouseName" />
                        <asp:BoundField HeaderText="Rent" DataField="Rent" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnEdit" Text="Edit" runat="server" OnClick="BtnEdit_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnDelete" Text="Delete" runat="server" OnClick="BtnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnViewRequests" Text="View Requests" runat="server" OnClick="BtnViewRequests_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <%--<script src="Js/jquery-2.1.4.min.js"></script>
        <script src="Js/bootstrap.min.js"></script>--%>
    </form>
</body>
</html>
