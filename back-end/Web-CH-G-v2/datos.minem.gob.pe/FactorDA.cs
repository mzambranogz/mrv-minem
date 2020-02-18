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
    public class FactorDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_PARAMETROS.";

        public List<FactorParametroBE> ListaFactorParametro(FactorBE entidad)
        {
            List<FactorParametroBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public List<FactorParametroDataBE> ListaFactorParametroData(FactorBE entidad, string SQL)
        {
            List<FactorParametroDataBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR_VALOR";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PI_SQL_WHERE", SQL);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorParametroDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public List<FactorBE> ListaFactor(FactorBE entidad)
        {
            List<FactorBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public FactorBE RegistraFactor(FactorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_MNT_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PI_NOMBRE", entidad.NOMBRE_FACTOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }

                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.message = ex.Message;
            }
            return entidad;
        }


        public FactorParametroBE RegistraParametroFactor(FactorParametroBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_MNT_FACTOR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    p.Add("PI_ID_DETALLE", entidad.ID_DETALLE);
                    p.Add("PI_ID_TIPO_CONTROL", entidad.ID_TIPO_CONTROL);
                    p.Add("PI_ID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("PI_NOMBRE_DETALLE", entidad.NOMBRE_DETALLE);
                    p.Add("PI_ORDEN", entidad.ORDEN);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }

                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.message = ex.Message;
            }

            return entidad;
        }

        public FactorBE EliminaParametroFactor(FactorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_DEL_FACTOR_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("PI_ID_FACTOR", entidad.ID_FACTOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }

                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.message = ex.Message;
            }

            return entidad;
        }

    }
}
