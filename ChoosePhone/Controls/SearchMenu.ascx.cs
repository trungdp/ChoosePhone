using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.Controls
{
    public partial class SearchMenu : System.Web.UI.UserControl
    {
        List<string> listBrands = new List<string>();
        List<string> listPrice = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            listBrands.Add("Apple");
            listBrands.Add("Apple");
            listBrands.Add("Apple");
            listBrands.Add("Apple");
            listBrands.Add("Apple");
            listBrands.Add("Apple");
            listBrands.Add("Apple");

            listPrice.Add("Từ 3-6 triệu");
            listPrice.Add("Từ 6-10 triệu");
            listPrice.Add("Từ 10-15 triệu");
            listPrice.Add("Trên 15 triệu");
            if (!IsPostBack)
            {
                PopulateControls();
            }
        }
        private void PopulateControls()
        {
            repBrandList.DataSource = listBrands;
            repBrandList.DataBind();
            repPriceList.DataSource = listPrice;
            repPriceList.DataBind();
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            repBrandList.ItemDataBound += RepBrandList_ItemDataBound;
            repPriceList.ItemDataBound += RepPriceList_ItemDataBound;
        }

        private void RepPriceList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem
                || e.Item.ItemType == ListItemType.Item)
            {
                string data = e.Item.DataItem as string;
                CheckBox lnkPrice = (CheckBox)e.Item.FindControl("lnkPrice");
                lnkPrice.Text = data;
                lnkPrice.CheckedChanged += LnkPrice_CheckedChanged;
            }
        }

        private void LnkPrice_CheckedChanged(object sender, EventArgs e)
        {
            //involk search by Price method
        }

        private void RepBrandList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem
                || e.Item.ItemType == ListItemType.Item)
            {
                string data = e.Item.DataItem as string;
                CheckBox lnkBrand = (CheckBox)e.Item.FindControl("lnkBrand");
                lnkBrand.Text = data;
                lnkBrand.CheckedChanged += LnkBrand_CheckedChanged;
            }
        }

        private void LnkBrand_CheckedChanged(object sender, EventArgs e)
        {
            //involk search by Brand method
        }
    }
}