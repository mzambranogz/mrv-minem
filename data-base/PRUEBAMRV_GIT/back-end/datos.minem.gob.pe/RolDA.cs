using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using utilitario.minem.gob.pe;
using Dapper;
using MRVMinem.Datos.DataBaseHelpers;
using System.Data;

namespace datos.minem.gob.pe
{
    public class RolDA : BaseDA
    {
        private string sPackage = "usermrv.PKG_MRV_MANTENIMIENTO.";

        public List<RolBE> ListarRol(RolBE entidad)
        {
            List<RolBE> Lista = null;

            try        //LISTA REGISTROS//
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_ROL";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<RolBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<RolBE> ObtenerRol(RolBE entidad)    //Obtiene los datos //
        {
            List<RolBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ROL";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<RolBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public RolBE editarRol(RolBE entidad)    //Editar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ROL";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pDESCRIPCION_ROL", entidad.DESCRIPCION_ROL);
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



        public RolBE eliminarRol(RolBE entidad)    //Eliminar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_ROL";  /*cambiar */
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ROL", entidad.ID_ROL);
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
