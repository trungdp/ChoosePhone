using Core;
using DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess.DAO
{
    class CartDAO
    {
        private static string CartID
        {
            get
            {
                HttpContext context = HttpContext.Current;
                if (context.Request.Cookies["CartID"] != null)
                    return context.Request.Cookies["CartID"].Value;
                else
                {
                    string cartID = Guid.NewGuid().ToString();
                    HttpCookie cookie = new HttpCookie("CartID", cartID);
                    int dayNumber = GlobalConfiguration.CartPersistDays;
                    DateTime currentDate = DateTime.Now;
                    TimeSpan timeSpan = new TimeSpan(dayNumber, 0, 0, 0);
                    DateTime expirationDate = currentDate.Add(timeSpan);
                    cookie.Expires = expirationDate;
                    context.Response.Cookies.Add(cookie);
                    return cartID;
                }
            }
        }

        public static List<Cart> All(){
            return CBO.FillCollection<Cart>(DataProvider.Instance.ExecuteReader("Cart_All", CartID));
        }

        public static Cart FindByProductID(string productID){
            return CBO.FillObject<Cart>(DataProvider.Instance.ExecuteReader("Cart_ByProductID", CartID,Convert.ToInt32(productID)));
        }

        public static bool Insert(string productID,int number, string description)
        {
            try
            {
                double subtotal = ProductDAO.Single(productID).BasicPrice * number;
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Insert", CartID, Convert.ToInt32(productID),DateTime.Now,number,subtotal,description);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(string productID,int number, string description)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Update", CartID, Convert.ToInt32(productID), number, DateTime.Now,description);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdateQuantity(string productID)
        {
            try
            {
                int newQuantity = Single(productID).Number + 1;
                double newSubtotal = ProductDAO.Single(productID).BasicPrice * newQuantity;
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Update", CartID, Convert.ToInt32(productID),newQuantity, newSubtotal);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool UpdateQuantity(string productID, int number)
        {
            try
            {
                double newSubtotal = ProductDAO.Single(productID).BasicPrice * number;
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Update", CartID, Convert.ToInt32(productID),number,newSubtotal);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static Cart Single(string productID)
        {
            try
            {
                return CBO.FillObject<Cart>(DataProvider.Instance.ExecuteReader("Cart_Single", Convert.ToInt32(productID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool Remove(string productID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Remove", CartID, Convert.ToInt32(productID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete()
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Delete", CartID);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }
    }
}
