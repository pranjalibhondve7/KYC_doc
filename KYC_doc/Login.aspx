<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KYC_doc.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: darkgrey;
            background-size: cover;
            font-family: sans-serif;
        }

        h2 {
            padding: 0;
            margin-bottom: 30px;
            text-align: center;
            color: rgb(255,217,9);
        }

        .loginbox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 350px;
            height: 550px;
            padding: 50px 30px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.5);
        }

        ::placeholder {
            color: rgba(255,255,255,.5);
        }

        .btnsubmit:hover {
            background-color: rgb(255,217,9);
        }

        .lblemail, .lblpass, .lbllogin {
            font-weight: bold;
            color: #fff;
        }

        .txtemail, .txtpass, .ddl1 {
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
            background-color: transparent;
        }

        .txtemail, .txtpass, .btnsubmit, .ddl1 {
            width: 100%;
            margin-bottom: 20px;
        }

        .btnsubmit {
            text-align: center;
            border: none;
            outline: none;
            height: 40px;
            font-size: 16px;
            color: #fff;
            background-color: rgb(255,9,9);
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="loginbox">

            <%--<div class="container">--%>
            <h2><b>LOGIN</b></h2>
            <div class="row form-group">
                <asp:Label ID="Label1" Class="lblemail" runat="server" Text="Choose Account : "></asp:Label>
                <asp:DropDownList ID="DropDownList1" Class="ddl1" AutoPostBack="true" runat="server">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Admin Login</asp:ListItem>
                    <asp:ListItem>User Login</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="row form-group">
                <asp:Label ID="Label2" Class="lblemail" runat="server" Text="Username : "></asp:Label>
                <asp:TextBox ID="txtuser" Class="txtemail" placeholder="Enter Username " runat="server"></asp:TextBox>
            </div>
            <div class="row form-group">
                <asp:Label ID="Label3" Class="lblpass" runat="server" Text="Password : "></asp:Label>
                <asp:TextBox ID="txtpass" Class="txtpass" TextMode="Password" placeholder="Enter Password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnlogin" class="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnlogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
