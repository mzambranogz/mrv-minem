using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using utilitario.minem.gob.pe;
using Dapper;
using Oracle.DataAccess.Client;
using System.Data;
using System.Web.Configuration;
using MRVMinem.Datos.DataBaseHelpers;

namespace datos.minem.gob.pe
{
    public class EnfoqueDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        public string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";

        public List<EnfoqueBE> ListarEnfoquePaginado(EnfoqueBE entidad)
        {
            List<EnfoqueBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUSCAR_ENFOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<EnfoqueBE> ListarEnfoqueExcel(EnfoqueBE entidad)
        {
            List<EnfoqueBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_ENFOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public EnfoqueBE GetEnfoquePorId(EnfoqueBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_ENFOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public EnfoqueBE RegistrarEnfoque(EnfoqueBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_ENFOQUE";
                    var parametros = new OracleParameter[3];
                    parametros[0] = new OracleParameter("pDESCRIPCION", entidad.DESCRIPCION);
                    parametros[1] = new OracleParameter("pID_MEDMIT", entidad.ID_MEDMIT);
                    parametros[2] = new OracleParameter("pID_ENFOQUE", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[2].Value.ToString());
                    entidad.ID_ENFOQUE = cod;
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

        public EnfoqueBE ActualizarEnfoque(EnfoqueBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ENFOQUE";
                    var parametros = new OracleParameter[3];
                    parametros[0] = new OracleParameter("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    parametros[1] = new OracleParameter("pDESCRIPCION", entidad.DESCRIPCION);
                    parametros[2] = new OracleParameter("pID_MEDMIT", entidad.ID_MEDMIT);
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

        public EnfoqueBE EliminarEnfoque(EnfoqueBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_ENFOQUE";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_ENFOQUE", entidad.ID_ENFOQUE);
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

        public List<EnfoqueBE> listarEnfoqueMedida(int medida)
        {
            List<EnfoqueBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ENFOQUE_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<EnfoqueBE> listarEnfoqueIniciativa(int iniciativa)
        {
            List<EnfoqueBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ENFOQUE_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", iniciativa);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public EnfoqueBE ValidarMedidaEnfoque(EnfoqueBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_VALIDAR_MED_ENFOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
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

        ////////////////////////////////////////////////
        public List<EnfoqueBE> ListarEnfoque()
        {
            List<EnfoqueBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_ENFOQUE_F";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnfoqueBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
