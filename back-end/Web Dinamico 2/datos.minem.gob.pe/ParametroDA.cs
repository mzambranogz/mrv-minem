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
    public class ParametroDA : BaseDA
    {
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";

        public List<ParametroBE> listarParametro(int medida)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ENFOQUE_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                        if (item.ID_TIPO_CONTROL == 1)
                        {
                            item.listaDetalle = DetalleParametro(item.ID_PARAMETRO);
                        }                    
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroDetalleBE> DetalleParametro(int parametro)
        {
            List<ParametroDetalleBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_DETALLE_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", parametro);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroDetalleBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroBE> listarParametroControl()
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroBE> listarParametroEnfoque(ParametroBE entidad)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_MED_ENFOQUE_PARAM";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                    if (item.ID_TIPO_CONTROL == 1)
                    {
                        item.listaDetalle = DetalleParametro(item.ID_PARAMETRO);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroBE> listarCabeceraIndicador(ParametroBE entidad)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_CABECERA_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    int e = entidad.ID_ENFOQUE;
                    if (e == 1 || e == 2 || e == 3 || e == 4 || e == 8 || e == 9 || e == 15 || e == 23)
                        foreach (var param in Lista) {
                            if (param.ID_PARAMETRO == 9)
                                param.LEYENDA_PARAMETRO = WebConfigurationManager.AppSettings.Get("B"+e);
                            else if (param.ID_PARAMETRO == 10)
                                param.LEYENDA_PARAMETRO = WebConfigurationManager.AppSettings.Get("M" + e);
                        }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroBE> ListarParametroCabeceraExcel(ParametroBE entidad)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_PARAMETRO_EXCEL";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        //================================================================ MANTENIMIENTO
        public ParametroBE GetParametroPorId(ParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (entidad.ID_TIPO_CONTROL == 1)
                    {
                        entidad.listaDetalle = DetalleParametro(entidad.ID_PARAMETRO);
                    }

                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public List<ParametroBE> ListarParametroPaginado(ParametroBE entidad)
        {
            List<ParametroBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUSCAR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        if (item.ID_TIPO_CONTROL == 1)
                        {
                            item.listaDetalle = DetalleParametro(item.ID_PARAMETRO);
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

        public List<ParametroBE> ListarParametroExcel(ParametroBE entidad)
        {
            List<ParametroBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        if (item.ID_TIPO_CONTROL == 1)
                        {
                            item.listaDetalle = DetalleParametro(item.ID_PARAMETRO);
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

        public ParametroBE EliminarDetalle(ParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ESTADO_PARAM_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pID_ELIMINAR_DETALLE", entidad.ID_DELETE_DETALLE);
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

        public ParametroBE RegistrarParametro(ParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pNOMBRE_PARAMETRO", entidad.NOMBRE_PARAMETRO);
                    p.Add("pID_TIPO_CONTROL", entidad.ID_TIPO_CONTROL);
                    p.Add("pID_TIPO_DATO", entidad.ID_TIPO_DATO);
                    p.Add("pDESCRIPCION_PARAMETRO", entidad.DESCRIPCION_PARAMETRO);
                    p.Add("pCOMBINACION_UNIDAD", entidad.COMBINACION_UNIDAD);
                    p.Add("pLEYENDA_PARAMETRO", entidad.LEYENDA_PARAMETRO);
                    p.Add("pDESCRIPCION_METODOLOGIA", entidad.DESCRIPCION_METODOLOGIA);
                    p.Add("pPROCEDIMIENTO", entidad.PROCEDIMIENTO);
                    p.Add("pCONTROL_CALIDAD", entidad.CONTROL_CALIDAD);
                    p.Add("pASEGURAMIENTO_CALIDAD", entidad.ASEGURAMIENTO_CALIDAD);
                    p.Add("pPROPOSITO", entidad.PROPOSITO);
                    p.Add("pFRECUENCIA", entidad.FRECUENCIA);
                    p.Add("pEDITABLE", entidad.EDITABLE);
                    p.Add("pVERIFICABLE", entidad.VERIFICABLE);
                    p.Add("pV_DECIMAL", entidad.V_DECIMAL); //add 30-09-20
                    p.Add("pR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var COD = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    int codigo = Convert.ToInt32(COD);

                    if (entidad.ID_TIPO_CONTROL == 1)
                    {
                        foreach (var item in entidad.listaDetalle)
                        {
                            int parametro = 0;
                            if (entidad.ID_PARAMETRO == 0)
                            {
                                parametro = codigo;
                            }
                            else
                            {
                                parametro = entidad.ID_PARAMETRO;
                            }
                            if (!ParametroDetalle(new ParametroDetalleBE { ID_PARAMETRO = parametro, ID_DETALLE = item.ID_DETALLE, NOMBRE_DETALLE = item.NOMBRE_DETALLE }).OK)
                            {
                                entidad.OK = false;
                                break;
                            }
                        }
                    }

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

        public ParametroDetalleBE ParametroDetalle(ParametroDetalleBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_PARAM_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pID_DETALLE", entidad.ID_DETALLE);
                    p.Add("pNOMBRE_DETALLE", entidad.NOMBRE_DETALLE);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                entidad.OK = false;
                Log.Error(ex);
            }

            return entidad;
        }

        public ParametroBE EliminarParametro(ParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public ParametroBE FiltrarParametro(ParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_FILTRAR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("PI_DETALLE", entidad.ID_DETALLE);
                    p.Add("PO_RF", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

    }
}
