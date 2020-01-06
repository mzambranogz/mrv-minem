using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    /*public static class SectorInstitucionLN
    {
        private static SectorInstitucionDA sectorInstitucionDA = new SectorInstitucionDA();

        public static List<SectorInstitucionBE> ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.ListaSectorInstitucion(entidad);
        }
    }*/
    public static class SectorInstitucionLN
    {
        private static SectorInstitucionDA sectorinstitucionDA = new SectorInstitucionDA();

        /*public static int RegistrarNama(NamaBE entidad)
        {
            return namaDA.registrarNama(entidad);
        }*/
        public static List<SectorInstitucionBE> ListarSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorinstitucionDA.ListarSectorInstitucion(entidad);
        }

        public static List<SectorInstitucionBE> ObtenerSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorinstitucionDA.ObtenerSectorInstitucion(entidad);
        }

        public static SectorInstitucionBE editarSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorinstitucionDA.editarSectorInstitucion(entidad);
        }

        public static SectorInstitucionBE eliminarSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorinstitucionDA.eliminarSectorInstitucion(entidad);
        }
    }


}
