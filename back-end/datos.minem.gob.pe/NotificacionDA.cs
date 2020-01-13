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
    public class NotificacionDA: BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_NOTIFICACION.";

        public NotificacionBE ConsultaNotificaciones(int Idusuario, int IdRol)
        {
            NotificacionBE entidad = new NotificacionBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_NUM_NOFIFICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdRol", IdRol);
                    p.Add("pIdUsuario", 0);
                    //p.Add("pIdUsuario", Idusuario);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<NotificacionBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
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
