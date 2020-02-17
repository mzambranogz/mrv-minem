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
    public class FactorDA : BaseDA
    {
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_PARAMETROS.";
        public List<FactorBE> listarFactores()
        {
            List<FactorBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_FACTORES";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<FactorParametroBE> ListaFactorParametro(FactorBE entidad)
        {
            List<FactorParametroBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public List<FactorParametroDataBE> ListaFactorParametroData(FactorBE entidad, string SQL)
        {
            List<FactorParametroDataBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR_VALOR";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PI_SQL_WHERE", SQL);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorParametroDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

    }
}
