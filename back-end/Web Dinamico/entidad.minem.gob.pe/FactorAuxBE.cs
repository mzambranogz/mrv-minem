using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class FactorBE
    {
        public int ID_MEDMIT { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string NUMERO_MEDMIT { get; set; }
        public string ID_ELIMINAR_FACTOR { get; set; }
        public List<FactorBE> listaFactor { get; set; }
        public List<FactorParametroDataBE> listaFactorData { get; set; }
        public List<ParametroBE> listaParametro { get; set; }
        public List<ParametroDetalleBE> listaDetalle { get; set; }
    }
}
