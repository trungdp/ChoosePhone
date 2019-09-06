using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.cms.admin
{
    public partial class LoadModulUC : System.Web.UI.UserControl
    {
        string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];
            switch (modul)
            {
                case "Prod":
                    loadModulePlh.Controls.Add(LoadControl("product/ProductUC.ascx"));
                    break;
                case "Empl":
                    loadModulePlh.Controls.Add(LoadControl("employee/EmployeeUC.ascx"));
                    break;
                case "Cust":
                    loadModulePlh.Controls.Add(LoadControl("customer/CustomerUC.ascx"));
                    break;
                case "Sell":
                    loadModulePlh.Controls.Add(LoadControl("sell/SellUC.ascx"));
                    break;
                case "Stat":
                    loadModulePlh.Controls.Add(LoadControl("statistic/StatisticUC.ascx"));
                    break;
                case "Prof":
                    loadModulePlh.Controls.Add(LoadControl("profile/ProfileUC.ascx"));
                    break;
                default:
                    loadModulePlh.Controls.Add(LoadControl("home/HomeUC.ascx"));
                    break;
            }


        }

        protected string DanhDau(string modul)
        {
            string r = "123";

            return r;
        }
    }
}