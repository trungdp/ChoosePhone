<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftColum.ascx.cs" Inherits="ChoosePhone.cms.admin.sell.LeftColum" %>
<div class="float-left mr-2">
    <div class="filter">
        <h5>Tìm kiếm</h5>
        <asp:TextBox ID="TextBox1" runat="server" Height="19px" style="margin-top: 18px; margin-bottom: 0px" Width="186px"></asp:TextBox>

    </div><div class="filter">
        <h5>Giá</h5>
       <p><asp:CheckBox runat="server" Text="Đang giao hàng" /></p>
        <p><asp:CheckBox runat="server" Text="Chưa giao hàng" /></p>
        <p> <asp:CheckBox runat="server" Text="Hoàn thành" /></p>
         <p><asp:CheckBox runat="server" Text="Đã hủy" /></p>
    </div>
    
    <div class="filter">
        <h5>Ngày giao hàng</h5>
        Từ <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        Đến <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    </div>
    </div>