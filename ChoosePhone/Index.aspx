<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ChoosePhone.Index" %>
<%@ Register src="Controls/SearchMenu.ascx" tagname="SearchMenu" tagprefix="uc1" %>
<%@ Register src="Controls/ProductsList.ascx" tagname="ProductsList" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-3" id="left-menu">

        <uc1:SearchMenu ID="SearchMenu1" runat="server" />

    </div>
    <div class="col-lg" id="products">

        <uc2:ProductsList ID="ProductsList1" runat="server" />

    </div>
</asp:Content>
