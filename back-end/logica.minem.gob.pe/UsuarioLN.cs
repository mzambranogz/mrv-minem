using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class UsuarioLN
    {
        private static UsuarioDA usuarioDA = new UsuarioDA();

        public static UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {
            return usuarioDA.RegistraUsuario(entidad);
        }
    }
}
