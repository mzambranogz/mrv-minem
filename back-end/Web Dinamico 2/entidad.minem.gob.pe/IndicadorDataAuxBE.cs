using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class IndicadorDataBE
    {
        public int ID_TIPO_CONTROL { get; set; }
        public int ID_TIPO_DATO { get; set; }
        public int ID_COLOR_INDICADOR { get; set; }
        public int VERIFICABLE { get; set; }
        public string DESCRIPCION { get; set; }        
        public List<IndicadorDataBE> listaInd { get; set; }
        public List<ParametroBE> listaParam { get; set; }
    }
}
