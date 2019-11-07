<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductsList.ascx.cs" Inherits="ChoosePhone.Controls.ProductsList" %>

<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>


<uc1:Pager ID="pagerTop" runat="server" Visible="false" />

<asp:DataList ID="dlProdlist" runat="server" RepeatColumns="6">
    <ItemTemplate>

        <asp:HyperLink runat="server" NavigateUrl='<%#Eval("Thumbnail") %>' ID="lnkProd" CssClass="mx-3 my-3">
            <div class="col-sm prod-list">
                <asp:Image runat="server" ID="imgThumbnail" ImageUrl='<%#Eval("Thumbnail") %>' CssClass="img-responsive col thumbnail"/>
                <div class="col">
                    <asp:Label runat="server" ID="lbProdName" Text='<%#Eval("Name") %>' /><br />
                    Price: <asp:Label runat="server" ID="lbProdPrice" Text='<%#Eval("BasicPrice").ToString() %>' />
                </div>
            </div>
        </asp:HyperLink></ItemTemplate></asp:DataList><uc1:Pager ID="pagerBottom" runat="server" Visible="false" />



