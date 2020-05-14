using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class MedMitRptBE
    {
        public int ID_MEDMIT { get; set; }
        public string NUMERO_MEDMIT { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string DESCRIPCION_MEDMIT { get; set; }
        public decimal GEI_TOTAL { get; set; }
        public decimal GEI_PUBLICO { get; set; }
        public decimal GEI_PRIVADO { get; set; }
        public decimal CANT_TOTAL { get; set; }
        public decimal CANT_PUBLICO { get; set; }
        public decimal CANT_PRIVADO { get; set; }

    }
}
