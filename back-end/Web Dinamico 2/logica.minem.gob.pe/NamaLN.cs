using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;
using utilitario.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class NamaLN
    {
        public static NamaDA nama = new NamaDA();

        public static List<NamaBE> ListaNamaControl(NamaBE entidad)
        {
            return nama.ListaNamaControl(entidad);
        }
    }
}
