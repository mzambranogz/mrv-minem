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

        public static List<MedidaMitigacionBE> ListarMedidaMitigacionAsociado(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.ListarMedidaMitigacionAsociado(entidad);
        }

        ////MANTENIMIENTO
        public static List<MedidaMitigacionBE> ListaMedidaMitigacionMantenimiento(MedidaMitigacionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return medidaMitigacion.ListaMedidaMitigacionMantenimiento(entidad);
        }

        public static MedidaMitigacionBE GuardarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.GuardarMedidaMitigacion(entidad);
        }

        public static List<MedidaMitigacionBE> BuscarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.BuscarMedidaMitigacion(entidad);
        }

        public static List<MedidaMitigacionBE> ListarMedidaMitigacionExcel(MedidaMitigacionBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return medidaMitigacion.ListaMedidaMitigacionExcel(entidad);
        }

        public static MedidaMitigacionBE EliminarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            return medidaMitigacion.EliminarMedidaMitigacion(entidad);
        }
    }
}
