using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using utilitario.minem.gob.pe;
using Oracle.DataAccess.Client;
using System.Data;
using Dapper;
using entidad.minem.gob.pe;
using System.Configuration;

namespace datos.minem.gob.pe
{
    public class SectorInstitucionDA : BaseDA
    {
        private string sPackage = "MRVMINEM.PKG_MRV_ADMIN_SISTEMA.";

        public List<SectorInstitucionBE> ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_SECTOR_INST";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SectorInstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
