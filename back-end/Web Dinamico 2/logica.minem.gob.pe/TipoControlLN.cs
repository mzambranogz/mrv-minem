using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoControlLN
    {
        public static TipoControlDA control = new TipoControlDA();

        public static List<TipoControlBE> listarTipoControl()
        {
            return control.listarControl();
        }
    }
}
