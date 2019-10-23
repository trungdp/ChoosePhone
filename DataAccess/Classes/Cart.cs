using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess.Classes
{
    public class Cart
    {
        public string cartID;
        public int productID;
        public int quantity;
        public DateTime dateAdded;

        public Cart() { }

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

        public static bool Add(string productID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Add", CartID,Convert.ToInt32(productID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
                
        }


        public static bool Update(string productID, int quantity)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Cart_Update", CartID, Convert.ToInt32(productID),quantity);
                return rs > 0;
            }
            catch 
            {
                return false;
            }
        }

        public static bool Delete(string productID)
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

        public static List<Product> Items()
        {
            try
            {
                return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Cart_Items",CartID));
            }
            catch
            {
                return new List<Product>();
            }
        }

        public static double TotalAmount()
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteScalar("Cart_TotalAmount",CartID);
                return Convert.ToDouble(rs);
            }
            catch
            {
                return 0.0;
            }
        }

        public static int CountOldCarts( byte days)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteScalar("Cart_CountOldCarts", days);
                return Convert.ToInt32(rs);
            }
            catch
            {
                return -1;
            }
        }

        public static bool DeleteOldCarts(byte days)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Cart_DeleteOldCarts",days);
            return rs > 0;
        }

        public static int CreateOrder(string firstName, string lastName, string email, string phone, string address)
        {
            try
            {
                HttpContext context = HttpContext.Current;
                string userName = context.User.Identity.Name;
                object rs = DataProvider.Instance.ExecuteScalar("Order_Create", CartID, userName, firstName, lastName, email, phone, address);
                return Convert.ToInt32(rs);
            }
            catch 
            {
                return -1;
            }
        }
    }
}
