using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
   public class Promotion
    {
        public string PromotionCode { get; set; }
        public int ProductID { get; set; }
        public char PromotionName { get; set; }
        public int ObjectPromotion { get; set; }
        public float PromotionPercent { get; set; }
        public string Description { get; set }

        public Promotion () {}
    }
}
