using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvSector
    {
        public int IdSector { get; set; }
        public List<SectorInstitucionBE> ListaSectores{ get; set; }
    }
}