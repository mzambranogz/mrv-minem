using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class MontoInversionBE : BaseBE
    {
        public int ID_INICIATIVA { get; set; }
  
        public int ANIO { get; set; }
        public int MONEDA { get; set; }
        public decimal INVERSION { get; set; }
    }
}
