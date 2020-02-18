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

        public static List<FactorBE> ListaFactorPaginado(FactorBE entidad)
        {
            List<FactorBE> lista = factorDA.ListaFactorPaginado(entidad);

            if (lista != null)
            {
                foreach (var item in lista)
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

        public static FactorBE RegistraFactor(FactorBE entidad)
        {

            entidad = factorDA.RegistraFactor(entidad);
            if (entidad.OK)
            {
                if (entidad.ListaFactorParametro != null)
                {
                    entidad = factorDA.EliminaParametroFactor(entidad);
                    if (entidad.OK)
                    {
                        foreach (var item in entidad.ListaFactorParametro)
                        {
                            item.ID_FACTOR = entidad.ID_FACTOR;
                            FactorParametroBE resultado = factorDA.RegistraParametroFactor(item);
                            if (!resultado.OK)
                            {
                                entidad.OK = resultado.OK;
                                entidad.message = resultado.message;
                                break;
                            }
                        }
                    }
                }
            }

            return entidad;
        }

    }
}
