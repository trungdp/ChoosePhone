using Core;
using System;
using System.Collections.Generic;
using System.Data;

namespace DataAccess
{
    public class Category
    {
        public int categoryID { get; set; }
        public string name { get; set; }
        public string description { get; set; }

        public Category() { }

        public static List<Category> All()
        {
            return CBO.FillCollection<Category>(DataProvider.Instance.ExecuteReader("Category_All"));
        }

        public static List<Category> Find(string title)
        {
            return CBO.FillCollection<Category>(DataProvider.Instance.ExecuteReader("Category_Find", title));
        }

        public static Category Single(string movieID)
        {
            try
            {
                return CBO.FillObject<Category>(DataProvider.Instance.ExecuteReader("Category_Single", Convert.ToInt32(movieID)));
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int Count()
        {
            return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Category_Count"));
        }

        public static int Add(Category data)
        {
            object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@CategoryID", "Category_Add", data.categoryID, data.name, data.description);
            return rs != null ? Convert.ToInt32(rs) : 0;
        }


        public static bool Update(Category data)
        {
            int rs = DataProvider.Instance.ExecuteNonQuery("Category_Update", data.categoryID, data.name, data.description);
            return rs > 0;
        }

        public static bool Delete(string movieID)
        {
            try
            {
                return DataProvider.Instance.ExecuteNonQuery("Category_Delete", Convert.ToInt32(movieID)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<Category> Paging(int pageNumber, int pageSize, out int pageCount)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Category_Paging", pageNumber, pageSize);
                reader.Read();
                pageCount = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Category>(reader);
            }
            catch (Exception)
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                pageCount = 0;
                return new List<Category>();
            }
        }
    }
}
