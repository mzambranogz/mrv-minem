using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class EnfoqueBE : BaseBE
    {
        public int ID_ENFOQUE { get; set; }
        public int ID_MEDMIT { get; set; }
        public string DESCRIPCION { get; set; }
        public string FLAG_ESTADO { get; set; }
    }
}
