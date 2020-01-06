using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class UsuarioBE : BaseBE
    {
        public int ID_USUARIO { get; set; }
        public string USUEMAIL { get; set; }
        public string USUNOM { get; set; }
        public String USUAPE { get; set; }
        public string USUPASS { get; set; }
        public string USUTELEFONO { get; set; }
        public string USUCELULAR { get; set; }
        public int ID_SECTOR_INST { get; set; }
        public int ID_INSTITUCION { get; set; }
        public int ID_ESTADO_USUARIO { get; set; }
        public string INSTITUCION { get; set; }
        public string RUC { get; set; }
        public string DIRECCION { get; set; }
        public string USUARIO { get; set; }
        public char TERMINOS { get; set; }

    }
}
