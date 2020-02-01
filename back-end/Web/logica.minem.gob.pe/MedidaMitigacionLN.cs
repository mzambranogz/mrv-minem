using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class MedidaMitigacionLN
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

        public static MedidaMitigacionBE getMedidaMitigacion(int medida)
        {
            return medidaMitigacion.getMedidaMitigacion(medida);
        }
    }
}
