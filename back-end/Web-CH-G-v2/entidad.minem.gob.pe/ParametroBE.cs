using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class ParametroBE : BaseBE
    {
        public int ID_PARAMETRO { get; set; }
        public string NOMBRE_PARAMETRO { get; set; }
        public int ID_TIPO_CONTROL { get; set; }
        public int ID_TIPO_DATO { get; set; }
        public int ID_DETALLE { get; set; }
        public int EDITABLE { get; set; }
        
    }
}
