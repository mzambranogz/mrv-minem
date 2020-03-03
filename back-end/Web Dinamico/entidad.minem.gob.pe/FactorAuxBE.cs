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
        public int ORDEN { get; set; }
        public int VALIDAR { get; set; }
        public int ID_ENFOQUE { get; set; }
        public string DESCRIPCION { get; set; }
        public int ID_PARAMETRO { get; set; }
        public string NOMBRE_PARAMETRO { get; set; }
        public string FORMULA { get; set; }
        public List<FactorBE> listaFactor { get; set; }
        public List<FactorParametroBE> ListaFactorParametro { get; set; }
        public List<FactorParametroDataBE> listaFactorData { get; set; }
        public List<ParametroBE> listaParametro { get; set; }
        public List<ParametroDetalleBE> listaDetalle { get; set; }
    }
}
