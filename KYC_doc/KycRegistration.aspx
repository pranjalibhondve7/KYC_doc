<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KycRegistration.aspx.cs" Inherits="KYC_doc.KycRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <center><h1>Registation</h1></center>
          <div class="container">
            <asp:Label ID="lblUserName" runat="server" Text="User name"></asp:Label>
            <div class="form-group">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnstatus" runat="server" Text="Check status" onclick="btnstatus_Click" CssClass="btn btn-dark"/>
            </div>
            <asp:Label ID="lblAadhar" runat="server" Text="Upload Aadhar Photo"></asp:Label>
            <div class="form-group">
                <asp:FileUpload ID="FileAadhar" runat="server" CssClass="form-control" />
            </div>
            <asp:Label ID="lblPan" runat="server" Text="Upload Pan Photo"></asp:Label>
            <div class="form-group">
                <asp:FileUpload ID="FilePan" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" />
               <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CN %>" SelectCommand="SELECT * FROM [Registration_KYC]"></asp:SqlDataSource>--%>
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
       
    </form>
</body>
</html>
