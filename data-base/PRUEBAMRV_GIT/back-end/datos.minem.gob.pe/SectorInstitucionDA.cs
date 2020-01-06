using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using utilitario.minem.gob.pe;
using Oracle.DataAccess.Client;
using System.Data;
using Dapper;
using entidad.minem.gob.pe;
using System.Configuration;

namespace datos.minem.gob.pe
{
   /* public class SectorInstitucionDA : BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_ADMIN_SISTEMA.";

        public List<SectorInstitucionBE> ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_SECTOR_INST";
                    var p = new OracleDynamicParameters();     /*SELECT
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SectorInstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }
    }*/



    public class SectorInstitucionDA : BaseDA
    {
        private string sPackage = "usermrv.PKG_MRV_MANTENIMIENTO.";

        public List<SectorInstitucionBE> ListarSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try        //LISTA REGISTROS//
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_SECTORINSTITUC";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SectorInstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<SectorInstitucionBE> ObtenerSectorInstitucion(SectorInstitucionBE entidad)    //Obtiene los datos //
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_SECTORINSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SectorInstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public SectorInstitucionBE editarSectorInstitucion(SectorInstitucionBE entidad)    //Editar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_SECTORINSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
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



        public SectorInstitucionBE eliminarSectorInstitucion(SectorInstitucionBE entidad)    //Eliminar//
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_SECTORINSTITUCION";  /*cambiar */
                    var p = new OracleDynamicParameters();
                    p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
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
