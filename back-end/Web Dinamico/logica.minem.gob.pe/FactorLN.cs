using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class FactorLN
    {
        public static FactorDA factor = new FactorDA();

        public static List<FactorBE> listarFactores()
        {
            return factor.listarFactores();
        }

        public static List<FactorBE> listarMedidaFactor()
        {
            return factor.ListaMedidaFactor();
        }

        public static List<FactorBE> GetMedidaFactor(FactorBE entidad)
        {
            return factor.ListaMedidaFactores(entidad);
        }

        public static List<FactorParametroBE> ListarCabeceraFactor(FactorParametroBE entidad)
        {
            return factor.listarCabeceraFactor(entidad);
        }

        public static List<FactorParametroBE> ListarCuerpoFactor(FactorParametroBE entidad)
        {
            return factor.listarCuerpoFactor(entidad);
        }

        public static List<FactorParametroDataBE> ListarDatosFactorData(FactorParametroDataBE entidad)
        {
            return factor.ListarDatosFactorData(entidad);
        }

        public static FactorBE GuardarFactores(FactorBE entidad)
        {
            FactorBE e = new FactorBE();
            foreach (var item in entidad.listaFactorData)
            {
                e = factor.GuardarFactores(item);
            }

            if (!string.IsNullOrEmpty(entidad.ID_ELIMINAR_FACTOR))
                e = factor.EliminarFactores(entidad);
            return e;
        }
    }
}
