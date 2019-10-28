using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    class Bill
    {
        public int BillID { get; set; }
        public int CustomerID { get; set; }
        public int ProductID { get; set; }
        public int SellAt { get; set; }
        public int CashierID { get; set; }
        public float CollectedMoney { get; set; }
        public float IntoMoney { get; set; }
        public float TotalMoney { get; set; }
        public string CardID { get; set; }
        public string Note { get; set; }
        public DateTime DateCollect { get; set; }

        public Bill () {}
    }   
}
