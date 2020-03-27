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
    public class IndicadorArchivoDA: BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";

        public IndicadorArchivoBE RegistrarArchivoDetalleIndicador(IndicadorArchivoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_ARCHIVO_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pADJUNTO", entidad.ADJUNTO);
                    p.Add("pADJUNTO_BASE", entidad.ADJUNTO_BASE);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return entidad;
        }

        public IndicadorArchivoBE GetArchivoDetalleIndicador(IndicadorArchivoBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ARCHIVO_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<IndicadorArchivoBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                
                //entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return entidad;
        }
    }
}
