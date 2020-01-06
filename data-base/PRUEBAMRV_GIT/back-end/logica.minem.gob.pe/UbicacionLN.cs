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
    public static class UbicacionLN
    {
        private static UbicacionDA ubicacionDA = new UbicacionDA();

        /*public static int RegistrarNama(NamaBE entidad)
        {
            return namaDA.registrarNama(entidad);
        }*/ 
        public static List<UbicacionBE> ListarUbicacion(UbicacionBE entidad)
        {
            return ubicacionDA.ListarUbicacion(entidad);
        }

        public static List<UbicacionBE> ObtenerUbicacion(UbicacionBE entidad)
        {
            return ubicacionDA.ObtenerUbicacion(entidad);
        }

        public static UbicacionBE editarUbicacion(UbicacionBE entidad)
        {
            return ubicacionDA.editarUbicacion(entidad);
        }

        public static UbicacionBE eliminarUbicacion(UbicacionBE entidad)
        {
            return ubicacionDA.eliminarUbicacion(entidad);
        }
    }
}