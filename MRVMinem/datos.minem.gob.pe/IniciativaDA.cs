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
    public class IniciativaDA: BaseDA
    {
        private string sPackage = "MRVMINEM.PKG_MRV_PUBLICO.";

        public List<IniciativaBE> ListaIniciativa(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ACCIONES_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pGenmIniciativa", entidad.P_GENM_INICIATIVA);
                    p.Add("pNombre", entidad.INICIATIVANOMBRE);
                    p.Add("pEstado", entidad.F_MAE_ESTADO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
