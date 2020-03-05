using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoIniciativaLN
    {
        public static TipoIniciativaDA tipoDA = new TipoIniciativaDA();

        public static List<TipoIniciativaBE> listarTipoIniciativa()
        {
            return tipoDA.ListarTipoIniciativa();
        }
    }
}
