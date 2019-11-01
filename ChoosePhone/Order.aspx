<%@ Page Title="Order" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ChoosePhone.Order" %>

<%@ Register Src="Controls/OrdersList.ascx" TagName="OrdersList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="user-info col-md-3"></div>
    <div class="oders-list col-md-9 text-center">
        <uc1:OrdersList ID="OrdersList1" runat="server" />
    </div>
</asp:Content>
