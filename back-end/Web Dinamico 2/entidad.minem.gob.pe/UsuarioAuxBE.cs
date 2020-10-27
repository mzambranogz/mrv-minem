using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class UsuarioBE
    {
        public string MEDIDAS { get; set; }
        public string ASUNTO { get; set; }
        public string DESCRIPCION { get; set; }
        public string COLOR { get; set; }
        public string COLOR_ESTADO { get; set; }
        public string DESCRIPCION_ESTADO_USU { get; set; }
        public string NUMERO_CONTACTO { get; set; }
        public int ESTADO_BUSCAR { get; set; }
        public string EMAIL_USUARIO_ORIGEN { get; set; }
        public string CABECERA_EMAIL { get; set; }
        public string ACCIONES { get; set; }   
        public string RUC_ASOCIADO { get; set; }   
    }
}
