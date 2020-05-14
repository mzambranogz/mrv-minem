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

        public static List<IPCCBE> ListarIPCCPaginado(IPCCBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return ipcc.ListarIPCCPaginado(entidad);
        }

        public static List<IPCCBE> ListarIPCCExcel(IPCCBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return ipcc.ListarIPCCExcel(entidad);
        }

        public static IPCCBE GetIPCCPorId(IPCCBE entidad)
        {
            return ipcc.GetIPCCPorId(entidad);
        }

        public static IPCCBE RegistrarIPCC(IPCCBE entidad)
        {
            return ipcc.RegistrarIPCC(entidad);
        }

        public static IPCCBE ActualizarIPCC(IPCCBE entidad)
        {
            return ipcc.ActualizarIPCC(entidad);
        }

        public static IPCCBE EliminarIPCC(IPCCBE entidad)
        {
            return ipcc.EliminarIPCC(entidad);
        }
    }
}
