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
                <div class="row">
                    <div class="col-sm-4">
                        <a href="Login.aspx">
                            <img src="images\login-icon.png" alt="logo" style="width: 90px" />
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <div class="btn-group btn-group-lg">
                            <a href="Login.aspx"
                            <button type="button" class="btn btn-warning">Dang nhap</button>
                            </a>
                            <a href="Signup.aspx"
                            <button type="button" class="btn btn-warning">Dang ky</button>
                            </a>
                        </div>
                        <div class="login">
                            <div class="form-group">
                                <label for="usr">Ten dang ky:</label>
                                <input type="text" class="form-control" id="usr" name="username" />
                            </div>
                            <div class="form-group">
                                <label for="pwd">Mat khau:</label>
                                <input type="password" class="form-control" id="pwd" name="password" />
                            </div>
                            <div class="form-group">
                                <label for="pwd">Nhap lat khau:</label>
                                <input type="password" class="form-control" id="pwd" name="password" />
                            </div>
                            <button type="submit" class="btn btn-primary">Dang ky </button>
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
