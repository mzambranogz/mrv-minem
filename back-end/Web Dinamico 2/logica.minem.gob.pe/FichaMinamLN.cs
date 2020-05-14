using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class FichaMinamLN
    {
        private static FichaMinamDA fichaminamDA = new FichaMinamDA();

        public static List<FichaMinamBE> ListaFichaMinam(FichaMinamBE entidad)
        {
            return fichaminamDA.ListaFichaMinam(entidad);
        }

        public static List<FichaParametroBE> ListaFichaParametros(FichaParametroBE entidad)
        {
            return fichaminamDA.ListaFichaParametros(entidad);
        }
    }
}
