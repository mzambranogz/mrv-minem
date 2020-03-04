using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvInstitucion
    {
        public int IdInstitucion { get; set; }
        public List<InstitucionBE> ListaInstitucion { get; set; }
    }
}