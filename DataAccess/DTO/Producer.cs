﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTO
{
    public class Producer
    {
        public int ProducerID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public Producer () {}
    }
}
