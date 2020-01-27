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
    public class NotificacionDA : BaseDA
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
                    //p.Add("pIdUsuario", 0);
                    p.Add("pIdUsuario", Idusuario);
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

        public List<NotificacionBE> ListarNotificacion(NotificacionBE entidad)
        {
            List<NotificacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_USUARIO_NOTIFICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<NotificacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                //foreach (var item in Lista)
                //{
                //    item.FECHA = item.FECHA_REGISTRO.ToString("dd/MM/yyyy");
                //}
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public NotificacionBE GetNotificacion(NotificacionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_NOTIFICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdNotificacion", entidad.ID_NOTIFICACION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<NotificacionBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }

            return entidad;
        }

        public NotificacionBE RegistraVistoNotificacion(NotificacionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_VISTO_NOTIFICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdNotificacion", entidad.ID_NOTIFICACION);
                    p.Add("pIdIniciativa", entidad.ID_INICIATIVA);
                    p.Add("pIdUsuarioVisto", entidad.ID_USUARIO_VISTO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

    }
}
