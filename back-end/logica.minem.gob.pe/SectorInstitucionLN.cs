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
    }
}
