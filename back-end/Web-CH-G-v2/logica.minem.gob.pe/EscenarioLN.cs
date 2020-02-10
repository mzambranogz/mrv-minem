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
            return escenarioDA.ListaEscenariosPaginado(entidad);
        }

        public static EscenarioBE GetEscenarioPorId(EscenarioBE entidad)
        {
            return escenarioDA.GetEscenarioPorId(entidad);
        }

        public static EscenarioBE RegistrarSector(EscenarioBE entidad)
        {
            return escenarioDA.RegistrarSector(entidad);
        }

        public static EscenarioBE ActualizarSector(EscenarioBE entidad)
        {
            return escenarioDA.ActualizarSector(entidad);
        }

        public static EscenarioBE EliminarEscenario(EscenarioBE entidad)
        {
            return escenarioDA.EliminarEscenario(entidad);
        }
    }
}
