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
                    p.Add("PI_ID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("PI_USUARIO", entidad.ID_USUARIO);
                    p.Add("PI_IP", entidad.IP_PC);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<BlockChainBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }
            return entidad;
        }

        public List<BlockChainBE> ListaBlockChain(BlockChainBE entidad)
        {
            List<BlockChainBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BLOCKCHAIN";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_BLOCKCHAIN", entidad.ID_BLOCKCHAIN);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<BlockChainBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }
            return lista;
        }

        public List<BlockChainBE> NombrePDFBlockchain(BlockChainBE entidad)
        {
            List<BlockChainBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_BLOCKCHAIN_PDF";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_BLOCKCHAIN", entidad.ID_BLOCKCHAIN);
                    p.Add("PI_NOMBRE_PDF", entidad.NOMBRE_PDF);
                    lista = db.Query<BlockChainBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }
            return lista;
        }

        public BlockChainBE MostrarBlockchain(BlockChainBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BLOCKCHAIN_PDF";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_BLOCKCHAIN", entidad.ID_BLOCKCHAIN);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var PDF = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    entidad.NOMBRE_PDF = Convert.ToString(PDF);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }
            return entidad;
        }
    }
}
