<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeesList.ascx.cs" Inherits="ChoosePhone.cms.admin.employee.EmployeesList" %>
<asp:Repeater runat="server" ID="repEmployeesList">
    <HeaderTemplate>
        <div class="row">
            <div class="col"><p>Danh sách nhân viên</p></div>
            <div class="col text-right"><a href="#">Thêm nhân viên</a></div>
        </div>
        <ul class="employees-list list-unstyled">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
        <asp:HyperLink runat="server" class="row" CssClass="lnkEmployee">
            <asp:Label runat="server" CssClass="col" ID="lbID" Text='<%#Eval("EmployeeID") %>'/>
            <asp:Label runat="server" CssClass="col" ID="lbName" Text='<%#Eval("Name") %>' />
        </asp:HyperLink>
            </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
