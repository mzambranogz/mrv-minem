using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class SustentoIniciativaBE: BaseBE
    {
        public int ID_INICIATIVA_SUSTENTATORIO { get; set; }
        public int ID_INICIATIVA { get; set; }
        public string ADJUNTO_BASE { get; set; }
        public string ADJUNTO { get; set; }
        public string FLAG_ESTADO { get; set; }
    }
}
