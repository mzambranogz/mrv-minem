using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class RolOpcionesLN
    {
        public static RolOpcionesDA rolOpciones = new RolOpcionesDA();

        public static List<RolOpcionesBE> ListarOpciones(int id)
        {
            return rolOpciones.ListarRolOpciones(id);
        }
    }
}
