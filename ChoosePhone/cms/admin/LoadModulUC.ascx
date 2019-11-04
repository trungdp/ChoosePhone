<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoadModulUC.ascx.cs" Inherits="ChoosePhone.cms.admin.LoadModulUC" %>

<div class="header">
    <div class="logo">LOGO HERE</div>
    <div class="navbar">
        <ul>
            <li><a class="<%=DanhDau("Home")%>" href="Admin.aspx?modul=Home">Trang chủ</a></li>
            <li><a class="<%=DanhDau("Prod")%>" href="Admin.aspx?modul=Prod">Sản phẩm</a></li>
            <li><a class="<%=DanhDau("Empl")%>" href="Admin.aspx?modul=Empl">Nhân viên</a></li>
            <li><a class="<%=DanhDau("Cust")%>" href="Admin.aspx?modul=Cust">Khách hàng</a></li>
            <li><a class="<%=DanhDau("Sell")%>" href="Admin.aspx?modul=Sell">Bán hàng</a></li>
            <li><a class="<%=DanhDau("Stat")%>" href="Admin.aspx?modul=Stat">Thống kê</a></li>
            <li><a class="<%=DanhDau("Prof")%>" href="Admin.aspx?modul=Prof">Tài khoản</a></li>
        </ul>
    </div>
</div>
<div class="sitemap">
    <asp:SiteMapPath ID="sitemapMPth" runat="server" CssClass="site-map"></asp:SiteMapPath>
</div>
<hr />
<div class="load-modul">

    <asp:PlaceHolder ID="loadModulePlh" runat="server"></asp:PlaceHolder>
</div>
