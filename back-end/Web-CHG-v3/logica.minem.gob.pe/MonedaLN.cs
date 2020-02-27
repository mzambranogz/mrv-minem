using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public  class MonedaLN
    {
        public static MonedaDA moneda = new MonedaDA();

        public static List<MonedaBE> ListarMoneda(MonedaBE entidad)
        {
            return moneda.ListarMoneda(entidad);
        }

        public static List<MonedaBE> ListarMonedaPaginado(MonedaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return moneda.ListarMonedaPaginado(entidad);
        }

        public static List<MonedaBE> ListarMonedaExcel(MonedaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return moneda.ListarMonedaExcel(entidad);
        }

        public static MonedaBE GetMonedaPorId(MonedaBE entidad)
        {
            return moneda.GetMonedaPorId(entidad);
        }

        public static MonedaBE RegistrarMoneda(MonedaBE entidad)
        {
            return moneda.RegistrarMoneda(entidad);
        }

        public static MonedaBE ActualizarMoneda(MonedaBE entidad)
        {
            return moneda.ActualizarMoneda(entidad);
        }

        public static MonedaBE EliminarMoneda(MonedaBE entidad)
        {
            return moneda.EliminarMoneda(entidad);
        }
    }
}
