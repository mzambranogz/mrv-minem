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
    }
}
