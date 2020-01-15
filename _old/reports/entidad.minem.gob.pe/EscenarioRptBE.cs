using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class EscenarioRptBE
    {
        public int ID_ESCENARIO { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ANNO { get; set; }
        public decimal BAU_EMISION { get; set; }
        public decimal MIT_EMISION { get; set; }
        public decimal REDUCCION { get; set; }
        public decimal VALOR_SOFTWARE { get; set; }
        public decimal EXPOST { get; set; }
        public decimal PMETA_ANUAL { get; set; }
        public string NOMBRE_MEDMIT { get; set; }

    }
}
