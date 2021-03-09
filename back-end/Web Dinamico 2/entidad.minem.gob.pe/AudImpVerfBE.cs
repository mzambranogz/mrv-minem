using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class AudImpVerfBE : BaseBE
    {
        public int ID_INICIATIVA { get; set; }
        public int ID_INDICADOR { get; set; }
        public int ID_ESTADO { get; set; }
        public decimal AUDITADO { get; set; }
        public decimal IMPLEMENTADO { get; set; }
        public decimal VERIFICADO { get; set; }
        public decimal ENERGIA_AUDITADO { get; set; }
        public decimal ENERGIA_IMPLEMENTADO { get; set; }
        public decimal ENERGIA_VERIFICADO { get; set; }
    }
}
