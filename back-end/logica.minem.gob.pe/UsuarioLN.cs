using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using utilitario.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class UsuarioLN
    {
        private static UsuarioDA usuarioDA = new UsuarioDA();

        public static UsuarioBE VerificarEmail(UsuarioBE entidad)
        {
            if (usuarioDA.VerificarEmail(entidad) == 0)
            {
                entidad.OK = true;
            }
            else
            {
                entidad.OK = false;
            }
            return entidad;
        }
        public static UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {
            entidad.PASSWORD_USUARIO = Seguridad.hashSal(entidad.PASSWORD_USUARIO);
            return usuarioDA.RegistraUsuario(entidad);
        }

        public static UsuarioBE ObtenerPassword(UsuarioBE entidad)
        {
            var ent = usuarioDA.ObtenerPassword(entidad);
            if (ent.PASSWORD_USUARIO == "")
            {
                entidad.OK = false;
            }else
            {
                entidad.OK = Seguridad.CompararHashSal(entidad.PASSWORD_USUARIO, ent.PASSWORD_USUARIO);
                entidad.ID_USUARIO = ent.ID_USUARIO;
            }
            
            return entidad;
        }

        public static List<UsuarioBE> ObtenerInformacionUsuario(UsuarioBE entidad)
        {
            return usuarioDA.ObtenerInformacionUsuario(entidad);
        }

    }
}
