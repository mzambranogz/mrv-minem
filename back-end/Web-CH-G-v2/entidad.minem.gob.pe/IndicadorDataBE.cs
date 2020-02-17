using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class IndicadorDataBE : BaseBE
    {
        public int ID_INICIATIVA { get; set; }
        public int ID_INDICADOR { get; set; }
        public int ID_ENFOQUE { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ID_PARAMETRO { get; set; }
        public string VALOR { get; set; }
    }
}
