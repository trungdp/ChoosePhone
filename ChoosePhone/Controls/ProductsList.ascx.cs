using DataAccess;
using DataAccess.DTO;
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

            List<Product> prods = new List<Product>();
            Product sample = new Product();
            sample.ProductID = 1;
            sample.ProducerID = 1;
            sample.Name = "sample";
            sample.Description = "sample";
            sample.BasicPrice = 1;
            sample.Thumbnail = "https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.0-9/73110397_1370630249758699_5640631827451346944_n.jpg?_nc_cat=106&_nc_oc=AQnf_LcPUwnMzFNhQQIEX8QglB2rDmgFy1lyXIlolEmph5fapPKFzRacvEeklKDlbiU&_nc_ht=scontent.fsgn3-1.fna&oh=9cc3b3322c9d0e83fe6a399d0d37294c&oe=5E194917";
            sample.PromoFront = true;
            for (int i = 0; i < 20; i++)
                prods.Add(sample);

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
                dlProdlist.DataSource = prods;
                dlProdlist.DataBind();
                //dlProdlist.ItemDataBound += DlProdlist_ItemDataBound;

                firstPageUrl = Link.ToCatalog("1");
                pagerFormat = Link.ToCatalog("{0}");
            }
            pagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, false);
            pagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, true);

        }

        //private void DlProdlist_ItemDataBound(object sender, DataListItemEventArgs e)
        //{
        //    if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Product data = e.Item.DataItem as Product;
        //        HyperLink lnkProd = (HyperLink)e.Item.FindControl("lnkProd");
        //        lnkProd.NavigateUrl = data.Thumbnail;
        //        Image imgThumbnail = (Image)e.Item.FindControl("imgThumbnail");
        //        imgThumbnail.ImageUrl = data.Thumbnail;
        //        Label lbProdName = (Label)e.Item.FindControl("lbProdName");
        //        Label lbProdPrice = (Label)e.Item.FindControl("lbProdPrice");
        //        lbProdName.Text = data.Name;
        //        lbProdPrice.Text = data.BasicPrice.ToString();
        //    }
        //}
    }
}