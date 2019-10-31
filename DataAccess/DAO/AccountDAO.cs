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
    class AccountDAO
    {
        public static List<Account> All()
        {
            return CBO.FillCollection<Account>(DataProvider.Instance.ExecuteReader("Account_All"));
        }
        public static Account Single(string AccountID)
        {
            try
            {
                return CBO.FillObject<Account>(DataProvider.Instance.ExecuteReader("Account_Single", Convert.ToInt32(AccountID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(Account data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@AccountID", "Account_Insert",data.AccountID, data.Username, data.Password);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Account data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Account_Update", data.AccountID, data.Username, data.Password);
            return rs > 0;
        }
        public static bool Delete(string AccountID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Account_Delete", Convert.ToInt32(AccountID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Account> Paging(string pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Account_Paging", Convert.ToInt32(pageNumber) , pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Account>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Account>();
            }
        }

        public static List<Account> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Account_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Account>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Account>();
            }
        }
    }
}
