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
    class OperatingSystemsDAO
    {
        public static List<OperatingSystems> All()
        {
            return CBO.FillCollection<OperatingSystems>(DataProvider.Instance.ExecuteReader("OperatingSystem_All"));
        }
        public static OperatingSystems Single(string OperatingSystemsID)
        {
            try
            {
                return CBO.FillObject<OperatingSystems>(DataProvider.Instance.ExecuteReader("OperatingSystem_Single", Convert.ToInt32(OperatingSystemsID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(OperatingSystems data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@OperatingSystemID", "OperatingSystem_Insert", data.OperatingSystemID, data.Name, data.Version, data.Description);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(OperatingSystems data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("OperatingSystem_Update", data.OperatingSystemID, data.Name, data.Version, data.Description);
            return rs > 0;
        }

        public static bool UpdatePromo(string OperatingSystemsID, bool promo)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("OperatingSystem_UpdatePromo", OperatingSystemsID, promo);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("OperatingSystem_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<OperatingSystems> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("OperatingSystem_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<OperatingSystems>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<OperatingSystems>();
            }
        }

        public static List<OperatingSystems> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("OperatingSystem_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<OperatingSystems>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<OperatingSystems>();
            }
        }

        public static List<OperatingSystems> onPromo(string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("OperatingSystems_OnPromo", page,
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<OperatingSystems>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<OperatingSystems>();
            }
        }
    }
}
