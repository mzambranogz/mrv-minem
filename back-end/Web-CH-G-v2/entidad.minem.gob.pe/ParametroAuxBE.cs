using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class ParametroBE
    {
        public int ID_ENFOQUE { get; set; }
        public int ID_ORDEN { get; set; }
        public int VERIFICABLE { get; set; }
        public int ID_GRUPO_INDICADOR { get; set; }
        public string COLOR_GRUPO { get; set; }
        public List<ParametroDetalleBE> listaDetalle { get; set; }
        public string FORMULA { get; set; }
    }
}
