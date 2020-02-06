using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using utilitario.minem.gob.pe;
using Dapper;
using MRVMinem.Datos.DataBaseHelpers;
using System.Data;
using System.Web.Configuration;

namespace datos.minem.gob.pe
{
    public class InstitucionDA : BaseDA
    {
        private string sPackage_2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_ADMIN_SISTEMA.";
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";

        public List<InstitucionBE> ListaInstitucion(InstitucionBE entidad)
        {
            List<InstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage_2 + "USP_SEL_INSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<InstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<InstitucionBE> ListaInstitucionPaginado(InstitucionBE entidad)
        {
            List<InstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<InstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public InstitucionBE GetInstitucionPorId(InstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_INSTITUCION_ID";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdInstitucion", entidad.ID_INSTITUCION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<InstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public InstitucionBE registrarInstitucion(InstitucionBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage_2 + "USP_INS_INSTITUCION";
                    var parametros = new OracleParameter[5];
                    parametros[0] = new OracleParameter("pID_SECTOR_INSTITUCION", entidad.INSTIPO);
                    parametros[1] = new OracleParameter("pRUC_INSTITUCION", entidad.INSRUC);
                    parametros[2] = new OracleParameter("pNOMBRE_INSTITUCION", entidad.INSNOMBRE);
                    parametros[3] = new OracleParameter("pDIRECCION_INSTITUCION", entidad.INSDIRECCION);
                    parametros[4] = new OracleParameter("pIdInstitucion", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[4].Value.ToString());
                    entidad.ID_INSTITUCION = cod;
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

        public InstitucionBE ActualizarInstitucion(InstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_INSTITUCION";
                    var parametros = new OracleParameter[5];
                    parametros[0] = new OracleParameter("pID_INSTITUCION", entidad.ID_INSTITUCION);
                    parametros[1] = new OracleParameter("pID_SECTOR_INSTITUCION", entidad.ID_SECTOR_INSTITUCION);
                    parametros[2] = new OracleParameter("pRUC_INSTITUCION", entidad.RUC_INSTITUCION);
                    parametros[3] = new OracleParameter("pNOMBRE_INSTITUCION", entidad.NOMBRE_INSTITUCION);
                    parametros[4] = new OracleParameter("pDIRECCION_INSTITUCION", entidad.DIRECCION_INSTITUCION);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

        public InstitucionBE EliminarInstitucion(InstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_INSTITUCION";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_INSTITUCION", entidad.ID_INSTITUCION);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                }
                entidad.OK = true;
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
