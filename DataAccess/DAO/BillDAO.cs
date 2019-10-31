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
    class BillDAO
    {
        public static List<Bill> All()
        {
            return CBO.FillCollection<Bill>(DataProvider.Instance.ExecuteReader("Bill_All"));
        }
        public static Bill Single(string billID)
        {
            try
            {
                return CBO.FillObject<Bill>(DataProvider.Instance.ExecuteReader("Bill_Single", Convert.ToInt32(billID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(Bill data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@BillID", "Bill_Insert",data.BillID, data.CustomerID, data.CardID,data.ProductID,
                data.DateCollect,data.CollectedMoney,data.IntoMoney,data.TotalMoney,data.SellAt,data.CashierID,data.Note);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Bill data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Bill_Update", data.BillID, data.CustomerID, data.CardID, data.ProductID,
                data.DateCollect, data.CollectedMoney, data.IntoMoney, data.TotalMoney, data.SellAt, data.CashierID, data.Note);
            return rs > 0;
        }
        public static bool Delete(string billID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Bill_Delete", Convert.ToInt32(billID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Bill> Paging(string pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Bill_Paging", Convert.ToInt32(pageNumber) , pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Bill>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Bill>();
            }
        }

        public static List<Bill> Search(string keyword, string page, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Bill_Search", keyword, Convert.ToInt32(page),
                    GlobalConfiguration.PageSize, GlobalConfiguration.DesLenght);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Bill>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Bill>();
            }
        }

    }
}
