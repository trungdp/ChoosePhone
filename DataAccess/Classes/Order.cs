using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
    public class Order
    {
        public int orderID { get; set; }
        public string userName { get; set; }
        public DateTime dateCreated { get; set; }
        public DateTime? dateShipped { get; set; }
        public string comment { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string shippingAdress { get; set; }
        public int status { get; set; }
        public double totalAmount { get; set; }
        public enum OrderStatus { Pending=0,Complete=1,Cancelled=2}

        public static List<Order> ByRecent(int count)
        {
            try
            {
                return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByRecent",count));
            }
            catch (Exception)
            {
                return new List<Order>();
            }
        }

        public static List<Order> ByDate(string startDate, string endDate)
        {
            try
            {
                return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByDate", startDate,endDate));
            }
            catch (Exception)
            {
                return new List<Order>();
            }
        }

        public static List<Order> ByStatus(int status)
        {
            return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_ByStatus", status));
        }

        public static List<OrderDetail> Details(string orderID)
        {
            return CBO.FillCollection<OrderDetail>(DataProvider.Instance.ExecuteReader("Order_Details", Convert.ToInt32(orderID)));
        }

        public static Order Single(string orderID)
        {
            return CBO.FillObject<Order>(DataProvider.Instance.ExecuteReader("Order_Single", Convert.ToInt32(orderID)));
        }

        public static bool Update(Order order)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Order_Update",
                    order.orderID, order.dateCreated, order.dateShipped,
                    order.comment, order.firstName, order.lastName,
                    order.email, order.phone, order.shippingAdress, order.status);
                return rs > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UpdateStatus(string orderID, Order.OrderStatus status)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Order_UpdateStatus", orderID, status);
                return rs > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
