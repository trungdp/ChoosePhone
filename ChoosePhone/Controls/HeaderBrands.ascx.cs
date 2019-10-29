using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.Controls
{
    public partial class HeaderBrands : System.Web.UI.UserControl
    {
        private List<string> brands = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            brands.Add("Apple");
            brands.Add("Apple");
            brands.Add("Apple");
            brands.Add("Apple");
            brands.Add("Apple");
            brands.Add("Apple");
            brands.Add("Apple");

            if (!IsPostBack)
            {
                repHeaderBrands.DataSource = brands;
                repHeaderBrands.DataBind();
            }
        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            repHeaderBrands.ItemDataBound += RepHeaderBrands_ItemDataBound;
        }

        private void RepHeaderBrands_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem
                || e.Item.ItemType == ListItemType.Item)
            {
                string data = e.Item.DataItem.ToString();
                HyperLink lnkBrand = (HyperLink)e.Item.FindControl("lnkBrand");
                lnkBrand.Text = data;
            }
        }
    }
}