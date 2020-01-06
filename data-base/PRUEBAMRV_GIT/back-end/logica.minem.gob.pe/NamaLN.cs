using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class NamaLN
    {
        private static NamaDA namaDA = new NamaDA();

        /*public static int RegistrarNama(NamaBE entidad)
        {
            return namaDA.registrarNama(entidad);
        }*/
        public static List<NamaBE> ListarNama(NamaBE entidad)
        {
            return namaDA.ListarNama(entidad);
        }

        public static List<NamaBE> ObtenerNama(NamaBE entidad)
        {
            return namaDA.ObtenerNama(entidad);
        }

        public static NamaBE editarNama(NamaBE entidad)
        {
            return namaDA.editarNama(entidad);
        }

        public static NamaBE eliminarNama(NamaBE entidad)
        {
            return namaDA.eliminarNama(entidad);
        }
    }
}