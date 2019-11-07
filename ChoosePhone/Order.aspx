<%@ Page Title="Order" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ChoosePhone.Order" %>

<%@ Register Src="Controls/OrdersList.ascx" TagName="OrdersList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="user-info col-3"></div>
    <div class="oders-list col-9 text-center shopping-cart border bg-dark py-lg-3 px-lg-5">
        <uc1:OrdersList ID="OrdersList1" runat="server" />
    </div>
</asp:Content>
