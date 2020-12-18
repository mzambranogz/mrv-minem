using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class FactorParametroDataBE : FactorBE
    {
        public int ID_DETALLE { get; set; }
        public string ID_PARAMETRO { get; set; }
        public string VALOR { get; set; }
        public decimal FACTOR { get; set; }
        public string UNIDAD { get; set; }
    }
}
