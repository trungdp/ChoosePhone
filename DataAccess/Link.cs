using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess
{
    public class Link
    {
        private static string BuildAbsolute(string relativeURL)
        {
            Uri uri = HttpContext.Current.Request.Url;
            string app = HttpContext.Current.Request.ApplicationPath;
            if (!app.EndsWith("/")) app += "/";
            relativeURL = relativeURL.TrimStart('/');
            return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}",uri.Host,uri.Port,app,relativeURL));
        }

        public static string ToCategory(string categoryID,string page) {
            if (page == "1")
                return BuildAbsolute(String.Format("Catalog.aspx?CategoryID={0}",categoryID));
            return BuildAbsolute(String.Format("Catalog.aspx?CategoryID={0}&Page={1}", categoryID,page));
        }

        public static string ToCategory(string categoryID)
        {
            return ToCategory(categoryID,"1");
        }

        public static string ToCatalog(string page)
        {
            if (page == "1")
                return BuildAbsolute("ToCatalog.aspx");
            return BuildAbsolute(String.Format("ToCatalog.aspx&ProductID={0}", page));
        }
        public static string ToCatalog()
        {
            return ToCatalog("1");
        }
        public static string ToProduct(string productID)
        {
            return BuildAbsolute(String.Format("ProductDetail.aspx?ProductID={0}", productID));
        }
        public static string ToProductImage(string fileName)
        {
            return BuildAbsolute(String.Format("ProductImages/{0}", fileName));
        }

        public static string ToAddToCart(string productID)
        {
            return BuildAbsolute(String.Format("AddToCart.aspx?ProductID={0}", productID));
        }

        public static string ToSearch(string keyword,string page)
        {
            if (page == "1")
                return BuildAbsolute(String.Format("Search.aspx?Search={0}", keyword));
            return BuildAbsolute(String.Format("Search.aspx?Search={0}&Page={1}", keyword,page));
        }

        public static string ToSearch(string keyword)
        {
            return ToSearch(keyword, "1");
        }

        public static string ToAdminProduct(string page)
        {
            if (page == "1")
                return BuildAbsolute(String.Format("Admin/Product.aspx"));
            return BuildAbsolute(String.Format("Admin/Product.aspx&Page={0}",page));
        }
        public static string ToAdminProduct()
        {
            return ToAdminProduct("1");
        }

        public static string ToAdminUpload(string clientID, string page)
        {
            if (page == "1")
                return BuildAbsolute(String.Format("Admin/UploadImage.aspx?id={0}",clientID));
            return BuildAbsolute(String.Format("Admin/UploadImage.aspx?id={0}&Page={1}",clientID,page));
        }

        public static string ToAdminUpload(string clientID)
        {
            return ToAdminUpload(clientID,"1");
        }
    }
}
