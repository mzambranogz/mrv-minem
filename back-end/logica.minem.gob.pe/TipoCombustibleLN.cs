using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoCombustibleLN
    {
        public static TipoCombustibleDA tipoCombustible = new TipoCombustibleDA();

        public static List<TipoCombustibleBE> ListarTipoCombustible(TipoCombustibleBE entidad)
        {
            return tipoCombustible.ListarTipoCombustible(entidad);
        }
    }
}
