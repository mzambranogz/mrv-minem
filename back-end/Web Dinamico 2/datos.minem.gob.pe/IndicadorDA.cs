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
    public class IndicadorDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";
        public string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_REPORTES.";
        public string sPackage3 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_INICIATIVA_MITIGACION.";
        public string sPackage4 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        public List<IndicadorBE> ListarTablaIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ENFOQUE_TABLA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IndicadorBE> ListarDetalleIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_DET_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                    if (item.INICIO_OPERACIONES.ToString("yyyy-MM-dd") != "0001-01-01") item.FECHA = item.INICIO_OPERACIONES.ToString("yyyy-MM-dd");
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        //public List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        //{
        //    List<IndicadorBE> Lista = null;

        //    try
        //    {
        //        using (IDbConnection db = new OracleConnection(CadenaConexion))
        //        {
        //            int enfoque = entidad.ID_ENFOQUE;
        //            string sp = "";
        //            var p = new OracleDynamicParameters();
        //            p.Add("pANNO", entidad.ANNOB);
        //            p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
        //            p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);

        //            if (enfoque == 1 || enfoque == 2)
        //            {
        //                if (enfoque == 1)
        //                {
        //                    sp = sPackage + "USP_PRC_CALCULAR_INDICADOR2";
        //                }
        //                else if (enfoque == 2)
        //                {
        //                    sp = sPackage + "USP_PRC_CAL_VEH_HIB";
        //                    p.Add("pKRV_COMBUSTIBLE", entidad.KRV_COMBUSTIBLE);                            
        //                }
        //                p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
        //                p.Add("pKRV", entidad.KRVB);
        //                p.Add("pCANTIDAD", entidad.CANTIDADB);
        //            }                    
        //            else if (enfoque == 3)
        //            {
        //                sp = sPackage + "USP_PRC_CAL_VEH_CON";
        //                p.Add("pCONSUMO_ELECTRICIDAD",entidad.CONSUMO_ELECTRICIDAD);
        //            }
        //            else if (enfoque == 4)
        //            {
        //                sp = sPackage + "USP_PRC_CAL_VEH_HIB_CON";
        //                p.Add("pCONSUMO_ELECTRICIDAD", entidad.CONSUMO_ELECTRICIDAD);
        //                p.Add("pCONSUMO_COMBUSTIBLE", entidad.CONSUMO_COMBUSTIBLE);
        //            }       

        //            p.Add("pID_TIPO_FUENTE", entidad.ID_TIPO_FUENTEI);                                        
        //            p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
        //            Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(ex);
        //    }

        //    return Lista;
        //}

        public List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_CALCULAR_INDICADOR2";
                    var p = new OracleDynamicParameters();
                    p.Add("pANNO", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);
                    p.Add("pKRV", entidad.KRVB);
                    p.Add("pCANTIDAD", entidad.CANTIDADB);
                    p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
                    p.Add("pID_TIPO_FUENTE", entidad.ID_TIPO_FUENTEI);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        /////////////// TEMPORAL CALCULAR INDICADOR

        public IndicadorBE EliminarIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ESTADO_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IndicadorBE EvaluarIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_EVALUAR_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IndicadorBE RegistrarDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pFECHA_INICIO", entidad.INICIO_OPERACIONES);
                    p.Add("pANNO", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);
                    p.Add("pKRV", entidad.KRVB);
                    p.Add("pKRV_COMBUSTIBLE", entidad.KRV_COMBUSTIBLE); // add
                    p.Add("pCONSUMO_ELECTRICIDAD", entidad.CONSUMO_ELECTRICIDAD); //add
                    p.Add("pCONSUMO_COMBUSTIBLE", entidad.CONSUMO_COMBUSTIBLE); //add
                    p.Add("pPLACA", entidad.PLACA);
                    p.Add("pCANTIDAD", entidad.CANTIDADB);
                    p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
                    p.Add("pTOTAL_GEI", entidad.TOTAL_GEI_BASE);
                    p.Add("pTOTAL_GEI_INIMIT", entidad.TOTAL_GEI_INIMIT);
                    p.Add("pTOTAL_GEI_REDUCIDO", entidad.TOTAL_GEI_REDUCIDO);
                    p.Add("pID_TIPO_FUENTE", entidad.ID_TIPO_FUENTEI);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pADJUNTO", entidad.ADJUNTO);
                    p.Add("pADJUNTO_BASE", entidad.ADJUNTO_BASE);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return entidad;
        }

        /*=============== add 16-02-20 ================*/
        public IndicadorDataBE RegistrarDetalleIndicadorData(IndicadorDataBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_INDICADOR_DATA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pVALOR", entidad.VALOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return entidad;
        }

        public IndicadorBE AvanceDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_AVANCE_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IniciativaBE RegistrarAvanceDetalleIndicador(IniciativaBE entidad) //add 30-01-20
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_AVANCE_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ESTADO", entidad.ID_ESTADO);
                    p.Add("pID_TIPO_INGRESO", entidad.ID_TIPO_INGRESO);
                    p.Add("pTOTAL_GEI", entidad.TOTAL_GEI);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public List<IndicadorBE> ListarDetalleIndicadorRevision(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTAR_DET_INDIC_REV";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public IndicadorBE AprobarDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_APROBAR_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
                    p.Add("pID_DESCRIPCION_GEI", entidad.DESCRIPCION_GEI);
                    p.Add("pID_DESCRIPCION_ENERG", entidad.DESCRIPCION_ENERG);
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

        public IndicadorBE ObservacionDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBSERVACION_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
                    p.Add("pID_ESTADO_NOTIFICACION", entidad.ID_ESTADO);
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

        public IndicadorBE CorregirDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_CORREGIR_DETALLE_F";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ESTADO", entidad.ID_ESTADO);
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

        public IndicadorBE CorregirAvanceDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_CORREGIR_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ESTADO", entidad.ID_ESTADO);
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

        public IndicadorBE AprobarAdminIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_APROBAR_INI_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ETAPA", entidad.ESTADO_ACTOR); //estado 5: Evaluador | estado 6: Verificador -> ETAPAS
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
                    p.Add("pDESCRIPCION_GEI", entidad.DESCRIPCION_GEI);
                    p.Add("pDESCRIPCION_ENERG", entidad.DESCRIPCION_ENERG);
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

        public IndicadorBE EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_EVALUAR_INI_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ADMINISTRADOR", entidad.ID_ADMINISTRADOR);
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

        public IndicadorBE VerificarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_VERIFICAR_INI_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_USUARIO_DESTINO", entidad.ID_USUARIO_DESTINO);
                    p.Add("pBLOCKCHAIN", entidad.BLOCKCHAIN);
                    p.Add("pNOMBRES", entidad.NOMBRES);
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

        public SustentoIniciativaBE RegistrarSustentoIniciativa(SustentoIniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_INICIATIVA_SUSTENTO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA_SUSTENTATORIO", entidad.ID_INICIATIVA_SUSTENTATORIO);
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pADJUNTO", entidad.ADJUNTO);
                    p.Add("pADJUNTO_BASE", entidad.ADJUNTO_BASE);
                    p.Add("pESTADO", entidad.FLAG_ESTADO);
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

        public IndicadorBE GetDetalleIndicador(IndicadorBE entidad)
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_GET_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public IniciativaBE RegistrarEnvioDetalle(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_REGISTRO_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_TIPO_INGRESO", entidad.ID_TIPO_INGRESO);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pTOTAL_GEI", entidad.TOTAL_GEI);
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
                    p.Add("pPRIVACIDAD_INVERSION", entidad.PRIVACIDAD_INVERSION);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IniciativaBE EliminarIndicadores(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    //string sp = sPackage + "USP_UPD_ELIMINAR_DETALLE";
                    string sp = sPackage + "USP_UPD_ELIMINAR_IND_DATA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_INDICADOR_DELETE", entidad.ID_INDICADOR_DELETE);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IniciativaBE EliminarIndicadoresFile(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_ELIMINAR_IND_FILE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INDICADOR_ELIMINAR", entidad.ID_INDICADOR_ELIMINAR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
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

        public IniciativaBE CorregirDetalleIndicador2(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_CORREGIR_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pTOTAL_GEI", entidad.TOTAL_GEI);
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
                    p.Add("pPRIVACIDAD_INVERSION", entidad.PRIVACIDAD_INVERSION);
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

        /////////////////////////////////////////
        public List<IndicadorBE> ListarDetalleIndicadorDatos(IniciativaBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTAR_DET_INDIC_REV";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                    if (item.INICIO_OPERACIONES.ToString("dd/MM/yyyy") != "01/01/0001") item.FECHA = item.INICIO_OPERACIONES.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public IndicadorBE ObservacionAdminDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBSERVACION_ADMIN_DET";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
                    p.Add("pID_ESTADO_NOTIFICACION", entidad.ID_ESTADO);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
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

        public IndicadorBE ObservacionEvaluarDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBSERVACION_EVA_DET";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
                    p.Add("pID_ESTADO_NOTIFICACION", entidad.ID_ESTADO);
                    p.Add("pID_ADMINISTRADOR", entidad.ID_ADMINISTRADOR);
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

        public IndicadorBE ObservacionVerificarDetalleIndicador(IndicadorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBSERVACION_VRF_DET";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
                    p.Add("pID_ESTADO_NOTIFICACION", entidad.ID_ESTADO);
                    p.Add("pID_USUARIO_DESTINO", entidad.ID_USUARIO_DESTINO);
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

        public int DetalleIndicadorEnfoque(int iniciativa)
        {
            int enfoque = 0;    
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INDICADOR_ENFOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", iniciativa);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ENFOQUE = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    enfoque = Convert.ToInt32(ENFOQUE);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return enfoque;
        }

        public int getIdIndicador(IniciativaBE entidad)
        {
            int id = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_ID_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ID = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    id = Convert.ToInt32(ID);
                }
                entidad.OK = true;                
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return id;
        }

        public List<IndicadorDataBE> ListarDatosIndicadorData(IndicadorDataBE entidad)
        {
            List<IndicadorDataBE> listaDataE = new List<IndicadorDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_INDICADORES";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pID_ORDERBY", entidad.order_by);
                    p.Add("pID_ORDEN", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var lista = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in lista)
                    {
                        listaDataE.Add(ListarIndicadorParametros(item));
                    }
                    foreach(var arc in listaDataE)
                    {
                        arc.ArchivoSustento = new IndicadorArchivoDA().GetArchivoDetalleIndicador(new IndicadorArchivoBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ID_INDICADOR = arc.ID_INDICADOR });
                    }
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return listaDataE;
        }

        public IndicadorDataBE ListarIndicadorParametros(IndicadorDataBE entidad)
        {
            IndicadorDataBE obj = new IndicadorDataBE();
            List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INDICADOR_PARAMETROS";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    listaP = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    obj.ID_INDICADOR = entidad.ID_INDICADOR;
                    obj.listaInd = listaP;
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return obj;
        }

        ///////////////////////////////////////////////////////////////////////////////
        public List<FactorBE> ListaEnfoqueFactores(int id_enfoque)
        {
            List<FactorBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage4 + "USP_SEL_LISTA_ENFOQUE_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ENFOQUE", id_enfoque);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public List<IndicadorDataBE> ListarDatosTablaDinamica(IndicadorDataBE entidad)
        {
            List<IndicadorDataBE> listaDataE = new List<IndicadorDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_INI_ENFOOQUE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    listaDataE = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    List<int> factores = new List<int>();
                    foreach (var item in listaDataE)
                    {
                        item.listaInd = ListarDatosDinamico(item);
                        item.listaParam = listarDetalleCabeceraDinamico(item);
                        item.listaFactor = ListaEnfoqueFactores(item.ID_ENFOQUE);
                        foreach (var itemF in item.listaFactor)
                        {
                            int id_factor = (from num in factores where num == itemF.ID_FACTOR select num).Count();
                            if (id_factor == 0)
                                factores.Add(itemF.ID_FACTOR);
                        }
                        item.id_factores = factores;
                    }
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return listaDataE;
        }

        public List<IndicadorDataBE> ListarDatosDinamico(IndicadorDataBE entidad)
        {
            List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_DATOS";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    listaP = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in listaP)
                {
                    item.listaInd = ListarDetalleDatosDinamico(item);
                    item.ArchivoSustento = new IndicadorArchivoDA().GetArchivoDetalleIndicador(new IndicadorArchivoBE() { ID_INDICADOR = item.ID_INDICADOR, ID_INICIATIVA = entidad.ID_INICIATIVA });
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return listaP;
        }

        public List<IndicadorDataBE> ListarDetalleDatosDinamico(IndicadorDataBE entidad)
        {
            List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_DET_DATOS";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    listaP = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.extra = ex.Message;
                entidad.OK = false;
            }

            return listaP;
        }

        public List<ParametroBE> listarDetalleCabeceraDinamico(IndicadorDataBE entidad)
        {
            List<ParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_GET_CABECERA";
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

        public List<IndicadorBE> DashboardResultado(IndicadorBE entidad)
        {
            List<IndicadorBE> listaD = new List<IndicadorBE>();            
            try
            {
                IndicadorBE indicador = new IndicadorBE();

                var listaSector = ListarSectorDash();
                var listaAnno = ListarAnnoDash();

                IndicadorBE Datos = ListarDatosMedida(entidad.ID_MEDMIT);
                indicador.TOTAL_INSTITUCION = Datos.TOTAL_INSTITUCION;
                indicador.TOTAL_REGION = Datos.TOTAL_REGION;
                indicador.TOTAL_GEI_REDUCIDO = Datos.TOTAL_GEI_REDUCIDO;
                IniciativaBE ini = ListarIdMedida(entidad.ID_MEDMIT);
                indicador.NOMBRE_MEDMIT = ini.NOMBRE_MEDMIT;
                indicador.DESCRIPCION = ini.DESCRIPCION_MEDMIT;

                List<IniciativaBE> listaGeiMedida = ListarDatosSectorMedida(entidad.ID_MEDMIT);
                List<IniciativaBE> listaGeiS = new List<IniciativaBE>();
                foreach (var item in listaSector)
                {
                    IniciativaBE indE = new IniciativaBE();
                    indE.DESCRIPCION = item.DESCRIPCION;
                    indE.TOTAL_GEI = 0;
                    listaGeiS.Add(indE);
                }

                foreach (var item in listaGeiS)
                {
                    foreach (var itemG in listaGeiMedida)
                    {
                        if (item.DESCRIPCION == itemG.DESCRIPCION)
                        {
                            item.TOTAL_GEI = itemG.TOTAL_GEI;
                        }
                    }
                }
                indicador.listaGei = listaGeiS;

                List<IniciativaBE> listaAnnoSec = new List<IniciativaBE>();
                List<IniciativaBE> listaS = new List<IniciativaBE>();                
                listaS = ListarDatosAnnoGei(entidad.ID_MEDMIT, DateTime.Now.Year);
                foreach (var itemA in listaAnno)
                {
                    List<IniciativaBE> listaA = new List<IniciativaBE>();
                    IniciativaBE indE = new IniciativaBE();
                    foreach (var item in listaSector)
                    {
                        IniciativaBE indA = new IniciativaBE();
                        indA.ANNO = itemA.DESCRIPCION;
                        indA.ID_SECTOR_INST = item.ID_SECTOR_INST;
                        indA.SECTOR = item.DESCRIPCION;
                        indA.TOTAL_GEI = 0;
                        listaA.Add(indA);
                    }
                    indE.listaGeiAnno = listaA;
                    listaAnnoSec.Add(indE);      
                }

                foreach (var item in listaS)
                {
                    foreach (var itemA in listaAnnoSec)
                    {
                        foreach (var itemAD in itemA.listaGeiAnno)
                        {
                            if (item.ANNO == itemAD.ANNO && item.ID_SECTOR_INST == itemAD.ID_SECTOR_INST)
                            {
                                itemAD.TOTAL_GEI = item.TOTAL_GEI;
                            }
                        }                        
                    }
                }
                indicador.listaAnnoSec = listaAnnoSec;

                List<IniciativaBE> listaCant = new List<IniciativaBE>();
                List<IniciativaBE> listaC = ListarDatosSectorIniciativa(entidad.ID_MEDMIT);
                foreach (var item in listaSector)
                {
                    IniciativaBE indE = new IniciativaBE();
                    indE.DESCRIPCION = item.DESCRIPCION;
                    indE.CANTIDAD = 0;
                    listaCant.Add(indE);
                }

                foreach (var item in listaCant)
                {
                    foreach (var itemG in listaC)
                    {
                        if (item.DESCRIPCION == itemG.DESCRIPCION)
                        {
                            item.CANTIDAD = itemG.CANTIDAD;
                        }
                    }
                }
                indicador.listaCant = listaCant;

                listaD.Add(indicador);

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return listaD;
        }

        public List<SectorInstitucionBE> ListarSectorDash()
        {
            List<SectorInstitucionBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_SECTORES";
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

        public List<AnnoBE> ListarAnnoDash()
        {
            List<AnnoBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ANNO";
                    var p = new OracleDynamicParameters();
                    p.Add("pANNO", DateTime.Now.Year);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<AnnoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarDatosSectorMedida(int medida)
        {
            //decimal total = 0;
            List<IniciativaBE> lista = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_MED_SECTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    //p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    //var GEI_TOTAL = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    //total = Convert.ToDecimal(GEI_TOTAL);
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public decimal ListarDatosSectorAnno(IniciativaBE entidad)
        {
            decimal total = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_INI_MED_ANNO_SEC";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    p.Add("pANNO", entidad.ANNO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var GEI_TOTAL = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    total = Convert.ToDecimal(GEI_TOTAL);
                    entidad.TOTAL_GEI = total;
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return total;
        }

        public List<IniciativaBE> ListarDatosSectorIniciativa(int medida)
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_INI_SECTOR";
                    var p = new OracleDynamicParameters();
                    //p.Add("pID_SECTOR_INST", entidad.ID_SECTOR_INST);
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public int TotalInstitucion(IndicadorBE entidad)
        {
            int cantidad = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_CANT_INSTITUCION_MED";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var TOTAL_INSTITUCION = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    cantidad = Convert.ToInt32(TOTAL_INSTITUCION);
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return cantidad;
        }

        public int TotalRegion(IndicadorBE entidad)
        {
            int cantidad = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_CANT_REGION_MED";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var TOTAL_REGION = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    cantidad = Convert.ToInt32(TOTAL_REGION);
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return cantidad;
        }

        public decimal TotalGei(IndicadorBE entidad)
        {
            decimal cantidad = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_TOTAL_GEI_MED";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var TOTAL = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    cantidad = Convert.ToDecimal(TOTAL);
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return cantidad;
        }

        public List<IniciativaBE> ListarDatosAnnoGei(int medida, int anno)
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_INI_MED_ANNO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pANNO", anno);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public IndicadorBE ListarDatosMedida(int medida)
        {
            IndicadorBE entidad = new IndicadorBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_TOTALES_MED";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<IndicadorBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public IniciativaBE ListarIdMedida(int medida)
        {
            IniciativaBE entidad = new IniciativaBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_MEDIDA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public List<IniciativaBE> MostrarGeiporAnio(IniciativaBE medida)
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            List<IniciativaBE> listaMed = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_MOSTRAR_GEI_MED";
                    var p = new OracleDynamicParameters();
                    p.Add("pANNO", medida.ANNO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                listaMed = ListaMedidaMitigacion();
                foreach(var item in listaMed)
                {
                    foreach(var itemD in lista)
                    {
                        if (itemD.ID_MEDMIT == item.ID_MEDMIT)
                        {
                            item.TOTAL_GEI = itemD.TOTAL_GEI;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return listaMed;
        }

        public List<IniciativaBE> ListaMedidaMitigacion()
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage4 + "USP_SEL_LISTA_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public IniciativaBE deleteRegDetalle(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_DELETE_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
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


    }
}
