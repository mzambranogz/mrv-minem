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
    public class UbicacionDA : BaseDA
    {
        private string sPackage = "usermrv.PKG_MRV_MANTENIMIENTO.";

        public List<UbicacionBE> ListarUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> Lista = null;

            try        //LISTA REGISTROS//
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UbicacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<UbicacionBE> ObtenerUbicacion(UbicacionBE entidad)    //Obtiene los datos //
        {
            List<UbicacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_UBICACION", entidad.ID_UBICACION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UbicacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public UbicacionBE editarUbicacion(UbicacionBE entidad)    //Editar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_UBICACION", entidad.ID_UBICACION);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
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



        public UbicacionBE eliminarUbicacion(UbicacionBE entidad)    //Eliminar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_UBICACION";  /*cambiar */
                    var p = new OracleDynamicParameters();
                    p.Add("pID_UBICACION", entidad.ID_UBICACION);
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
