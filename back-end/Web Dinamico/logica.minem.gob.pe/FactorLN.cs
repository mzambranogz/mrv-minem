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
    }
}
