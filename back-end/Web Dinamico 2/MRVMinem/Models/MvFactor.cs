using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvFactor
    {
        public int IdFactor { get; set; }
        public List<FactorBE> ListaFactores { get; set; }
        public List<TipoControlBE> ListaControl { get; set; }
       public List<ParametroBE> ListaParametro { get; set; }
    }
}