using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public  class MonedaLN
    {
        public static MonedaDA medidaMitigacion = new MonedaDA();

        public static List<MonedaBE> ListarMoneda(MonedaBE entidad)
        {
            return medidaMitigacion.ListarMoneda(entidad);
        }
    }
}
