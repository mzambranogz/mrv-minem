using Dapper;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
    public class ParametroIndicadorDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        public ParametroIndicadorBE RegistrarMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_M_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_TIPO_CONTROL", entidad.Parametro.ID_TIPO_CONTROL);
                    p.Add("pID_PARAMETRO", entidad.Parametro.ID_PARAMETRO);
                    p.Add("pID_GRUPO_INDICADOR", entidad.Parametro.ID_GRUPO_INDICADOR);
                    p.Add("pID_ORDEN", entidad.Parametro.ID_ORDEN);
                    p.Add("pFORMULA", entidad.Parametro.FORMULA);
                    p.Add("pFORMULA_ARMADO", entidad.Parametro.FORMULA_ARMADO);
                    p.Add("pCOMPORTAMIENTO", entidad.Parametro.COMPORTAMIENTO);
                    p.Add("pVALOR", entidad.Parametro.VALOR_FORMULA);
                    p.Add("pINS", entidad.Parametro.INS);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }

            return entidad;
        }

        public List<ParametroIndicadorBE> ListarParametroIndicador(EnfoqueBE entidad)
        {
            List<ParametroIndicadorBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_M_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroIndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                    item.ListaParametroInd = getParametroIndicador(item);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;

        }

        public List<ParametroIndicadorBE> getParametroIndicador(ParametroIndicadorBE entidad)
        {
            List<ParametroIndicadorBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_M_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);                    
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroIndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;

        }

        public ParametroIndicadorBE EliminarMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_M_INDICADOR_DEL";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_ACTIVO", entidad.ID_ACTIVO);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }

            return entidad;
        }

        public List<ParametroIndicadorBE> ListarMedidaEnfoqueExcel(EnfoqueBE entidad)
        {
            List<ParametroIndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_MED_ENF";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroIndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.ListaParametroInd = getParametroIndicador(item);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }
    }
}
