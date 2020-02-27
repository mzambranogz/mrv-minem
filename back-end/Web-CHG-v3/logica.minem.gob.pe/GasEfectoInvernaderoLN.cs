using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class GasEfectoInvernaderoLN
    {
        public static GasEfectoInvernaderoDA gei = new GasEfectoInvernaderoDA();
        public static List<GasEfectoInvernaderoBE> ListarGEI(GasEfectoInvernaderoBE entidad)
        {
            return gei.ListarGEI(entidad);
        }

        public static List<GasEfectoInvernaderoBE> ListarGeiPaginado(GasEfectoInvernaderoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return gei.ListarGeiPaginado(entidad);
        }

        public static List<GasEfectoInvernaderoBE> ListarGeiExcel(GasEfectoInvernaderoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return gei.ListarGeiExcel(entidad);
        }

        public static GasEfectoInvernaderoBE GetGeiPorId(GasEfectoInvernaderoBE entidad)
        {
            return gei.GetGeiPorId(entidad);
        }

        public static GasEfectoInvernaderoBE RegistrarGei(GasEfectoInvernaderoBE entidad)
        {
            return gei.RegistrarGei(entidad);
        }

        public static GasEfectoInvernaderoBE ActualizarGei(GasEfectoInvernaderoBE entidad)
        {
            return gei.ActualizarGei(entidad);
        }

        public static GasEfectoInvernaderoBE EliminarGei(GasEfectoInvernaderoBE entidad)
        {
            return gei.EliminarGei(entidad);
        }
    }
}
