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
    public class NamaDA : BaseDA
    {
        private string sPackage = "usermrv.PKG_MRV_MANTENIMIENTO.";

        public List<NamaBE> ListarNama(NamaBE entidad)
        {
            List<NamaBE> Lista = null;

            try        //Consultar//
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_NAMA";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<NamaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<NamaBE> ObtenerNama(NamaBE entidad)    //Editar//
        {
            List<NamaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_NAMA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_NAMA", entidad.ID_NAMA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<NamaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public NamaBE editarNama(NamaBE entidad)    //Editar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_NAMA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_NAMA", entidad.ID_NAMA);
                    p.Add("pDESCRIPCION_NAMA", entidad.DESCRIPCION_NAMA);
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


        public NamaBE eliminarNama(NamaBE entidad)    //Eliminar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_NAMA";  /*cambiar */
                    var p = new OracleDynamicParameters();
                    p.Add("pID_NAMA", entidad.ID_NAMA);
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
