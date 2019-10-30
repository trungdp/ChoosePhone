using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Core;
using DataAccess.DTO;


namespace DataAccess.DAO
{
    class MemberCustomerDAO
    {
        public static List<MemberCustomer> All()
        {
            return CBO.FillCollection<MemberCustomer>(DataProvider.Instance.ExecuteReader("MemberCustomer_All"));
        }

        public static MemberCustomer Single(string id)
        {
            try
            {
                return CBO.FillObject<MemberCustomer>(DataProvider.Instance.ExecuteReader("MemberCustomer_Single", Convert.ToInt32(id)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(MemberCustomer data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@MemberCustomer", "MemberCustomer_Insert", data.AccountID, data.Name, data.LastName, data.IDCard, data.Sex,
                data.PhoneNumber, data.Address, data.Email, data.PromotionCode);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }
        public static bool Update(MemberCustomer data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("MemberCustomer_Update", data.AccountID, data.Name, data.LastName, data.IDCard, data.Sex,
                data.PhoneNumber, data.Address, data.Email, data.PromotionCode);
            return rs > 0;
        }
        public static bool Delete(string id)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("MemberCustomer_Delete", Convert.ToInt32(id)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static List<MemberCustomer> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("MemberCustomer_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<MemberCustomer>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<MemberCustomer>();
            }
        }

        public static List<MemberCustomer> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("MemberCustomer_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<MemberCustomer>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<MemberCustomer>();
            }
        }
    }
}
