using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChoosePhone.Controls
{
    public partial class ProductsList : System.Web.UI.UserControl
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
            int howManyPages = 0;
            string categoryID = Request.QueryString["CategoryID"] ?? "";
            string page = Request.QueryString["page"] ?? "1";
            string firstPageUrl = "";
            string pagerFormat = "";

            List<string> sampleProductDatas = new List<string>();
            sampleProductDatas.Add("product1");
            sampleProductDatas.Add("product2");
            sampleProductDatas.Add("product3");
            sampleProductDatas.Add("product4");
            sampleProductDatas.Add("product5");

            if (categoryID != "")
            {
                //binding product info data

                //dlProdList.DataSource = Product.InCategory(categoryId, page, out
                //howManyPages);
                //dlProdList.DataBind();
                //firstPageUrl = Link.ToCategory(categoryId);
                //pagerFormat = Link.ToCategory(categoryId, "{0}");
            }
            else
            {
                //dlProdList.DataSource = Product.OnPromo(page, out howManyPages);
                //dlProdList.DataBind();
                dlProdlist.DataSource = sampleProductDatas;
                dlProdlist.DataBind();
                firstPageUrl = Link.ToCatalog("1");
                pagerFormat = Link.ToCatalog("{0}");
            }
            pagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, false);
            pagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, true);

        }
    }
}