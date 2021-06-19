<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Web_Master.aspx.cs" Inherits="KYC_doc.Web_Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="Name" DataField="Name" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:BoundField HeaderText="Mobile No" DataField="Mob_No" />
            <asp:ImageField HeaderText="Adhar Card" DataImageUrlField="Adhar_Card" ControlStyle-Height="100" ControlStyle-Width="100">
                <ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:ImageField HeaderText="Pan Card" DataImageUrlField="Pan_Card" ControlStyle-Height="100" ControlStyle-Width="100">
                <ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnaccept" CssClass="btn btn-primary" runat="server" Text="Accept" />
                    <asp:Button ID="btnreject" CssClass="btn btn-danger" runat="server" Text="Reject" />
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>
