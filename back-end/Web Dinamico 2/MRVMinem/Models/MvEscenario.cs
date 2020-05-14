using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvEscenario
    {
        public int IdEscenario { get; set; }
        public List<EscenarioBE> ListaEscenarios { get; set; }
    }
}