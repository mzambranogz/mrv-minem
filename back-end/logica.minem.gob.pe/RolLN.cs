using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class RolLN
    {
        public static RolDA rol = new RolDA();

        public static List<RolBE> ListarRol(RolBE entidad)
        {
            return rol.ListarRol(entidad);
        }
    }
}
