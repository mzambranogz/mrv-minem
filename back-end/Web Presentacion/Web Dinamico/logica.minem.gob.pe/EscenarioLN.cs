using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class EscenarioLN
    {
        private static EscenarioDA escenarioDA = new EscenarioDA();

        public static List<EscenarioBE> ListaEscenariosPaginado(EscenarioBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return escenarioDA.ListaEscenariosPaginado(entidad);
        }

        public static List<EscenarioBE> ListarEscenarioExcel(EscenarioBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return escenarioDA.ListarEscenarioExcel(entidad);
        }

        public static EscenarioBE GetEscenarioPorId(EscenarioBE entidad)
        {
            return escenarioDA.GetEscenarioPorId(entidad);
        }

        public static EscenarioBE RegistrarEscenario(EscenarioBE entidad)
        {
            return escenarioDA.RegistrarEscenario(entidad);
        }

        public static EscenarioBE ActualizarEscenario(EscenarioBE entidad)
        {
            return escenarioDA.ActualizarEscenario(entidad);
        }

        public static EscenarioBE EliminarEscenario(EscenarioBE entidad)
        {
            return escenarioDA.EliminarEscenario(entidad);
        }
    }
}
