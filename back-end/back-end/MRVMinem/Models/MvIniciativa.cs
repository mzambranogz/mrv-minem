using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvIniciativa
    {
        public int id { get; set; }
        public IniciativaBE iniciativaBE { get; set; }
    }
}