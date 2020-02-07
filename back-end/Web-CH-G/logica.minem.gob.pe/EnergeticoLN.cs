using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class EnergeticoLN
    {
        public static EnergeticoDA energ = new EnergeticoDA();
        public static List<EnergeticoBE> ListarENERG(EnergeticoBE entidad)
        {
            return energ.ListarENERG(entidad);
        }

        public static List<EnergeticoBE> ListarENERGProyecto(EnergeticoBE entidad)
        {
            return energ.ListarENERGProyecto(entidad);
        }
    }
}
