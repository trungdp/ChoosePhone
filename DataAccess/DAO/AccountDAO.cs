using Core;
using DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    class AccountDAO
    {
        public static Account Single(string name, string hashedPassword)
        {
            try
            {
                return CBO.FillObject<Account>(DataProvider.Instance.ExecuteReader("Account_Single", name, hashedPassword));
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
