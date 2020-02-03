using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class EscenarioRptLN
    {
        private static EscenarioRptDA escenariorptDA = new EscenarioRptDA();

        public static List<EscenarioRptBE> ListaEscenariosRpt(EscenarioRptBE entidad)
        {
            return escenariorptDA.ListaEscenariosRpt(entidad);
        }
    }
}
