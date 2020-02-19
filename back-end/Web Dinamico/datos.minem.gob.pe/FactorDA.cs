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
        public string sPackage3 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO.";
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_PARAMETROS.";
        public List<FactorBE> listarFactores()
        {
            List<FactorBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_FACTORES";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

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

        public List<FactorBE> ListaMedidaFactor()
        {
            List<FactorBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_ALL_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<FactorBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach(var item in lista)
                    {
                        item.listaFactor = ListaMedidaFactores(item);
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return lista;
        }

        public List<FactorBE> ListaMedidaFactores(FactorBE entidad)
        {
            List<FactorBE> lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_LISTA_MEDIDA_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
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

        public List<FactorParametroBE> listarCabeceraFactor(FactorParametroBE entidad)
        {
            List<FactorParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_CABECERA_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_FACTOR", entidad.ID_FACTOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<FactorParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<FactorParametroBE> listarCuerpoFactor(FactorParametroBE entidad)
        {
            List<FactorParametroBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_CUERPO_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_FACTOR", entidad.ID_FACTOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<FactorParametroBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }

                foreach (var item in Lista)
                {
                    if (item.ID_TIPO_CONTROL == 1)
                    {
                        item.listaDetalle = DetalleFactorParametro(item.ID_PARAMETRO);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<ParametroDetalleBE> DetalleFactorParametro(int parametro)
        {
            List<ParametroDetalleBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_DETALLE_FACT_PARAMETRO";
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

        public List<FactorParametroDataBE> ListarDatosFactorData(FactorParametroDataBE entidad)
        {
            List<FactorParametroDataBE> listaData = new List<FactorParametroDataBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_GET_FACTOR_DATA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_FACTOR", entidad.ID_FACTOR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var lista = db.Query<FactorParametroDataBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in lista)
                    {
                        FactorParametroDataBE f = new FactorParametroDataBE();
                        List<ParametroBE> listaD = new List<ParametroBE>();
                        var param = item.ID_PARAMETRO.Split('|');
                        var valores = item.VALOR.Split('|');
                        for(int j = 0; j < valores.Length; j++)
                        {
                            var obj = FactorParametro(Convert.ToInt32(param[j]));
                            obj.VALOR = Convert.ToString(valores[j]);
                            obj.ID_PARAMETRO = Convert.ToInt32(param[j]);
                            obj.ID_DETALLE = item.ID_DETALLE;
                            listaD.Add(obj);
                        }
                        f.ID_DETALLE = item.ID_DETALLE;
                        f.FACTOR = item.FACTOR;
                        f.listaParametro = listaD;
                        listaData.Add(f);
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

            return listaData;
        }

        public ParametroBE FactorParametro(int parametro)
        {
            ParametroBE obj = new ParametroBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_SEL_ID_PARAMETRO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_PARAMETRO", parametro);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    obj = db.Query<ParametroBE>(sp, p, commandType: CommandType.StoredProcedure).First();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return obj;
        }

        public FactorBE GuardarFactores(FactorParametroDataBE entidad)
        {
            FactorBE f = new FactorBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_PRC_FACTOR_DATA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_FACTOR", entidad.ID_FACTOR);
                    p.Add("pID_DETALLE", entidad.ID_DETALLE);
                    p.Add("pID_PARAMETRO", entidad.ID_PARAMETRO);
                    p.Add("pVALOR", entidad.VALOR);
                    p.Add("pFACTOR", entidad.FACTOR);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    f.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                f.OK = false;
            }

            return f;
        }

        public FactorBE EliminarFactores(FactorBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage3 + "USP_UPD_ELIMINAR_FACTOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_FACTOR", entidad.ID_FACTOR);
                    p.Add("pID_ELIMINAR_FACTOR", entidad.ID_ELIMINAR_FACTOR);
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
