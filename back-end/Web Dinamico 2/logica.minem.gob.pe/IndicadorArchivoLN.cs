using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class IndicadorArchivoLN
    {
        private static IndicadorArchivoDA indicadorArchivoDA = new IndicadorArchivoDA();

        public static IndicadorArchivoBE GetArchivoDetalleIndicador(IndicadorArchivoBE entidad)
        {
            return indicadorArchivoDA.GetArchivoDetalleIndicador(entidad);
        }

        public static List<IndicadorArchivoBE> GetAllArchivoDetalleIndicador(IndicadorArchivoBE entidad)
        {
            return indicadorArchivoDA.GetAllArchivoDetalleIndicador(entidad);
        }
    }
}
