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
    public class PlazoDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";

        public List<PlazoBE> ListarPlazoPaginado(PlazoBE entidad)
        {
            List<PlazoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUSCAR_PLAZO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<PlazoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<PlazoBE> ListarPlazoExcel(PlazoBE entidad)
        {
            List<PlazoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_PLAZO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<PlazoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public PlazoBE GetPlazoPorId(PlazoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_PLAZO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PLAZO_ETAPA_ESTADO", entidad.ID_PLAZO_ETAPA_ESTADO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<PlazoBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public PlazoBE ActualizarPlazo(PlazoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_PLAZO";
                    var parametros = new OracleParameter[5];
                    parametros[0] = new OracleParameter("pID_PLAZO_ETAPA_ESTADO", entidad.ID_PLAZO_ETAPA_ESTADO);
                    parametros[1] = new OracleParameter("pETAPA", entidad.ETAPA);
                    parametros[2] = new OracleParameter("pESTADO", entidad.ESTADO);
                    parametros[3] = new OracleParameter("pDESCRIPCION", entidad.DESCRIPCION);
                    parametros[4] = new OracleParameter("pPLAZO", entidad.PLAZO);
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
