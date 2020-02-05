using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class InstitucionLN
    {
        private static InstitucionDA institucionDA = new InstitucionDA();

        public static InstitucionBE registrarInstitucion(InstitucionBE entidad)
        {
            return institucionDA.registrarInstitucion(entidad);
        }

        public static List<InstitucionBE> ListaInstitucionPaginado(InstitucionBE entidad)
        {
            return institucionDA.ListaInstitucionPaginado(entidad);
        }
    }
}
