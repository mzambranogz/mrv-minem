using Dapper;
using entidad.minem.gob.pe;
using MRVMinem.Datos.DataBaseHelpers;
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
    public class EscenarioDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";

        public List<EscenarioBE> ListaEscenariosPaginado(EscenarioBE entidad)
        {
            List<EscenarioBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ESCENARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar",entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EscenarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<EscenarioBE> ListarEscenarioExcel(EscenarioBE entidad)
        {
            List<EscenarioBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_ESCENARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EscenarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public EscenarioBE GetEscenarioPorId(EscenarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_ESCENARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ESCENARIO", entidad.ID_ESCENARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<EscenarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public EscenarioBE RegistrarEscenario(EscenarioBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_ESCENARIO";
                    var parametros = new OracleParameter[9];
                    parametros[0] = new OracleParameter("pID_MEDMIT", entidad.ID_MEDMIT);
                    parametros[1] = new OracleParameter("pANNO", entidad.ANNO);
                    parametros[2] = new OracleParameter("pBAU_EMISION", entidad.BAU_EMISION);
                    parametros[3] = new OracleParameter("pMIT_EMISION", entidad.MIT_EMISION);
                    parametros[4] = new OracleParameter("pREDUCCION", entidad.REDUCCION);
                    parametros[5] = new OracleParameter("pVALOR_SOFTWARE", entidad.VALOR_SOFTWARE);
                    parametros[6] = new OracleParameter("pEXPOST", entidad.EXPOST);
                    parametros[7] = new OracleParameter("pMETA_ANUAL", entidad.META_ANUAL);
                    parametros[8] = new OracleParameter("pIdEscenario", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[8].Value.ToString());
                    entidad.ID_ESCENARIO = cod;
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

        public EscenarioBE ActualizarEscenario(EscenarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ESCENARIO";
                    var parametros = new OracleParameter[9];
                    parametros[0] = new OracleParameter("pID_ESCENARIO", entidad.ID_ESCENARIO);
                    parametros[1] = new OracleParameter("pID_MEDMIT", entidad.ID_MEDMIT);
                    parametros[2] = new OracleParameter("pANNO", entidad.ANNO);
                    parametros[3] = new OracleParameter("pBAU_EMISION", entidad.BAU_EMISION);
                    parametros[4] = new OracleParameter("pMIT_EMISION", entidad.MIT_EMISION);
                    parametros[5] = new OracleParameter("pREDUCCION", entidad.REDUCCION);
                    parametros[6] = new OracleParameter("pVALOR_SOFTWARE", entidad.VALOR_SOFTWARE);
                    parametros[7] = new OracleParameter("pEXPOST", entidad.EXPOST);
                    parametros[8] = new OracleParameter("pMETA_ANUAL", entidad.META_ANUAL);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

        public EscenarioBE EliminarEscenario(EscenarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_ESCENARIO";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_ESCENARIO", entidad.ID_ESCENARIO);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

    }
}
