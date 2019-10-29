<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductsList.ascx.cs" Inherits="ChoosePhone.Controls.ProductsList" %>

<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>


<uc1:Pager ID="pagerTop" runat="server" Visible="false" />

<asp:DataList ID="dlProdlist" runat="server" RepeatColumns="4">
    <ItemTemplate>
        <div class="col-sm prod-list">
            <a href="#">
                <img />
                <h2 class="prod-name">
                </h2>
                <p class="price"></p>
            </a>
        </div>
    </ItemTemplate>
</asp:DataList>

<uc1:Pager ID="pagerBottom" runat="server" Visible="false" />



