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
using MRVMinem.Datos.DataBaseHelpers;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
    public class TipoIniciativaDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";

        public List<TipoIniciativaBE> ListarTipoIniciativa()
        {
            List<TipoIniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_TIPO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<TipoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<TipoIniciativaBE> ListarTipoIniciativaPaginado(TipoIniciativaBE entidad)
        {
            List<TipoIniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUSCAR_TIPO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<TipoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<TipoIniciativaBE> ListarTipoIniciativaExcel(TipoIniciativaBE entidad)
        {
            List<TipoIniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_TIPO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<TipoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public TipoIniciativaBE GetTipoIniciativaPorId(TipoIniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_TIPO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<TipoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public TipoIniciativaBE RegistrarTipoIniciativa(TipoIniciativaBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_TIPO_INICIATIVA";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pTIPO_INICIATIVA", entidad.TIPO_INICIATIVA);
                    parametros[1] = new OracleParameter("pID_TIPO_INICIATIVA", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[1].Value.ToString());
                    entidad.ID_TIPO_INICIATIVA = cod;
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

        public TipoIniciativaBE ActualizarTipoIniciativa(TipoIniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_TIPO_INICIATIVA";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
                    parametros[1] = new OracleParameter("pTIPO_INICIATIVA", entidad.TIPO_INICIATIVA);
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

        public TipoIniciativaBE EliminarTipoIniciativa(TipoIniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_TIPO_INICIATIVA";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
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
