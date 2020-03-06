using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
   public  class UsuarioMedMitBE: BaseBE
    {
        public int ID_USUARIO { get; set; }
        public int ID_MEDMIT { get; set; }
        public int FLG_ESTADO { get; set; }
    }
}
