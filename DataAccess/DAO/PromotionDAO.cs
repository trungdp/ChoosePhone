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
    class PromotionDAO
    {
        public static List<Promotion> All()
        {
            return CBO.FillCollection<Promotion>(DataProvider.Instance.ExecuteReader("Promotion_All"));
        }
        public static Promotion Single(string PromotionID)
        {
            try
            {
                return CBO.FillObject<Promotion>(DataProvider.Instance.ExecuteReader("Promotion_Single", Convert.ToInt32(PromotionID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Count()
        {
            return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Promotion_Count"));
        }

        public static int Insert(Promotion data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@PromotionID", "Promotion_Insert", data.PromotionCode, data.ProductID, data.PromotionName, 
                data.ObjectPromotion, data.PromotionPercent, data.Description);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Promotion data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Promotion_Update", data.PromotionCode, data.ProductID, 
                data.PromotionName, data.ObjectPromotion, data.PromotionPercent, data.Description);
            return rs > 0;
        }

        public static bool UpdatePromo(string PromotionID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Promotion_UpdatePromo", PromotionID, promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Promotion_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Promotion> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Promotion_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Promotion>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Promotion>();
            }
        }

        public static List<Promotion> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Promotion_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Promotion>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Promotion>();
            }
        }

        public static List<Promotion> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Promotion_OnPromo", page,
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Promotion>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Promotion>();
            }
        }
    }
}
