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
    public class GasEfectoInvernaderoDA : BaseDA
    {
        public string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_INICIATIVA_MITIGACION.";
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        public List<GasEfectoInvernaderoBE> ListarGEI(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<GasEfectoInvernaderoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<GasEfectoInvernaderoBE> ListarGeiPaginado(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUSCAR_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<GasEfectoInvernaderoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<GasEfectoInvernaderoBE> ListarGeiExcel(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<GasEfectoInvernaderoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public GasEfectoInvernaderoBE GetGeiPorId(GasEfectoInvernaderoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_GEI", entidad.ID_GEI);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<GasEfectoInvernaderoBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public GasEfectoInvernaderoBE RegistrarGei(GasEfectoInvernaderoBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_GEI";
                    var parametros = new OracleParameter[6];
                    parametros[0] = new OracleParameter("pDESCRIPCION", entidad.DESCRIPCION);
                    parametros[1] = new OracleParameter("pAR2", entidad.AR2);
                    parametros[2] = new OracleParameter("pAR4", entidad.AR4);
                    parametros[3] = new OracleParameter("pAR5", entidad.AR5);
                    parametros[4] = new OracleParameter("pAR6", entidad.AR6);
                    parametros[5] = new OracleParameter("pID_GEI", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[5].Value.ToString());
                    entidad.ID_GEI = cod;
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

        public GasEfectoInvernaderoBE ActualizarGei(GasEfectoInvernaderoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_GEI";
                    var parametros = new OracleParameter[6];
                    parametros[0] = new OracleParameter("pID_GEI", entidad.ID_GEI);
                    parametros[1] = new OracleParameter("pDESCRIPCION", entidad.DESCRIPCION);
                    parametros[2] = new OracleParameter("pAR2", entidad.AR2);
                    parametros[3] = new OracleParameter("pAR4", entidad.AR4);
                    parametros[4] = new OracleParameter("pAR5", entidad.AR5);
                    parametros[5] = new OracleParameter("pAR6", entidad.AR6);
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

        public GasEfectoInvernaderoBE EliminarGei(GasEfectoInvernaderoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_GEI";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_Gei", entidad.ID_GEI);
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
