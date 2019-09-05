<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUC.ascx.cs" Inherits="ChoosePhone.cms.admin.login.LoginUC" %>
<div class="login-form">
    <div class="login-logo">
        LOGO HERE
    </div>
    <div class="login-input">
        <div class="title">Đăng nhập</div>
        <input type="text" class="login-field" value="" placeholder="Tên đăng nhập"></input>
        <input type="password" class="login-field" value="" placeholder="Mật khẩu"></input>

        <div class="control-row">
            <asp:Button ID="loginBtn" runat="server" CssClass="access-btn" Text="Đăng nhập" OnClick="loginBtn_Click" />
            <asp:Button ID="cancelBtn" runat="server" CssClass="cancel-btn" Text="Thoát" OnClick="cancelBtn_Click" />
        </div>
    </div>
</div>
