using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
    public class AdminAccount
    {
        public string name { get; set; }
        public string password { get; set; }

        public AdminAccount() { }

        public static AdminAccount Single(string name, string hashedPassword)
        {
            try
            {
                return CBO.FillObject<AdminAccount>(DataProvider.Instance.ExecuteReader("Admin_Single",name,hashedPassword));
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
