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
    class SizeDAO
    {
        public static List<Size> All()
        {
            return CBO.FillCollection<Size>(DataProvider.Instance.ExecuteReader("Size_All"));
        }
        public static Size Single(string SizeID)
        {
            try
            {
                return CBO.FillObject<Size>(DataProvider.Instance.ExecuteReader("Size_Single", Convert.ToInt32(SizeID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(Size data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@SizeID", "Size_Insert", data.SizeID, data.Width, data.Height, data.Ratio);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Size data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Size_Update", data.SizeID, data.Width, data.Height, data.Ratio);
            return rs > 0;
        }

        public static bool UpdatePromo(string SizeID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Size_UpdatePromo", SizeID, promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Size_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Size> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Size_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Size>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Size>();
            }
        }

        public static List<Size> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Size_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Size>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Size>();
            }
        }

        public static List<Size> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Size_OnPromo", page,
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Size>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Size>();
            }
        }
    }
}
