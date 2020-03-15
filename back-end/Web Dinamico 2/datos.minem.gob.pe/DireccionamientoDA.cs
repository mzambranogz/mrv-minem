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
    public class DireccionamientoDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DIRECCIONAMIENTO.";

        public int ValidarRuta(DireccionamientoBE entidad)
        {
            int validar = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_VALIDAR_RUTA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ETAPA", entidad.ID_ETAPA);
                    p.Add("pID_ESTADO", entidad.ID_ESTADO);
                    p.Add("pR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var NUM = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    validar = Convert.ToInt32(NUM);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return validar;
        }
    }
}
