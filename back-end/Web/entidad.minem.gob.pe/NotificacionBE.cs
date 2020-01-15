using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class NotificacionBE : BaseBE
    {
        public int ID_NOTIFICACION { get; set; }
        public int ID_INICIATIVA { get; set; }
        public int ID_ETAPA { get; set; }
        public int ID_ESTADO { get; set; }
        public int ID_ESTADO_NOTIFICACION { get; set; }
        //public DateTime FECHA_REGISTRO { get; set; }
        public int ID_ROL { get; set; }
        public int ID_USUARIO { get; set; }
        public string FLG_VISTO { get; set; }
        public DateTime FECHA_VISTO { get; set; }
        public string DESCRIPCION { get; set; }
        public int ID_USUARIO_VISTO { get; set; }
    }
}
