using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    /*public static class MedidaMitigacionLN
    {
        public static MedidaMitigacionDA medidaMitigacion = new MedidaMitigacionDA();

        public static List<MedidaMitigacionBE> ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.ListarMedidaMitigacion(entidad);
        }

        public static List<MedidaMitigacionBE> ObtenerMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.ObtenerMedidaMitigacion(entidad);
        }
    } */



    public static class MedidaMitigacionLN
    {
        private static MedidaMitigacionDA medidamitigacionDA = new MedidaMitigacionDA();

        /*public static int RegistrarNama(NamaBE entidad)
        {
            return namaDA.registrarNama(entidad);
        }*/
        public static List<MedidaMitigacionBE> ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidamitigacionDA.ListarMedidaMitigacion(entidad);
        }

        public static List<MedidaMitigacionBE> ObtenerMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidamitigacionDA.ObtenerMedidaMitigacion(entidad);
        }

        public static MedidaMitigacionBE editarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidamitigacionDA.editarMedidaMitigacion(entidad);
        }

        public static MedidaMitigacionBE eliminarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidamitigacionDA.eliminarMedidaMitigacion (entidad);
        }
    }

}
