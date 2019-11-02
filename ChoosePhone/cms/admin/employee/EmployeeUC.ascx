<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeUC.ascx.cs" Inherits="ChoosePhone.cms.admin.employee.EmployeeUC" %>
<%@ Register Src="~/cms/admin/employee/LeftCo.ascx" TagPrefix="uc1" TagName="LeftCo" %>


<%@ Register src="EmployeesList.ascx" tagname="EmployeesList" tagprefix="uc2" %>


Nhân viên<p>
    &nbsp;</p>
<div class="col-5 border">
    <uc1:LeftCo runat="server" id="LeftCo" />
</div>

<div class="container content col-7 border">

    <uc2:EmployeesList ID="EmployeesList1" runat="server" />

</div>
