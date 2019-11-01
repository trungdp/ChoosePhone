<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrdersList.ascx.cs" Inherits="ChoosePhone.Controls.OrdersList" %>
<asp:DataList ID="dlOrdersList" runat="server">
    <ItemTemplate runat="server">
        <asp:HyperLink runat="server" ID="lnkOrder" CssClass="mx-auto">
            <div runat="server" id="orderItem" class="container">
                <!-- Order ID -->
                ID đơn:
                <asp:Label runat="server" CssClass="row float-right" ID="lbOrderID" Text='<%#Eval("OrderID").ToString() %>'/>
                <!-- Product info -->
                <div class="row container">
                    <asp:Image runat="server" cssClass="thumbnail col-sm-1 img-responsive" ID="ProductThumbnail" />
                    <div class="col">
                        <div class="container-fluid">
                            <div class="row">
                                <asp:Label runat="server" ID="lbProductName" Text='<%#Eval("ProductID").ToString() %>'/>
                            </div>
                            <div class="row">
                                Giá:
                                <asp:Label runat="server" CssClass="col-md" ID="lbPrice" />
                            </div>
                        </div>
                    </div>
                </div>
                Khách hàng:
                <asp:Label runat="server" CssClass="row float-right" ID="lbUserID" Text='<%#Eval("CustomerID").ToString() %>'/>
                <!-- Order status >
            <ul class="inline-list list-unstyled float-right">
                <li class="inline-list-item">
                    <asp:CheckBox runat="server" ID="cbOrdered" Text="Đơn đã đặt" />
                </li>
                <li class="inline-list-item">
                    <asp:CheckBox runat="server" ID="cbDelivering" Text="Đơn đang giao" />
                </li>
                <li class="inline-list-item">
                    <asp:CheckBox runat="server" ID="cbReceived" Text="Đơn đã nhận" />
                </li>
                <li class="inline-list-item">
                    <asp:CheckBox runat="server" ID="cbRated" Text="Đơn đã được đánh giá" />
                </li>
            </ul-->
            </div>
        </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>