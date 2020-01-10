using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoFuenteLN
    {
        public static TipoFuenteDA tipoFuente = new TipoFuenteDA();

        public static List<TipoFuenteBE> ListarTipoFuente(TipoFuenteBE entidad)
        {
            return tipoFuente.ListarTipoFuente(entidad);
        }
    }
}
