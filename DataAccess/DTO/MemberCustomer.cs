using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
     public class MemberCustomer
    {
        public int CustomerID { get; set; }
        public int AccountID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string IDCard { get; set; }
        public int Sex { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string PromotionCode { get; set; }

        public MemberCustomer () {}
    }
}
