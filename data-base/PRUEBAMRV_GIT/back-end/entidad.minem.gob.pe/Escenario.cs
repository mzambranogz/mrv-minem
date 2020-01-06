using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class EscenarioBE : BaseBE
    {
        public int ID_ESCENARIO { get; set; }
        public int MEDIDA { get; set; }
        public int ANNO { get; set; }

        public int BAU_EMISION { get; set; }

        public int MIT_EMISION { get; set; }
        public int REDUCCION { get; set; }
        public int VALOR_SOFTWARE { get; set; }
        public int EXPOST { get; set; }
        public int META_ANUAL { get; set; }

    }
}