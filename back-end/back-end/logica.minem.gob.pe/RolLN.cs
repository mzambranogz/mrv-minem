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

        public static List<RolBE> ListarRolPaginado(RolBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return rol.ListarRolPaginado(entidad);
        }

        public static List<RolBE> ListarRolExcel(RolBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return rol.ListarRolExcel(entidad);
        }

        public static RolBE GetRolPorId(RolBE entidad)
        {
            return rol.GetRolPorId(entidad);
        }

        public static RolBE RegistrarRol(RolBE entidad)
        {
            return rol.RegistrarRol(entidad);
        }

        public static RolBE ActualizarRol(RolBE entidad)
        {
            return rol.ActualizarRol(entidad);
        }

        public static RolBE EliminarRol(RolBE entidad)
        {
            return rol.EliminarRol(entidad);
        }
    }
}
