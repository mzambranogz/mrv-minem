using Dapper;
using entidad.minem.gob.pe;
using MRVMinem.Datos.DataBaseHelpers;
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

        public List<FactorBE> ListaFactorPaginado(FactorBE entidad)
        {
            List<FactorBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_FACTOR_PAGINADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("PO_CURSOR", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public FactorBE RegistraFactor(FactorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_MNT_FACTOR";

                    var parametros = new OracleParameter[3];
                    parametros[0] = new OracleParameter("PI_ID_FACTOR", entidad.ID_FACTOR);
                    parametros[1] = new OracleParameter("PI_NOMBRE", entidad.NOMBRE_FACTOR);
                    parametros[2] = new OracleParameter("PO_ID_FACTOR", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    if (entidad.ID_FACTOR == 0)
                        entidad.ID_FACTOR = int.Parse(parametros[2].Value.ToString());
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
