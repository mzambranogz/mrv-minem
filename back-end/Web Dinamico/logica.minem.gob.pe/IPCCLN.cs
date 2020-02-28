using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;
using utilitario.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class IPCCLN
    {
        public static IPCCDA ipcc = new IPCCDA();

        public static List<IPCCBE> ListaIPCCControl(IPCCBE entidad)
        {
            return ipcc.ListaIPCCControl(entidad);
        }
    }
}
