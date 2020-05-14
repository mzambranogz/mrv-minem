using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class AnnoLN
    {
        public static AnnoDA aDA = new AnnoDA();

        public static List<AnnoBE> ListaAnno(int anno)
        {
            return aDA.ListaAnno(anno);
        }

    }
}
