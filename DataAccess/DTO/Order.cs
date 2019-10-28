using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Order
    {
        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public string CartID { get; set; }
        public int ProductID { get; set; }
        public DateTime DateOrdered { get; set; }
        public DateTime DateShipping { get; set; }
        public float SubTotal { get; set; }
        public int Status { get; set; }
        public string ShippingAdress { get; set; }

        public Order () {}
    }
}
