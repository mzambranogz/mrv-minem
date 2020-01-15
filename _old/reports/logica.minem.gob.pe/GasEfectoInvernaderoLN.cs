using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class GasEfectoInvernaderoLN
    {
        public static GasEfectoInvernaderoDA gei = new GasEfectoInvernaderoDA();
        public static List<GasEfectoInvernaderoBE> ListarGEI(GasEfectoInvernaderoBE entidad)
        {
            return gei.ListarGEI(entidad);
        }
    }
}
