<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="ChoosePhone.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-3.0.0.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <nav class="navbar navbar-expand-sm bg-warning navbar-dark">
                <a class="navbar-brand" href="Index.aspx">
                    <img src="images/login-icon.png">
                </a>
            </nav>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <!-- Brand/logo -->
                <a class="navbar-brand col-3" href="#">Tên tài khoản</a>

                <!-- Links -->
                <div class="col-9">
                    <ul class="navbar-nav float-right">
                        <li class="nav-item">
                            <a class="nav-link" href="Profile.aspx">Tài khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="EditProfile.aspx">Chỉnh sửa thông tin</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="UpgradePassword.aspx">Đổi mật khẩu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đăng xuất</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container" style="margin-top: 70px">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-md-4">
                            <label>Tên tài khoản: </label>
                        </div>
                        <div class="col-md-8">
                            <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Số điện thoại liên hệ: </label>
                        </div>
                        <div class="col-md-8">
                             <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Email</label>
                        </div>
                        <div class="col-md-8">
                             <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Số CMND/Thẻ căn cước: </label>
                        </div>
                        <div class="col-md-8">
                            <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Ngày sinh: </label>
                        </div>
                        <div class="col-md-8">
                             <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Giới tính: </label>
                        </div>
                        <div class="col-md-8">
                             <label>#</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Địa chỉ: </label>
                        </div>
                        <div class="col-md-8">
                             <label>#</label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-warning">Lưu chỉnh sửa </button>


            </div>
            </div>
    </form>
</body>
</html>

<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
