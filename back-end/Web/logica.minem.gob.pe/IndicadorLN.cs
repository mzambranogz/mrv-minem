using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class IndicadorLN
    {
        public static IndicadorDA indicador = new IndicadorDA();

        public static List<IndicadorBE> ListarTablaIndicador(IndicadorBE entidad)
        {
            return indicador.ListarTablaIndicador(entidad);
        }

        public static List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            return indicador.CalcularIndicador(entidad);
        }

        public static IndicadorBE EliminarIndicador(IndicadorBE entidad)
        {
            return indicador.EliminarIndicador(entidad);
        }

        public static List<IndicadorBE> ListarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ListarDetalleIndicador(entidad);
        }

        public static IndicadorBE EvaluarIndicador(IndicadorBE entidad)
        {
            return indicador.EvaluarIndicador(entidad);
        }

        public static IndicadorBE RegistrarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.RegistrarDetalleIndicador(entidad);
        }
    }
}
