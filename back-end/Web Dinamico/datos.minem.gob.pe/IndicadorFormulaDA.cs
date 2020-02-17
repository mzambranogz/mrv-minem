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
    public class IndicadorFormulaDA: BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_PARAMETROS.";
        public ParametroFormulaBE GetFormulaParametro(ParametroFormulaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FORMULA_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("PI_ID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("PI_ID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<ParametroFormulaBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }
    }
}
