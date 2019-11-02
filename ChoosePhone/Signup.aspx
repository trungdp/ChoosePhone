<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ChoosePhone.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-3.0.0.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container" style="margin-top: 30px">
                <div class="row" style="margin-top: 130px">
                    <div class="col-sm-4">
                        <a href="Login.aspx">
                            <img src="images\login-icon.png" alt="logo" style="width: 90px" />
                        </a>
                    </div>
                    <div class="col-sm-8 border px-0">
                        <div class="btn-group btn-group-lg container-fluid px-0">
                            <button type="button" class="btn btn-warning col"><a href="Login.aspx">Đăng nhập</a></button>
                            <button type="button" class="btn btn-warning col"><a href="Signup.aspx">Đăng ký</a></button>
                        </div>
                        <div class="login my-4 px-5">
                            <div class="form-group">
                                <input runat="server" type="text" class="form-control" id="usr" name="username" placeholder="Tên đăng ký" />
                            </div>
                            <div class="form-group">
                                <input runat="server" type="password" class="form-control" id="pwd" name="password" placeholder="Mật khẩu" />
                            </div>
                            <div class="form-group">
                                <input runat="server" type="password" class="form-control" id="reEnterPwd" name="password" placeholder="Nhập lại mật khẩu" />
                            </div>
                            <div class="text-center">
                                <span id="btnLogin" class="btn btn-warning col-sm-3">Đăng ký </span>
                                <span id="btnCancel" class="btn btn-warning col-sm-3">Thoát </span>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/bootstrap.min.js"></script>
