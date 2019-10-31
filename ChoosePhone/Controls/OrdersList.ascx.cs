using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.DTO;

namespace ChoosePhone.Controls
{
    public partial class OrdersList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateControls();
            }
        }
        private void PopulateControls()
        {
            DataAccess.DTO.Order sample = new DataAccess.DTO.Order();
            sample.OrderID = 1;
            sample.ProductID = 1;
            sample.CustomerID = 1;
            List<DataAccess.DTO.Order> orders = new List<DataAccess.DTO.Order>();
            for (int i = 0; i < 5; i++)
                orders.Add(sample);

            dlOrdersList.DataSource = orders;
            dlOrdersList.DataBind();

        }

    }
}