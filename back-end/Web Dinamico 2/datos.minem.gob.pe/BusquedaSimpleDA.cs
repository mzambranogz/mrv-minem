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
    public class BusquedaSimpleDA : BaseDA
    {
        public string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_REPORTES.";

        //Busqueda Simple Publico
        public List<IniciativaBE> ListarBusqSimplePublic(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PUB";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        //Busqueda Simple Privado Administrado
        public List<IniciativaBE> ListarBusqSimplePrivado(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PRI_USU";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pIDUSUARIO", entidad.IDUSUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        //Busqueda Simple Privado especial
        public List<IniciativaBE> ListarBusqSimplePrivadoEspe(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PRI_ESP";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pIDUSUARIO", entidad.IDUSUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarBusqSimplePrivadoMi(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PRI_AMIN";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pIDUSUARIO", entidad.IDUSUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarBusqSimplePrivadoEvaMRV(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PRI_EMRV";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pIDUSUARIO", entidad.IDUSUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<IniciativaBE> ListarBusqSimplePrivadoVerVis(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_SIMP_PRI_PUBL";
                    var p = new OracleDynamicParameters();

                    p.Add("pBUSCAR", entidad.BUSCAR);
                    p.Add("pIDUSUARIO", entidad.IDUSUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                foreach (var item in Lista)
                {
                    item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }
    }
}
