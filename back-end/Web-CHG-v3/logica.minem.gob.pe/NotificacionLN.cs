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

        public static List<NotificacionBE> ListarNotificacion(NotificacionBE entidad)
        {
            return notificacionDA.ListarNotificacion(entidad);
        }

        public static NotificacionBE GetNotificacion(NotificacionBE entidad)
        {
            return notificacionDA.GetNotificacion(entidad);
        }

        public static NotificacionBE RegistraVistoNotificacion(NotificacionBE entidad)
        {
            return notificacionDA.RegistraVistoNotificacion(entidad);
        }
    }
}
