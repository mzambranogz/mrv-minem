using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public class VariableLN
    {
        private static VariableDA variableDA = new VariableDA();

        public static List<VariableBE> ListaVariabes(VariableBE entidad)
        {
            return variableDA.ListaVariabes(entidad);
        }

    }
}
