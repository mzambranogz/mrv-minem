using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class PlazoBE : BaseBE
    {
        public int ID_PLAZO_ETAPA_ESTADO { get; set; }
        public int ID_ETAPA { get; set; }
        public int ID_ESTADO { get; set; }
        public int ID_ROL { get; set; }
        public string ETAPA { get; set; }
        public string ESTADO { get; set; }
        public string FLAG_ESTADO {get;set;}
        public string DESCRIPCION { get; set; }
        public string DESCRIPCION_ROL { get; set; }
        public int PLAZO { get; set; }
    }
}
