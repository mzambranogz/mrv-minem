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
    public class BlockChainDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_BLOCKCHAIN.";

        public BlockChainBE GeneraBlockChain(BlockChainBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_BLOCK_CHAIN";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_INICIATIVA", entidad.buscar);
                    p.Add("PI_USUARIO", entidad.cantidad_registros);
                    p.Add("PI_IP", entidad.pagina);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<BlockChainBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
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
