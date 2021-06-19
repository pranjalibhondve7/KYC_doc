<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DashBoard1.aspx.cs" Inherits="KYC_doc.DashBoard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="ID" />
                <asp:BoundField HeaderText="Name" DataField="Name" />
                <asp:BoundField HeaderText="Is Approved" DataField="isApproved" />
                <asp:BoundField HeaderText="Is Rejected" DataField="isRejected" />
                <asp:ImageField HeaderText="Aadhar card" DataImageUrlField="Adhar_Card" ControlStyle-Height="100" ControlStyle-Width="100">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:ImageField HeaderText="Pan card" DataImageUrlField="Pan_Card" ControlStyle-Height="100" ControlStyle-Width="100">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success" OnCommand="btnApprove_Command" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure want to Approve KYC?')" />
                        <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger" OnCommand="btnReject_Command" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('Are you sure want to Reject KYC?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </div>2
</asp:Content>
