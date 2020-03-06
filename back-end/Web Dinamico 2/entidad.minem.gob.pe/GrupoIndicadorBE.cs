using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class GrupoIndicadorBE : BaseBE
    {
        public int ID_GRUPO_INDICADOR { get; set; }
        public string GRUPO_INDICADOR { get; set; }
        public string COLOR_GRUPO { get; set; }
        public string FLaG_ESTADO { get; set; }
    }
}
