<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ChoosePhone.Admin" %>

<%@ Register Src="~/cms/admin/login/LoginUC.ascx" TagPrefix="uc1" TagName="LoginUC" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link href="cms/admin/css/adminStyle.css" rel="stylesheet" />
    <link href="cms/admin/css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<uc1:LoginUC runat="server" id="LoginUC" CssClass="login-uc"/>--%>
        <asp:PlaceHolder ID="adminPlh" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
