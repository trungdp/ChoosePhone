using Core;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
    public class Product
    {
        public int productID { get; set; }
        public int categoryID { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public decimal? price { get; set; }
        public string thumbnail { get; set; }
        public string image { get; set; }
        public bool? promoFront { get; set; }
        public int quantity { get; set; }
        public double subtotal { get; set; }
        public Product() { }

        public static List<Product> All()
        {
            return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_All"));
        }

        public static List<Product> Find(string title)
        {
            return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_Find", title));
        }

        public static Product Single(string movieID)
        {
            try
            {
                return CBO.FillObject<Product>(DataProvider.Instance.ExecuteReader("Product_Single", Convert.ToInt32(movieID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Count()
        {
            return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Product_Count"));
        }

        public static int Add(Product data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ProductID", "Product_Add", data.categoryID, data.name, data.description);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Product data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Product_Update", data.categoryID, data.name, data.description);
            return rs > 0;
        }

        public static bool UpdatePromo(string productID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Product_UpdatePromo", productID,promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Product_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Product> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Product_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Product>();
            }
        }

        public static List<Product> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Product>();
            }
        }

        public static List<Product> InCategory(string categoryID, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_InCategory", Convert.ToInt32(categoryID), Convert.ToInt32(page), 
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Product>();
            }
        }

        public static List<Product> onPromo(string page,out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_OnPromo", page,
                    GlobalConfiguration.PageSize,GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Product>();
            }
        }
    }
}
