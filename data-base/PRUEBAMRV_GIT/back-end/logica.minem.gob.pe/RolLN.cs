using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class RolLN
    {
        private static RolDA rolDA = new RolDA();

        /*public static int RegistrarNama(NamaBE entidad)
        {
            return namaDA.registrarNama(entidad);
        }*/
        public static List<RolBE> ListarRol(RolBE entidad)
        {
            return rolDA.ListarRol(entidad);
        }

        public static List<RolBE> ObtenerRol(RolBE entidad)
        {
            return rolDA.ObtenerRol(entidad);
        }

        public static RolBE editarRol(RolBE entidad)
        {
            return rolDA.editarRol(entidad);
        }

        public static RolBE eliminarRol(RolBE entidad)
        {
            return rolDA.eliminarRol(entidad);
        }
    }
}
