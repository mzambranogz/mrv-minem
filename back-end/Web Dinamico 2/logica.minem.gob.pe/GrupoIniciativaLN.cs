using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class GrupoIniciativaLN
    {
        public static GrupoIndicadorDA grupo = new GrupoIndicadorDA();

        public static List<GrupoIndicadorBE> listarGrupoIniciativa()
        {
            return grupo.listarGrupoIniciativa();
        }
    }
}
