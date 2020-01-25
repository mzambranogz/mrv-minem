using Dapper;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
    public class EscenarioRptDA : BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_REPORTES.";

        public List<EscenarioRptBE> ListaEscenariosRpt(EscenarioRptBE entidad)
        {
            List<EscenarioRptBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "SP_SEL_ESCENARIOS_RPT";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdMedMit", entidad.ID_MEDMIT);
                    p.Add("pCursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EscenarioRptBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
