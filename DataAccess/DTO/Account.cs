using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Account
    {
        public int AccountID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public Account () {}
    }
}
