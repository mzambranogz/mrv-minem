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
    public class MedidaMitigacionDA : BaseDA
    {
        public string sPackage = "USERMRV.PKG_MRV_INICIATIVA_MITIGACION.";
        public List<MedidaMitigacionBE> ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_MEDIDAMITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<MedidaMitigacionBE> ObtenerMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_MEDIDA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            /*foreach (var item in Lista)
            {
                entidad.OBJETIVO_MEDMIT = item.OBJETIVO_MEDMIT;
                entidad.DESCRIPCION_MEDMIT = item.DESCRIPCION_MEDMIT;
                entidad.IPSC_MEDMIT = item.IPSC_MEDMIT;
            }*/

            return Lista;
        }

    }
}
