using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class ParametroBE
    {
        public string COLOR { get; set; }
        public int ID_TIPO_CONTROL { get; set; }
        public string TIPO_CONTROL { get; set; }
        public string VALOR { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ID_INICIATIVA { get; set; }
        public string FORMULA { get; set; }
        public string FORMULA_ARMADO { get; set; }
        public string COMPORTAMIENTO { get; set; }
        public decimal VALOR_FORMULA { get; set; }
        public decimal FACTOR { get; set; }
        public int INS { get; set; }
    }
}
