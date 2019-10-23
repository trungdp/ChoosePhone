﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone
{
    public partial class Admin : System.Web.UI.Page
    {
        string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];
            if (!IsPostBack && String.IsNullOrEmpty(modul))
                adminPlh.Controls.Add(LoadControl("cms/admin/login/LoginUC.ascx"));
            else
                openModule();
        }

        private void openModule()
        {
            adminPlh.Controls.Add(LoadControl("cms/admin/LoadModulUC.ascx"));
        }
    }
}