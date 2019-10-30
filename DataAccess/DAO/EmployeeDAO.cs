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
    class EmployeeDAO
    {
        public static List<Employee> All()
        {
            return CBO.FillCollection<Employee>(DataProvider.Instance.ExecuteReader("Employee_All"));
        }

        public static Employee Single(string id)
        {
            try
            {
                return CBO.FillObject<Employee>(DataProvider.Instance.ExecuteReader("Employee_Single", Convert.ToInt32(id)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Insert(Employee data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput(
                "@Employee", "Employee_Insert", data.EmployeeID, data.Name,data.LastName,data.IDCard,
                data.DateOfBirth,data.Sex,data.Address,data.PhoneNumber,data.Email,data.AccountID);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }
        public static bool Update(Employee data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Employee_Update", data.EmployeeID, data.Name, data.LastName, data.IDCard,
                data.DateOfBirth, data.Sex, data.Address, data.PhoneNumber, data.Email, data.AccountID);
            return rs > 0;
        }
        public static bool Delete(string id)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Employee_Delete", Convert.ToInt32(id)) > 0;
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
                reader = DataProvider.Instance.ExecuteReader("Employee_Paging", pageNumber, pageSize);
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
                reader = DataProvider.Instance.ExecuteReader("Employee_Search", keyword, Convert.ToInt32(page),
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
