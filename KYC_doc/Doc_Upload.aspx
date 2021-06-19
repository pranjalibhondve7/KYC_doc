<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doc_Upload.aspx.cs" Inherits="KYC_doc.Doc_Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Register.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1><b><u>Register</u></b></h1>
            <div class=" row form group">
                <div class="col-md-6">
                    <asp:Label ID="lbl1" Class="lbl" runat="server" Text="Name : "></asp:Label>
                    <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label1" Class="lbl" runat="server" Text="Email : "></asp:Label>
                    <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class=" row form group">
                <div class="col-md-6">
                    <asp:Label ID="Label2" Class="lbl" runat="server" Text="Mob No : "></asp:Label>
                    <asp:TextBox ID="txtmob" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" Class="lbl" runat="server" Text="Address : "></asp:Label>
                    <asp:TextBox ID="txtaddress" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class=" row form group">
                <div class="col-md-4">
                    <asp:Label ID="Label4" Class="lbl" runat="server" Text="Username : "></asp:Label>
                    <asp:TextBox ID="txtuser" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnstatus" runat="server" CssClass="btn btn-group" Text="Check Status " OnClick="btnstatus_Click" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" Class="lbl" runat="server" Text="Password : "></asp:Label>
                    <asp:TextBox ID="txtpass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class=" row ">
                <div class="col-md-6">
                    <asp:Label ID="Label6" Class="lbl" runat="server" Text="Upload Adhar Card : "></asp:Label>
                    <asp:FileUpload ID="fuadhar" runat="server" />
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label7" Class="lbl" runat="server" Text="Upload Pan Card : "></asp:Label>
                    <asp:FileUpload ID="fupan" runat="server" />
                    <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
                </div>
            </div>
            <div>
                <asp:Button ID="btnregister" class="q" CssClass="btn btn-success" runat="server" Text="Register" OnClick="btnregister_Click" />
                <asp:Button ID="btnlogin" class="q" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnlogin_Click" />
                <%--<asp:Button ID="btnstatus" runat="server" CssClass="btn btn-warning" Text="Status" OnClick="btnstatus_Click" />--%>
            </div>
            <br />
            <br />
            <br />
        </div>
        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
