using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoIniciativaLN
    {
        public static TipoIniciativaDA tipoDA = new TipoIniciativaDA();

        public static List<TipoIniciativaBE> listarTipoIniciativa()
        {
            return tipoDA.ListarTipoIniciativa();
        }

        public static List<TipoIniciativaBE> ListarTipoIniciativaPaginado(TipoIniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return tipoDA.ListarTipoIniciativaPaginado(entidad);
        }

        public static List<TipoIniciativaBE> ListarTipoIniciativaExcel(TipoIniciativaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return tipoDA.ListarTipoIniciativaExcel(entidad);
        }

        public static TipoIniciativaBE GetTipoIniciativaPorId(TipoIniciativaBE entidad)
        {
            return tipoDA.GetTipoIniciativaPorId(entidad);
        }

        public static TipoIniciativaBE RegistrarTipoIniciativa(TipoIniciativaBE entidad)
        {
            return tipoDA.RegistrarTipoIniciativa(entidad);
        }

        public static TipoIniciativaBE ActualizarTipoIniciativa(TipoIniciativaBE entidad)
        {
            return tipoDA.ActualizarTipoIniciativa(entidad);
        }

        public static TipoIniciativaBE EliminarTipoIniciativa(TipoIniciativaBE entidad)
        {
            return tipoDA.EliminarTipoIniciativa(entidad);
        }
    }
}
