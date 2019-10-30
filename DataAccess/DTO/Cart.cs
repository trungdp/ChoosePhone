using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess.DTO
{
   public class Cart
    {
        public string CartID { get; set; }
        public int ProductID { get; set; }
        public DateTime Datecreated { get; set; }
        public int Number { get; set; }
        public float SubTotal { get; set; }
        public string Description { get; set; }

        public Cart () {}

        
    }
}
