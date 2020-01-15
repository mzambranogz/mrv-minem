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

namespace datos.minem.gob.pe
{
    public class IndicadorDA : BaseDA
    {
        public string sPackage = "USERMRV.PKG_MRV_DETALLE_INDICADORES.";
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
                    string sp = sPackage + "USP_PRC_CALCULAR_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INDICADOR", entidad.ID_INDICADOR);
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pANNOB", entidad.ANNOB);
                    p.Add("pID_TIPO_VEHICULOB", entidad.ID_TIPO_VEHICULOB);
                    p.Add("pID_TIPO_COMBUSTIBLEB", entidad.ID_TIPO_COMBUSTIBLEB);
                    p.Add("pKRVB", entidad.KRVB);
                    p.Add("pCANTIDADB", entidad.CANTIDADB);
                    p.Add("pANNOI", entidad.ANNOI);
                    p.Add("pID_TIPO_VEHICULOI", entidad.ID_TIPO_VEHICULOI);
                    p.Add("pID_TIPO_FUENTEI", entidad.ID_TIPO_FUENTEI);
                    p.Add("pKRVI", entidad.KRVI);
                    p.Add("pCANTIDADI", entidad.CANTIDADI);
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
    }
}
