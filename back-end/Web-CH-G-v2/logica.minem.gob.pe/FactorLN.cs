using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class FactorLN
    {
        public static FactorDA factorDA = new FactorDA();

        public static List<FactorBE> ListaFactor(FactorBE entidad)
        {
            List<FactorBE> lista = factorDA.ListaFactor(entidad);

            if (lista != null)
            {
                foreach(var item in lista)
                {
                    FactorBE vEntidad = new FactorBE() { ID_FACTOR = item.ID_FACTOR };
                    item.ListaFactorParametro = factorDA.ListaFactorParametro(vEntidad);
                }
            }

            return lista;
        }

        public static List<FactorParametroBE> ListaFactorParametro(FactorBE entidad)
        {
            return factorDA.ListaFactorParametro(entidad);
        }
    }
}
