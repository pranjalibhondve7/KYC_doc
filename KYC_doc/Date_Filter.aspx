<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Date_Filter.aspx.cs" Inherits="KYC_doc.Date_Filter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Date Filter</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: aquamarine;
            text-align: center;
        }

        .lblsearch {
            font-size: 18px;
           
        }
        .p{
            margin-top:130px;
        }
        .lblfrom,.lblto{
            font-size:17px;
            margin-left:38px;
            margin-right:25px;
        }
        .btn{
            margin-top:20px;
            margin-bottom:50px;
            text-align:center;
            font-size:18px;
            height:50px;
            width:100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1><u><b>Date Filter</b></u></h1>
            <div class="row p">
                <b><asp:Label ID="Label1" Class="lblsearch" runat="server" Text="Search : "></asp:Label></b>
                <asp:Label ID="Label2" Class="lblfrom" runat="server" Text="From : "></asp:Label>
                <asp:TextBox ID="txtfrom" TextMode="Date" Height="50px" Width="350px" runat="server"></asp:TextBox>
                <asp:Label ID="Label3" Class="lblto" runat="server" Text="To : "></asp:Label>
                <asp:TextBox ID="txtto" TextMode="Date" Height="50px" Width="350px" runat="server"></asp:TextBox>
            </div>
            <div class="row btn">
                <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                <asp:Button ID="btncancel" runat="server" CssClass=" btn btn-danger" Text="Cancel" OnClick="btncancel_Click" />
            </div>

            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="174px" Width="713px">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="ID" />
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:BoundField HeaderText="Mobile No" DataField="Mob_No" />
                        <asp:BoundField HeaderText="Date Of Birth" DataField="Date" />
                    </Columns>

                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                    
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
