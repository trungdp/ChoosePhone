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
    class ProducerDAO
    {
        public static List<Producer> All()
        {
            return CBO.FillCollection<Producer>(DataProvider.Instance.ExecuteReader("Producer_All"));
        }
        public static Producer Single(string ProducerID)
        {
            try
            {
                return CBO.FillObject<Producer>(DataProvider.Instance.ExecuteReader("Producer_Single", Convert.ToInt32(ProducerID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(Producer data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@ProducerID", "Producer_Insert", data.ProducerID, data.Name, data.Description);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Producer data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Producer_Update", data.ProducerID, data.Name, data.Description);
            return rs > 0;
        }

        public static bool UpdatePromo(string ProducerID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Producer_UpdatePromo", ProducerID, promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Producer_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Producer> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Producer_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Producer>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Producer>();
            }
        }

        public static List<Producer> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Producer_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Producer>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Producer>();
            }
        }

        public static List<Producer> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Producer_OnPromo", page,
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Producer>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Producer>();
            }
        }
    }
}
