using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System.Data;
using Dapper;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
    public class UsuarioDA : BaseDA
    {
        private string sPackage = "MRVMINEM.PKG_MRV_ADMIN_SISTEMA.";

        public UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pUsuEmail", entidad.USUEMAIL);
                    p.Add("pUsuNom", entidad.USUNOM);
                    p.Add("pUsuApe", entidad.USUAPE);
                    p.Add("pUsuPass", entidad.USUPASS);
                    p.Add("pUsuTelefono", entidad.USUTELEFONO);
                    p.Add("pUsuCelular", entidad.USUCELULAR);
                    p.Add("pMaeSetIns", entidad.ID_SECTOR_INST);                    
                    p.Add("pGenmIns", entidad.ID_INSTITUCION);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.extra = ex.Message;
            }

            return entidad;
        }
    }
}
