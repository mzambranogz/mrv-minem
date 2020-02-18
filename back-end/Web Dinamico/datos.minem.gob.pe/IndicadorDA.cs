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

        public List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    int enfoque = entidad.ID_ENFOQUE;
                    string sp = "";
                    var p = new OracleDynamicParameters();
                    p.Add("pANNO", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);
                    
                    if (enfoque == 1 || enfoque == 2)
                    {
                        if (enfoque == 1)
                        {
                            sp = sPackage + "USP_PRC_CALCULAR_INDICADOR2";
                        }
                        else if (enfoque == 2)
                        {
                            sp = sPackage + "USP_PRC_CAL_VEH_HIB";
                            p.Add("pKRV_COMBUSTIBLE", entidad.KRV_COMBUSTIBLE);                            
                        }
                        p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
                        p.Add("pKRV", entidad.KRVB);
                        p.Add("pCANTIDAD", entidad.CANTIDADB);
                    }                    
                    else if (enfoque == 3)
                    {
                        sp = sPackage + "USP_PRC_CAL_VEH_CON";
                        p.Add("pCONSUMO_ELECTRICIDAD",entidad.CONSUMO_ELECTRICIDAD);
                    }
                    else if (enfoque == 4)
                    {
                        sp = sPackage + "USP_PRC_CAL_VEH_HIB_CON";
                        p.Add("pCONSUMO_ELECTRICIDAD", entidad.CONSUMO_ELECTRICIDAD);
                        p.Add("pCONSUMO_COMBUSTIBLE", entidad.CONSUMO_COMBUSTIBLE);
                    }       
                    
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
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var lista = db.Query<IndicadorDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in lista)
                    {
                        listaDataE.Add(ListarIndicadorParametros(item));
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

    }
}
