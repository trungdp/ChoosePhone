using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Product
    {
        public int ProductID { get; set; }
        public int ProducerID { get; set; }
        public string Name { get; set; }
        public float BasicPrice { get; set; }
        public string Description { get; set; }
        public int OperatingSystemID { get; set; }
        public int SizeID { get; set; }
        public DateTime DateAdded { get; set; }
        public string PromotionCode { get; set; }
        public string Thumbnail { get; set; }
        public string Image { get; set; }
        public bool PromoFront { get; set; }
    }
}
