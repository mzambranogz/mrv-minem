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

        public List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_CALCULAR_INDICADOR2";
                    var p = new OracleDynamicParameters();
                    //p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    //p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pANNO", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);
                    p.Add("pKRV", entidad.KRVB);
                    p.Add("pCANTIDAD", entidad.CANTIDADB);
                    //p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
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
                    p.Add("pANNO", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULO", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLE", entidad.ID_TIPO_COMBUSTIBLEB);
                    p.Add("pKRV", entidad.KRVB);
                    p.Add("pCANTIDAD", entidad.CANTIDADB);
                    p.Add("pF_REN", entidad.FACTOR_RENDIMIENTO);
                    p.Add("pTOTAL_GEI", entidad.TOTAL_GEI_BASE);
                    p.Add("pTOTAL_GEI_INIMIT", entidad.TOTAL_GEI_INIMIT);
                    p.Add("pTOTAL_GEI_REDUCIDO", entidad.TOTAL_GEI_REDUCIDO);
                    p.Add("pID_TIPO_FUENTE", entidad.ID_TIPO_FUENTEI);
                    p.Add("pADJUNTO", entidad.ADJUNTO);
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
                    p.Add("pESTADO", entidad.FLAG_ESTADO);
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
    }
}
