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
    public class BusquedaAvanzadaDA : BaseDA
    {
        public string sPackage = "USERMRV.PKG_MRV_REPORTES.";

        //Busqueda Avanzada Publica
        public List<IniciativaBE> ListarBusqAvanzaPublic(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PUB";
                    var p = new OracleDynamicParameters();
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
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

        //Busqueda Avanzada Privado Usuario Administrado
        public List<IniciativaBE> ListarBusqAvanzaPrivadoUsuario(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PRI_USU";
                    var p = new OracleDynamicParameters();

                    p.Add("pID_USUARIO", entidad.IDUSUARIO);
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<IniciativaBE> ListarBusqAvanzaPrivadoEspecialista(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PRI_ESP";
                    var p = new OracleDynamicParameters();

                    p.Add("pID_USUARIO", entidad.IDUSUARIO);
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarBusqAvanzaPrivadoAdmMi(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PRI_AMIN";
                    var p = new OracleDynamicParameters();

                    p.Add("pID_USUARIO", entidad.IDUSUARIO);
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarBusqAvanzaPrivadoEvaMRV(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PRI_EMRV";
                    var p = new OracleDynamicParameters();

                    p.Add("pID_USUARIO", entidad.IDUSUARIO);
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<IniciativaBE> ListarBusqAvanzaPrivadoVerVis(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_BUS_AVAN_PRI_PUBL";
                    var p = new OracleDynamicParameters();

                    p.Add("pID_USUARIO", entidad.IDUSUARIO);
                    p.Add("pNOMBRE_MEDMIT", entidad.MENDIMITIG);
                    p.Add("pFECHA_INICIO", entidad.ANIOINICIO);
                    p.Add("pSECTOR", entidad.SECTOR);
                    p.Add("pENERGBASE", entidad.ENERGBASE);
                    p.Add("pENERGPROYEC", entidad.ENERGPROYEC);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    }
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
