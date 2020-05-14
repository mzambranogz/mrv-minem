using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class ParametroDetalleBE : BaseBE
    {
        public int ID_DETALLE { get; set; }
        public string NOMBRE_DETALLE { get; set; }
        public int ID_PARAMETRO { get; set; }
    }
}
