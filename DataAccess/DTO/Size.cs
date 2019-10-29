using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Size
    {
        public int sizeID { get; set; }
        public double width { get; set; }
        public double height { get; set; }
        public double ratio { get; set; }

        public Size() { }
    }
}
