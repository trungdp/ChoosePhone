<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchMenu.ascx.cs" Inherits="ChoosePhone.Controls.SearchMenu" %>
<div class="float-left">
    <h1>Tìm kiếm</h1>
    <asp:Repeater runat="server" ID="repBrandList">
        <HeaderTemplate>
            <div class="menuBrand">
                <h2>Hãng sản xuất</h2>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:CheckBox runat="server" ID="lnkBrand"/>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Repeater runat="server" ID="repPriceList">
        <HeaderTemplate>
            <div class="menuPrice">
                <h2>Chọn mức giá</h2>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:CheckBox runat="server" ID="lnkPrice" />
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
