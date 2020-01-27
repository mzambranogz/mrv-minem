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

namespace datos.minem.gob.pe
{
    public class RolOpcionesDA : BaseDA
    {
        public string sPackage = "USERMRV.PKG_MRV_ADMIN_SISTEMA.";
        public List<RolOpcionesBE> ListarRolOpciones(int id)
        {
            List<RolOpcionesBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_USUARIO_ROL";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", id);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<RolOpcionesBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
