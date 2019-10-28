using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class OperatingSystem
    {
        public int OperatingSystemID { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public string Description { get; set; }

        public OperatingSystem () {}
    }
}
