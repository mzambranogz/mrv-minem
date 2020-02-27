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
    public class VariableDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_VARIABLES.";

        public List<VariableBE> ListaVariables(VariableBE entidad)
        {
            List<VariableBE> lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_VARIABLES";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_VARIABLE", entidad.ID_VARIABLE);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<VariableBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public decimal SumatoriaGeiReducido(int IdAnio, int IdIniciativa)
        {
            decimal sumaGEi = 0;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "SP_SEL_REDUCCION_GEI_PASADOS";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_ANIO", IdAnio);
                    p.Add("PI_ID_INICIATIVA", IdIniciativa);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    sumaGEi = db.Query<decimal>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return sumaGEi;
        }

    }
}
