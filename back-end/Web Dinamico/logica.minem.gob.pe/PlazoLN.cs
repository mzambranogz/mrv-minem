using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;


namespace logica.minem.gob.pe
{
    public static class PlazoLN
    {
        public static PlazoDA plazo = new PlazoDA();

        public static List<PlazoBE> ListarPlazoPaginado(PlazoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return plazo.ListarPlazoPaginado(entidad);
        }

        public static List<PlazoBE> ListarPlazoExcel(PlazoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return plazo.ListarPlazoExcel(entidad);
        }

        public static PlazoBE GetPlazoPorId(PlazoBE entidad)
        {
            return plazo.GetPlazoPorId(entidad);
        }

        public static PlazoBE ActualizarPlazo(PlazoBE entidad)
        {
            return plazo.ActualizarPlazo(entidad);
        }

    }
}
