using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class FactorLN
    {
        public static FactorDA factorDA = new FactorDA();

        public static List<FactorBE> listarFactores()
        {
            return factorDA.listarFactores();
        }

        public static List<FactorBE> listarMedidaFactor()
        {
            return factorDA.ListaMedidaFactor();
        }

        public static List<FactorBE> GetMedidaFactor(FactorBE entidad)
        {
            return factorDA.ListaMedidaFactores(entidad);
        }

        public static List<FactorParametroBE> ListarCabeceraFactor(FactorParametroBE entidad)
        {
            return factorDA.listarCabeceraFactor(entidad);
        }

        public static List<FactorParametroBE> ListarCuerpoFactor(FactorParametroBE entidad)
        {
            return factorDA.listarCuerpoFactor(entidad);
        }

        public static List<FactorParametroDataBE> ListarDatosFactorData(FactorParametroDataBE entidad)
        {
            return factorDA.ListarDatosFactorData(entidad);
        }

        public static FactorBE GuardarFactores(FactorBE entidad)
        {
            FactorBE e = new FactorBE();
            foreach (var item in entidad.listaFactorData)
            {
                e = factorDA.GuardarFactores(item);
            }

            if (!string.IsNullOrEmpty(entidad.ID_ELIMINAR_FACTOR))
                e = factorDA.EliminarFactores(entidad);
            return e;
        }

        public static FactorBE GuardarMedidaFactor(FactorBE entidad)
        {
            FactorBE e = new FactorBE();
            foreach (var item in entidad.listaFactor)
            {
                e = factorDA.GuardarMedidaFactor(item);
                if (!e.OK) break;
            }

            if (e.OK)
            {
                if (!string.IsNullOrEmpty(entidad.ID_ELIMINAR_FACTOR))
                    e = factorDA.EliminarMedidaFactor(entidad);                
            }
            return e;
        }

        public static FactorBE ValidarMedidaFactor(FactorBE entidad)
        {
            return factorDA.ValidarMedidaFactor(entidad);
        }

        //////////////////////////////////////////////////
        public static List<FactorBE> ListaFactor(FactorBE entidad)
        {
            List<FactorBE> lista = factorDA.ListaFactor(entidad);

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

        public static List<FactorBE> ListaFactorPaginado(FactorBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
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
                        factorDA.RegistraFactorValor(new FactorParametroBE { ID_FACTOR = entidad.ID_FACTOR, ID_DETALLE = entidad.ID_DETALLE, NOMBRE_DETALLE = "FACTOR " + entidad.UNIDAD_MEDIDA }); //add 29-03-20
                    }
                }
            }

            return entidad;
        }

        public static FactorParametroBE GetUnidadFactor(FactorParametroBE entidad)
        {
            return factorDA.GetUnidadFactor(entidad);
        }

        public static List<FactorBE> ListarFactorExcel(FactorBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return factorDA.ListarFactorExcel(entidad);
        }
        /////////////////////////////////////////////////////////77
        public static List<FactorBE> listarEnfoqueFactor(FactorBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return factorDA.ListaEnfoqueFactor(entidad);
        }

        public static List<FactorBE> GetEnfoqueFactor(FactorBE entidad)
        {
            return factorDA.ListaEnfoqueFactores(entidad);
        }

        public static FactorBE ValidarEnfoqueFactor(FactorBE entidad)
        {
            return factorDA.ValidarEnfoqueFactor(entidad);
        }

        public static FactorBE GuardarEnfoqueFactor(FactorBE entidad)
        {
            FactorBE e = new FactorBE();
            foreach (var item in entidad.listaFactor)
            {
                e = factorDA.GuardarEnfoqueFactor(item);
                if (!e.OK) break;
            }

            if (e.OK)
            {
                if (!string.IsNullOrEmpty(entidad.ID_ELIMINAR_FACTOR))
                    e = factorDA.EliminarEnfoqueFactor(entidad);
            }
            return e;
        }

        public static List<FactorBE> ListarEnfoqueFactorExcel(FactorBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return factorDA.ListarEnfoqueFactorExcel(entidad);
        }

        public static List<FactorBE> ListarEnfoqueFactorVerificar(FactorBE entidad)
        {
            return factorDA.ListaEnfoqueFactores(entidad);
        }

        public static List<FactorBE> ListarFormulaVerificar(FactorBE entidad)
        {
            return factorDA.ListarFomulasVerificar(entidad);
        }

        public static List<FactorBE> ListarFactoresVerificar(string factores)
        {
            return factorDA.ListarFactoresVerificar(factores);
        }
    }
}
