using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Classes
{
    public class OrderDetail
    {
        public int orderID { get; set; }
        public int productID { get; set; }
        public string productName { get; set; }
        public int quantity { get; set; }
        public decimal unitCost { get; set; }
        public decimal? subTotal { get; set; }

        public OrderDetail() { }

        
    }
}
