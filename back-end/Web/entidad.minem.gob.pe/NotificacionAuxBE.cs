using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class NotificacionBE
    {
        public int NOTIFICACIONES { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public int PROGRESO { get; set; }
        public string RESPONSABLE { get; set; }
        public string EVALUADOR { get; set; }
        public string ROL { get; set; }
        public string FECHA
        {
            get
            {
                return FECHA_REGISTRO.ToString("dd/MM/yyyy");
            }
        }
        public int ID_MEDMIT { get; set; }
    }
}
