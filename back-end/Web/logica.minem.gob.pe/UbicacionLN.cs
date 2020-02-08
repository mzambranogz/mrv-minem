using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class UbicacionLN
    {
        public static UbicacionDA energ = new UbicacionDA();
        public static List<UbicacionBE> ListarUbicacion(UbicacionBE entidad)
        {
            return energ.ListarUbicacion(entidad);
        }

        public static List<UbicacionBE> ListarUbicacionPaginado(UbicacionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return energ.ListarUbicacionPaginado(entidad);
        }
        public static List<UbicacionBE> ListarUbicacionExcel(UbicacionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return energ.ListarUbicacionExcel(entidad);
        }

        public static UbicacionBE GetUbicacionPorId(UbicacionBE entidad)
        {
            return energ.GetUbicacionPorId(entidad);
        }

        public static UbicacionBE RegistrarUbicacion(UbicacionBE entidad)
        {
            return energ.RegistrarUbicacion(entidad);
        }

        public static UbicacionBE ActualizarUbicacion(UbicacionBE entidad)
        {
            return energ.ActualizarUbicacion(entidad);
        }

        public static UbicacionBE EliminarUbicacion(UbicacionBE entidad)
        {
            return energ.EliminarUbicacion(entidad);
        }
    }
}
