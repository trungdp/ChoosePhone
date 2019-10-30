using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core;
using DataAccess.DTO;
using System.Data;

namespace DataAccess.DAO
{
    class OrderDAO
    {
        public static List<Order> All()
        {
            return CBO.FillCollection<Order>(DataProvider.Instance.ExecuteReader("Order_All"));
        }
        public static Order Single(string OrderID)
        {
            try
            {
                return CBO.FillObject<Order>(DataProvider.Instance.ExecuteReader("Order_Single", Convert.ToInt32(OrderID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Count()
        {
            return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Order_Count"));
        }

        public static int Insert(Order data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@OrderID", "Order_Insert", data.OrderID, data.CustomerID, data.CartID,
                data.ProductID, data.DateOrdered, data.DateShipping, data.SubTotal, data.Status, data.ShippingAddress);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Order data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Order_Update", data.OrderID, data.CustomerID, data.CartID,
                data.ProductID, data.DateOrdered, data.DateShipping, data.SubTotal, data.Status, data.ShippingAddress);
            return rs > 0;
        }

        public static bool UpdatePromo(string OrderID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Order_UpdatePromo", OrderID, promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Order_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Order> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Order_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Order>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Order>();
            }
        }

        public static List<Order> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Order_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Order>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Order>();
            }
        }

        public static List<Order> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Order_OnPromo", page,
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Order>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Order>();
            }
        }
    }
}
