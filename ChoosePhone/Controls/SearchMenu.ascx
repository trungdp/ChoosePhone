<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchMenu.ascx.cs" Inherits="ChoosePhone.Controls.SearchMenu" %>
<div class="mr-2">
    <h3>Tìm kiếm</h3>
    <asp:Repeater runat="server" ID="repBrandList">
        <HeaderTemplate>
            <div class="menuBrand">
                <h4>Hãng sản xuất</h4>
                <ul class="list-unstyled">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:CheckBox runat="server" ID="lnkBrand" CssClass="hvr-underline-reveal"/>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <hr />
    <asp:Repeater runat="server" ID="repPriceList">
        <HeaderTemplate>
            <div class="menuPrice">
                <h4>Chọn mức giá</h4>
                <ul class="list-unstyled">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:CheckBox runat="server" ID="lnkPrice" CssClass="hvr-underline-reveal" />
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
