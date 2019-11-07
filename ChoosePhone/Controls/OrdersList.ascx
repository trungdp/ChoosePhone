<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrdersList.ascx.cs" Inherits="ChoosePhone.Controls.OrdersList" %>
<asp:DataList ID="dlOrdersList" runat="server" CssClass="container-fluid">
    <ItemTemplate runat="server">
        <asp:HyperLink runat="server" ID="lnkOrder" CssClass="mx-auto d-block ">
            <div runat="server" id="orderItem" class="hvr-grow-shadow container border mb-3 bg-light">
                <!-- Order ID -->
                <div class="row text-right px-3"">
                    <p>ID đơn: </p>
                    <asp:Label runat="server" ID="lbOrderID" Text='<%#Eval("OrderID").ToString() %>' />
                    <hr />

                </div>
                <!-- Product info -->
                <div class="row container">
                    <asp:Image runat="server" CssClass="thumbnail col-sm-1 img-responsive" ID="ProductThumbnail" />
                    <div class="col">
                        <div class="container-fluid">
                            <div class="row">
                                <p>ProductID: </p>
                                <asp:Label runat="server" ID="lbProductName" Text='<%#Eval("ProductID").ToString() %>' />
                            </div>
                            <div class="row">
                                <p>Giá: </p>
                                <asp:Label runat="server" CssClass="col-md" ID="lbPrice" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row text-right px-3" >
                    <p>Khách hàng: </p>
                    <asp:Label runat="server" ID="lbUserID" Text='<%#Eval("CustomerID").ToString() %>' />
                </div>
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