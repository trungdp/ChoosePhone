<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUC.ascx.cs" Inherits="ChoosePhone.cms.admin.login.LoginUC" %>
<div class="login-form container">
    <div class="login-logo">
        LOGO HERE
    </div>
    <div class="login-input container px-0 text-center">
        <div class="title container-fluid">Đăng nhập</div>
        <input type="text" class="login-field" value="" placeholder="Tên đăng nhập"/>
        <input type="password" class="login-field" value="" placeholder="Mật khẩu"/>

        <div class="control-row row mx-auto">
            <asp:Button ID="loginBtn" runat="server" CssClass="access-btn col mr-1" Text="Đăng nhập" OnClick="loginBtn_Click" />
            <asp:Button ID="cancelBtn" runat="server" CssClass="cancel-btn col ml-1" Text="Thoát" OnClick="cancelBtn_Click" />
        </div>
    </div>
</div>
