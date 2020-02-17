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
    public class ParametroDA : BaseDA
    {
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";

        public List<ParametroBE> listarParametro(int medida)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ENFOQUE_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                        if (item.ID_TIPO_CONTROL == 1)
                        {
                            item.listaDetalle = DetalleParametro(item.ID_PARAMETRO);
                        }                    
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroDetalleBE> DetalleParametro(int parametro)
        {
            List<ParametroDetalleBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_DETALLE_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", parametro);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroDetalleBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroBE> listarParametroControl()
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
