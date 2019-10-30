using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Size
    {
        public int SizeID { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public double Ratio { get; set; }

        public Size() { }
    }
}
