using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class ParametroLN
    {
        private static ParametroDA parametroDA = new ParametroDA();

        public static List<ParametroBE> ListarParametro(int medida)
        {
            return parametroDA.listarParametro(medida);
        }

        public static List<ParametroBE> ListarParametroControl()
        {
            return parametroDA.listarParametroControl();
        }

        public static List<ParametroBE> ListarParametroEnfoque(ParametroBE entidad)
        {
            return parametroDA.listarParametroEnfoque(entidad);
        }

        public static List<ParametroBE> ListarCabeceraIndicador(ParametroBE entidad)
        {
            return parametroDA.listarCabeceraIndicador(entidad);
        }

        public static List<ParametroBE> ListarParametroCabeceraExcel(ParametroBE entidad)
        {
            return parametroDA.ListarParametroCabeceraExcel(entidad);
        }

        //============================================
        public static ParametroBE GetParametroPorId(ParametroBE entidad)
        {
            return parametroDA.GetParametroPorId(entidad);
        }

        public static List<ParametroBE> ListarParametroPaginado(ParametroBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return parametroDA.ListarParametroPaginado(entidad);
        }

        public static List<ParametroBE> ListarParametroExcel(ParametroBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return parametroDA.ListarParametroExcel(entidad);
        }

        public static ParametroBE RegistrarParametro(ParametroBE entidad)
        {
            if (!string.IsNullOrEmpty(entidad.ID_DELETE_DETALLE))
            {
                if (!parametroDA.EliminarDetalle(entidad).OK)
                {
                    entidad.OK = false;
                }
            }
            else
                entidad.OK = true;

            if (entidad.OK)
                entidad = parametroDA.RegistrarParametro(entidad);

            return entidad;
        }

        public static ParametroBE EliminarParametro(ParametroBE entidad)
        {
            return parametroDA.EliminarParametro(entidad);
        }

        public static List<ParametroBE> FiltrarParametro(ParametroBE entidad)
        {
            return parametroDA.FiltrarParametro(entidad);
        }

        public static ParametroBE ArmarTablaFiltro(ParametroBE entidad)
        {
            ParametroBE parametros = new ParametroBE();
            List<ParametroBE> listaP = new List<ParametroBE>();
            List<ParametroDetalleBE> listaParamBaseDet = new List<ParametroDetalleBE>();
            List<ParametroDetalleBE> listaParamFiltroDet = new List<ParametroDetalleBE>();
            List<ParametroBE> listaParamRelacion = new List<ParametroBE>();
            listaParamBaseDet = parametroDA.DetalleParametro(entidad.ID_PARAMETRO);
            listaParamFiltroDet = parametroDA.DetalleParametro(entidad.INS);
            listaParamRelacion = parametroDA.ParametroRelacion(entidad.ID_ENFOQUE, entidad.ID_PARAMETRO, entidad.INS);

            foreach (ParametroDetalleBE d in listaParamBaseDet)
            {
                ParametroBE param = new ParametroBE();
                param.ParamDetalle = d;
                param.listaDetalle = listaParamFiltroDet;
                listaP.Add(param);
            }

            parametros.ParametroDetalles = listaP;
            parametros.ParametroRelacion = listaParamRelacion;
            return parametros;
        }

        public static bool GuardarParametroRelacion(List<ParametroBE> lista)
        {
            bool seGuardo = true;
            seGuardo = parametroDA.deshabilitarRelacion(lista[0].ID_ENFOQUE, lista[0].ID_PARAMETRO, lista[0].PARAMETROS);
            foreach (ParametroBE p in lista)
            {
                if (!(seGuardo = parametroDA.GuardarParametroRelacion(p))) break;
            }
            return seGuardo;
        }
    }
}
