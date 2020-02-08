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
using System.Web.Configuration;
using MRVMinem.Datos.DataBaseHelpers;

namespace datos.minem.gob.pe
{
    public class SectorInstitucionDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_ADMIN_SISTEMA.";

        public List<SectorInstitucionBE> ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_SECTOR_INST";
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

        public List<SectorInstitucionBE> ListarSectorPaginado(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_SECTORINSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<SectorInstitucionBE> ListarSectorExcel(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_SECTORINSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public SectorInstitucionBE GetSectorPorId(SectorInstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_SECTORINSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<SectorInstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public SectorInstitucionBE RegistrarSector(SectorInstitucionBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_SECTORINSTITUCION";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pDescripcion", entidad.DESCRIPCION);
                    parametros[1] = new OracleParameter("pIdSector", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[1].Value.ToString());
                    entidad.ID_SECTOR_INST = cod;
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

        public SectorInstitucionBE ActualizarSector(SectorInstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_SECTORINSTITUCION";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    parametros[1] = new OracleParameter("pDescripcion", entidad.DESCRIPCION);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

        public SectorInstitucionBE EliminarSector(SectorInstitucionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_SECTORINSTITUCION";
                    var parametros = new OracleParameter[1];
                    parametros[0] = new OracleParameter("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.extra = ex.Message;
                Log.Error(ex);
            }

            return entidad;
        }

    }
}
