<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftCo.ascx.cs" Inherits="ChoosePhone.cms.admin.employee.LeftCo" %>

<div class="float-left mr-2">
    <div class="filter">
        <h5>Nhân viên</h5>
        <p><asp:CheckBox runat="server" Text="Danh sách nhân viên" /></p>
        <p><asp:CheckBox runat="server" Text="Trong ca trực" /></p>

    </div><div class="filter">
        <h5>Lịch trực</h5>
       <p><asp:CheckBox runat="server" Text="Tuần 1" /></p>
        <p><asp:CheckBox runat="server" Text="Tuần 2" /></p>
        <p> <asp:CheckBox runat="server" Text="Tuần 3" /></p>
         <p><asp:CheckBox runat="server" Text="Tuần 4" /></p>
    </div>
    
    </div>