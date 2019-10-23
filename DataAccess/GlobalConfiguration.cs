using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DataAccess
{
    public class GlobalConfiguration
    {
        private static int pageSize;
        private static string siteName;
        private static int desLenght;
        private static int imagePerSite;
        private static int cartPersistDays;

        public static int PageSize
        {
            get { return pageSize; }
        }

        public static string SiteName
        {
            get { return siteName; }
        }

        public static int DesLenght
        {
            get { return desLenght; }
        }

        public static int ImagePerSite
        {
            get { return imagePerSite; }
        }
        public static int CartPersistDays
        {
            get { return cartPersistDays; }
        }

        static GlobalConfiguration()
        {
            pageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PageSize"]);
            desLenght = Convert.ToInt32(ConfigurationManager.AppSettings["DesLenght"]);
            siteName = ConfigurationManager.AppSettings["SiteName"];
            imagePerSite = Convert.ToInt32(ConfigurationManager.AppSettings["ImagesPerPage"]);
            cartPersistDays = Convert.ToInt32(ConfigurationManager.AppSettings["CartPersistDays"]);
        }
    }
}
