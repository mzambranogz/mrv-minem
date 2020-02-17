using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class EnergeticoLN
    {
        public static EnergeticoDA energ = new EnergeticoDA();
        public static List<EnergeticoBE> ListarENERG(EnergeticoBE entidad)
        {
            return energ.ListarENERG(entidad);
        }

        public static List<EnergeticoBE> ListarENERGProyecto(EnergeticoBE entidad)
        {
            return energ.ListarENERGProyecto(entidad);
        }

        public static List<EnergeticoBE> ListarEnergeticoPaginado(EnergeticoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return energ.ListarEnergeticoPaginado(entidad);
        }

        public static List<EnergeticoBE> ListarEnergeticoExcel(EnergeticoBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return energ.ListarEnergeticoExcel(entidad);
        }

        public static EnergeticoBE GetEnergeticoPorId(EnergeticoBE entidad)
        {
            return energ.GetEnergeticoPorId(entidad);
        }

        public static EnergeticoBE RegistrarEnergetico(EnergeticoBE entidad)
        {
            return energ.RegistrarEnergetico(entidad);
        }

        public static EnergeticoBE ActualizarEnergetico(EnergeticoBE entidad)
        {
            return energ.ActualizarEnergetico(entidad);
        }

        public static EnergeticoBE EliminarEnergetico(EnergeticoBE entidad)
        {
            return energ.EliminarEnergetico(entidad);
        }
    }
}
