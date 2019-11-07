<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderBrands.ascx.cs" Inherits="ChoosePhone.Controls.HeaderBrands" %>
<asp:Repeater runat="server" ID="repHeaderBrands">
    <ItemTemplate>
        <div class="col-sm hvr-ripple-in text-center">
            <asp:HyperLink runat="server" ID="lnkBrand" class="mx-auto" />
        </div>
    </ItemTemplate>
</asp:Repeater>