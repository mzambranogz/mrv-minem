using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class ParametroIndicadorLN
    {
        public static ParametroIndicadorDA paramind = new ParametroIndicadorDA();

        public static ParametroIndicadorBE RegistrarMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            ParametroIndicadorBE ctrl = new ParametroIndicadorBE();
            foreach (var item in entidad.ListaParametro)
            {
                ctrl.Parametro = item;
                ctrl.ID_ENFOQUE = entidad.ID_ENFOQUE;
                ctrl.ID_MEDMIT = entidad.ID_MEDMIT;
                ctrl = paramind.RegistrarMedidaMitigacionDetalle(ctrl);
            }
            return ctrl;
        }

        public static List<ParametroIndicadorBE> ListarParametroIndicador()
        {
            return paramind.ListarParametroIndicador();
        }

        public static List<ParametroIndicadorBE> GetMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            return paramind.getParametroIndicador(entidad);
        }
    }
}
