using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class ParametroIndicadorBE
    {
        public int ID_ORDEN { get; set; }
        public int ID_TIPO_CONTROL { get; set; }
        public string ENFOQUE { get; set; }
        public string MEDIDA_MIT { get; set; }
        public string NOMBRE_PARAMETRO { get; set; }
        public string COLOR_GRUPO { get; set; }
        public string FORMULA { get; set; }        
        public ParametroBE Parametro { get; set; }
        public List<ParametroBE> ListaParametro { get; set; }
        public List<ParametroIndicadorBE> ListaParametroInd { get; set; }
    }
}
