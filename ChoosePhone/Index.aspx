<%@ Page Title="ChoosePhone" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ChoosePhone.Index" %>

<%@ Register Src="Controls/SearchMenu.ascx" TagName="SearchMenu" TagPrefix="uc1" %>
<%@ Register Src="Controls/ProductsList.ascx" TagName="ProductsList" TagPrefix="uc2" %>
<%@ Register Src="Controls/PromoBanner.ascx" TagName="PromoBanner" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row container promo-banner mx-auto mb-sm-2">
        <uc3:PromoBanner ID="PromoBanner1" runat="server" />
    </div>
    <div class="row px-md-5">
        <div class="col-2" id="left-menu">
            <uc1:SearchMenu ID="SearchMenu1" runat="server" />
        </div>
        <div class="col-10 px-2 text-center" id="products">
            <uc2:ProductsList ID="ProductsList1" runat="server" />
        </div>
    </div>
</asp:Content>
