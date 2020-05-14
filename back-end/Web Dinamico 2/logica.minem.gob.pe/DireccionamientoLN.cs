using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class DireccionamientoLN
    {
        private static DireccionamientoDA dir = new DireccionamientoDA();

        public static int ValidarRuta(DireccionamientoBE entidad)
        {
            return dir.ValidarRuta(entidad);
        }
    }
}
