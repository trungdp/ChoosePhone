<%@ Page Title="ChoosePhone" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ChoosePhone.Index" %>
<%@ Register src="Controls/SearchMenu.ascx" tagname="SearchMenu" tagprefix="uc1" %>
<%@ Register src="Controls/ProductsList.ascx" tagname="ProductsList" tagprefix="uc2" %>
<%@ Register src="Controls/PromoBanner.ascx" tagname="PromoBanner" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container promo-banner">
        <uc3:PromoBanner ID="PromoBanner1" runat="server" />
</div>
    <div class="col-lg-3" id="left-menu">
        <uc1:SearchMenu ID="SearchMenu1" runat="server" />
    </div>
    <div class="col-lg mx-2" id="products" style="min-height:500px;">
        <uc2:ProductsList ID="ProductsList1" runat="server" />
    </div>
</asp:Content>
