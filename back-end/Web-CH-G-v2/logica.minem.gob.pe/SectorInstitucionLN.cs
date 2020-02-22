using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class SectorInstitucionLN
    {
        private static SectorInstitucionDA sectorInstitucionDA = new SectorInstitucionDA();

        public static List<SectorInstitucionBE> ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.ListaSectorInstitucion(entidad);
        }

        public static List<SectorInstitucionBE> ListarSectorPaginado(SectorInstitucionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return sectorInstitucionDA.ListarSectorPaginado(entidad);
        }

        public static List<SectorInstitucionBE> ListarSectorExcel(SectorInstitucionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return sectorInstitucionDA.ListarSectorExcel(entidad);
        }

        public static SectorInstitucionBE GetSectorPorId(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.GetSectorPorId(entidad);
        }

        public static SectorInstitucionBE RegistrarSector(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.RegistrarSector(entidad);
        }

        public static SectorInstitucionBE ActualizarSector(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.ActualizarSector(entidad);
        }

        public static SectorInstitucionBE EliminarSector(SectorInstitucionBE entidad)
        {
            return sectorInstitucionDA.EliminarSector(entidad);
        }
    }
}
