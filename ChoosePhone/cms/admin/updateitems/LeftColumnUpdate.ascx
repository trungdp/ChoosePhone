<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftColumnUpdate.ascx.cs" Inherits="ChoosePhone.cms.admin.updateitems.LeftColumnUpdate" %>
<div class="float-left mr-2">
    <div class="filter">
        <h5>Tìm kiếm</h5>
        <asp:TextBox ID="TextBox1" runat="server" Height="19px" style="margin-top: 18px; margin-bottom: 0px" Width="186px"></asp:TextBox>

    </div><div class="filter">
        <h5>Giá</h5>
       <p><asp:CheckBox runat="server" Text="  3 tới 6 triệu" /></p>
        <p><asp:CheckBox runat="server" Text=" 6 tới 10 triệu" /></p>
        <p> <asp:CheckBox runat="server" Text=" 10 tới 15 triệu" /></p>
         <p><asp:CheckBox runat="server" Text=" Trên 15 triệu" /></p>
    </div>
    
    </div>