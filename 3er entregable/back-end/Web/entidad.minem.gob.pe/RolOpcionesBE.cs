using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class RolOpcionesBE : BaseBE
    {
        public int ID_OPCION { get; set; }
        public int ID_ROL { get; set; }
        public int ID_USUARIO { get; set; }
        public string DES_OPCION { get; set; }
        public string NOMBRES { get; set; }
        public string INSTITUCION { get; set; }
        public string SECTOR { get; set; }
        public string CORREO { get; set; }
        public string DIRECCION { get; set; }
    }
}
