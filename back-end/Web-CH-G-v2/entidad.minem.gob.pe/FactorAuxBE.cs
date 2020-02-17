using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class FactorBE
    {
        public int NUMERO_PARAMETROS { get; set; }
        public List<FactorParametroBE> ListaFactorParametro { get; set; }
    }
}
