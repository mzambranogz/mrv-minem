using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class IniciativaLN
    {
        private static IniciativaDA iniciativaDA = new IniciativaDA();

        public static List<IniciativaBE> ListaIniciativa(IniciativaBE entidad)
        {
            return iniciativaDA.ListaIniciativa(entidad);
        }
    }
}
