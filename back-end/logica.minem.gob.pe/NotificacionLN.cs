using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class NotificacionLN
    {
        public static NotificacionDA notificacionDA = new NotificacionDA();

        public static NotificacionBE ConsultaNotificaciones(int Idusuario, int IdRol)
        {
            return notificacionDA.ConsultaNotificaciones(Idusuario, IdRol);
        }
    }
}
