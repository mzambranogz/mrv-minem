using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using utilitario.minem.gob.pe;
using Dapper;
using Oracle.DataAccess.Client;
using System.Data;
using System.Web.Configuration;

namespace datos.minem.gob.pe
{
    public class MedidaMitigacionDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_INICIATIVA_MITIGACION.";
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        public List<MedidaMitigacionBE> ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_MEDIDAMITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        if (item.ID_NAMA == 1)
                        {
                            item.COLOR_NAMA = "amarilla";
                        }
                        else if (item.ID_NAMA == 2)
                        {
                            item.COLOR_NAMA = "roja";
                        }
                        else if (item.ID_NAMA == 3)
                        {
                            item.COLOR_NAMA = "verde";
                        }
                        else if (item.ID_NAMA == 4)
                        {
                            item.COLOR_NAMA = "azul";
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<MedidaMitigacionBE> ObtenerMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_MEDIDA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            /*foreach (var item in Lista)
            {
                entidad.OBJETIVO_MEDMIT = item.OBJETIVO_MEDMIT;
                entidad.DESCRIPCION_MEDMIT = item.DESCRIPCION_MEDMIT;
                entidad.IPSC_MEDMIT = item.IPSC_MEDMIT;
            }*/

            return Lista;
        }

        public MedidaMitigacionBE getMedidaMitigacion(int medida)
        {
            MedidaMitigacionBE medida_mitigacion = new MedidaMitigacionBE();

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_MEDIDA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var med = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (med != null)
                    {
                        medida_mitigacion = med;
                    }
                }
                medida_mitigacion.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                medida_mitigacion.OK = false;
            }

            return medida_mitigacion;
        }

        public List<MedidaMitigacionBE> ListarMedidaMitigacionAsociado(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_MEDMIT_ASOCIADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO",entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<MedidaMitigacionBE> ListaMedidaMitigacionMantenimiento(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_LISTA_MEDMIT_MANT";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public MedidaMitigacionBE GuardarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_INS_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pNOMBRE_MEDMIT", entidad.NOMBRE_MEDMIT);
                    p.Add("pNUMERO_MEDMIT", entidad.NUMERO_MEDMIT);
                    p.Add("pDESCRIPCION_MEDMIT", entidad.DESCRIPCION_MEDMIT);
                    p.Add("pID_NAMA", entidad.ID_NAMA);
                    p.Add("pOBJETIVO_MEDMIT", entidad.OBJETIVO_MEDMIT);
                    p.Add("pID_IPCC", entidad.ID_IPCC);
                    p.Add("pADJUNTO", entidad.ADJUNTO);
                    p.Add("pADJUNTO_BASE", entidad.ADJUNTO_BASE);
                    p.Add("pMETODOLOGIA_MEDMIT", entidad.METODOLOGIA_MEDMIT); //ADD
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public List<MedidaMitigacionBE> BuscarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_GET_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<MedidaMitigacionBE> ListaMedidaMitigacionExcel(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_EXCEL_MEDIDAMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedidaMitigacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public MedidaMitigacionBE EliminarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_DEL_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
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
