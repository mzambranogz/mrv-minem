using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class TipoControlBE
    {
        public int ID_MEDMIT { get; set; }
        public int ID_ENFOQUE { get; set; }
        public string FORMULA { get; set; }
        public List<ParametroBE> ListaParametro { get; set; }
        public ParametroBE Parametro { get; set; }
    }
}
