using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class ParametroLN
    {
        private static ParametroDA parametroDA = new ParametroDA();

        public static List<ParametroBE> ListarParametro(int medida)
        {
            return parametroDA.listarParametro(medida);
        }

        public static List<ParametroBE> ListarParametroControl()
        {
            return parametroDA.listarParametroControl();
        }

        public static List<ParametroBE> ListarParametroEnfoque(ParametroBE entidad)
        {
            return parametroDA.listarParametroEnfoque(entidad);
        }
    }
}
