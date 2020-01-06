using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class MedidaMitigacionBE : BaseBE
    {
        public int ID_MEDMIT { get; set; }
        public string NUMERO_MEDMIT { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string DESCRIPCION_MEDMIT { get; set; }
        public int ID_NAMA { get; set; }
        public string OBJETIVO_MEDMIT { get; set; }
        public string IPSC_MEDMIT { get; set; }
        public string NAMA { get; set; }
    }
}
