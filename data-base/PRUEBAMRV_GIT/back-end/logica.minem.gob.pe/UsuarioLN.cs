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

        public static UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {
            entidad.USUPASS = Seguridad.hashSal(entidad.USUPASS);
            return usuarioDA.RegistraUsuario(entidad);
        }

        public static UsuarioBE ObtenerPassword(UsuarioBE entidad)
        {
            var passBD = usuarioDA.ObtenerPassword(entidad);
            if (passBD == "")
            {
                entidad.OK = false;
            }else
            {
                entidad.OK = Seguridad.CompararHashSal(entidad.USUPASS, passBD);
            }
            
            return entidad;
        }
    }
}
