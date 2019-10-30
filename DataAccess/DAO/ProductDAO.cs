using Core;
using DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    class ProductDAO
    {
        public static List<Product> All()
        {
            return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_All"));
        }
        public static Product Single(string productID)
        {
            try
            {
                return CBO.FillObject<Product>(DataProvider.Instance.ExecuteReader("Product_Single", Convert.ToInt32(productID)));
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
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@ProductID", "Product_Insert", data.ProducerID,data.Name,
                data.BasicPrice,data.Description,data.OperatingSystemID,data.SizeID,
                data.PromotionCode,data.Thumbnail,data.Image,data.PromoFront);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Product data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Product_Update", data.ProducerID, data.Name,
                data.BasicPrice, data.Description, data.OperatingSystemID, data.SizeID,
                data.PromotionCode, data.Thumbnail, data.Image, data.PromoFront);
            return rs > 0;
        }

        public static bool UpdatePromo(string productID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Product_UpdatePromo", productID, promo);
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

        public static List<Product> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_OnPromo", page,
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
    }
}