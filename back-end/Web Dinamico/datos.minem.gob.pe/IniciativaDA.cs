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
    public class IniciativaDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_INICIATIVA_MITIGACION.";
        private string sPackage2 = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES.";

        public List<IniciativaBE> ListaIniciativaPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_PUBLICO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaIniciativaEspecialista(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_ESPEC";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaIniciativaGeneral(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_GENERAL";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaIniciativaUsuario(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public IniciativaBE RegistrarIniciativaMitigacion(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_INICIATIVA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pNOMBRE_INICIATIVA", entidad.NOMBRE_INICIATIVA);
                    p.Add("pDESC_INICIATIVA", entidad.DESC_INICIATIVA);
                    p.Add("pINVERSION_INICIATIVA", entidad.INVERSION_INICIATIVA);
                    p.Add("pID_MONEDA", entidad.ID_MONEDA);
                    p.Add("pFECHA_IMPLE_INICIATIVA", entidad.FECHA_IMPLE_INICIATIVA);
                    p.Add("pFECHA_FIN_INICIATIVA", entidad.FECHA_FIN_INICIATIVA);
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
                    p.Add("pPRIVACIDAD_INVERSION", entidad.PRIVACIDAD_INVERSION);
                    p.Add("pID_ESTADO", entidad.ID_ESTADO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
                entidad.OK = true;

                if (Lista.Count > 0)
                {
                    foreach (var item in Lista)
                    {
                        entidad.ID_INICIATIVA = item.ID_INICIATIVA;
                    }
                }

            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.extra = ex.Message;
            }

            return entidad;
        }

        public IniciativaBE ActualizarIniciativaMitigacion(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_INICIATIVA_MITIGACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pNOMBRE_INICIATIVA", entidad.NOMBRE_INICIATIVA);
                    p.Add("pDESC_INICIATIVA", entidad.DESC_INICIATIVA);
                    p.Add("pINVERSION_INICIATIVA", entidad.INVERSION_INICIATIVA);
                    p.Add("pID_MONEDA", entidad.ID_MONEDA);
                    p.Add("pFECHA_IMPLE_INICIATIVA", entidad.FECHA_IMPLE_INICIATIVA);
                    p.Add("pFECHA_FIN_INICIATIVA", entidad.FECHA_FIN_INICIATIVA);
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
                    p.Add("pPRIVACIDAD_INVERSION", entidad.PRIVACIDAD_INVERSION);
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

        public IniciativaBE ProcesoIniciativaEnergetico(string energetico, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            var energ = energetico.Split(',');
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_INICIATIVA_ENERGETICO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_ENERG", energ[0]);
                    p.Add("pFLAG_ESTADO", energ[1]);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.ENERGETICO = energ[0];
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

        public IniciativaBE ActualizarIniciativaEnergetico(string energetico, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_INICIATIVA_ENERGETICO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_ENERG", energetico);
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

        public IniciativaBE ProcesoIniciativaGei(string gei, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            var vgei = gei.Split(',');
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_INICIATIVA_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_GEI", vgei[0]);
                    p.Add("pFLAG_ESTADO", vgei[1]);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.GEI = vgei[0];
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

        public IniciativaBE ActualizarIniciativaGei(string gei, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_INICIATIVA_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_GEI", gei);
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

        public IniciativaBE ProcesoIniciativaUbicacion(string ubi, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            var ubicacion = ubi.Split(',');
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_PRC_INICIATIVA_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_UBICACION", ubicacion[0]);
                    p.Add("pFLAG_ESTADO", ubicacion[1]);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.UBICACION = ubicacion[0];
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

        public IniciativaBE ActualizarIniciativaUbicacion(string ubi, int id_iniciativa)
        {
            IniciativaBE entidad = new IniciativaBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_INICIATIVA_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", id_iniciativa);
                    p.Add("pID_UBICACION", ubi);
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

        public List<UbicacionBE> ListarUbicacionIniciativa(IniciativaBE entidad)
        {
            List<UbicacionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CARGA_UBICACION";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UbicacionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<GasEfectoInvernaderoBE> ListarGeiIniciativa(IniciativaBE entidad)
        {
            List<GasEfectoInvernaderoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CARGA_GEI";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<GasEfectoInvernaderoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<EnergeticoBE> ListarEnergeticoIniciativa(IniciativaBE entidad)
        {
            List<EnergeticoBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CARGA_ENERGETICO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<EnergeticoBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListarIniciativaAvance(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CARGA_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        item.FECHA_EDITAR = item.FECHA_IMPLE_INICIATIVA.ToString("yyyy-MM-dd");
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        item.FECHA_EDITAR_FIN = item.FECHA_FIN_INICIATIVA.ToString("yyyy-MM-dd");
                        SustentoIniciativaBE pValor = new SustentoIniciativaBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ID_INICIATIVA_SUSTENTATORIO = 0 };
                        item.ListaSustentos = ListaSustentoIniciativa(pValor);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<SustentoIniciativaBE> ListaSustentoIniciativa(SustentoIniciativaBE entidad)
        {
            List<SustentoIniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_DETALLE_INDICADORES." + "USP_SEL_INICIATIVA_SUSTENTO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_INICIATIVA_SUSTENTATORIO", entidad.ID_INICIATIVA_SUSTENTATORIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SustentoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        if (string.IsNullOrEmpty(item.ADJUNTO_BASE)) item.ADJUNTO_BASE = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;

        }

        public IniciativaBE AprobarIniciativaMitigacion(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_APROBAR_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_TIPO_INICIATIVA", entidad.ID_TIPO_INICIATIVA);
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

        public IniciativaBE ObservacionIniciativaMitigacion(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBSERVACION_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pDESCRIPCION", entidad.DESCRIPCION);
                    p.Add("pID_ESTADO_NOTIFICACION",entidad.ID_ESTADO);
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

        public List<IniciativaBE> ListaIniciativaEvaluar(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_EVALUAR";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> MostrarSeguimiento(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_REPORTES." + "USP_SEL_SEGUIMIENTO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_DERIVACION.ToString("dd/MM/yyyy");
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListaObservado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_OBSERVADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaAprobado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_APROBADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaRevisado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_REVISADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaEvaluado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_EVALUADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaVerificado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_VERIFICADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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

        public List<IniciativaBE> ListaTodo(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_TODO";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_DERIVACION.ToString("dd/MM/yyyy");
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListaIniciativaVerificar(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_VERIFICAR";
                    var p = new OracleDynamicParameters();
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
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


        /////////////////////////////////////////////////////////////////EXCEL
        public List<IniciativaBE> ListaExcelIniciativaUsuario(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_USU";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
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

        public List<IniciativaBE> ListaExcelIniciativaEspecialista(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_ESP";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaAdministrador(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_ADM";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaEvaluador(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_EVA";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaVerificador(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_VRF";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaObservado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_OBSERVADO";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaAprobado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_APROBADO";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaRevisado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_REVISADO";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaEvaluado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_EVALUADO";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaVerificado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_VERIFICADO";
                    var p = new OracleDynamicParameters();
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

        public List<IniciativaBE> ListaExcelIniciativaTodo(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_EXCEL_INI_TODO";
                    var p = new OracleDynamicParameters();
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

        /////////////////////////////////////////////
        public IniciativaBE IniciativaMitigacionDatos(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CARGA_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        item.FECHA_EDITAR = item.FECHA_IMPLE_INICIATIVA.ToString("yyyy-MM-dd");
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        item.FECHA_EDITAR_FIN = item.FECHA_FIN_INICIATIVA.ToString("yyyy-MM-dd");
                        SustentoIniciativaBE pValor = new SustentoIniciativaBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ID_INICIATIVA_SUSTENTATORIO = 0 };
                        item.ListaSustentos = ListaSustentoIniciativa(pValor);
                        entidad = item;
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad;
        }

        public List<IniciativaBE> ListaExcelSimple(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQUEDA_SIMPLE";
                    if (entidad.ID_ESTADO == 1)
                    {
                        if (entidad.ID_ROL == 1)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_USU";
                            entidad.CONDICION = "(INI.ID_USUARIO = " + entidad.ID_USUARIO + ")";
                        }
                        else if (entidad.ID_ROL == 2)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_ESP";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3))";
                        }
                        else if (entidad.ID_ROL == 3)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_ADM";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4)";
                        }
                        else if (entidad.ID_ROL == 4)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_EVA";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6)";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5)";
                        }
                        else if (entidad.ID_ROL == 5)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_VRF";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8))";
                        }
                    }
                    else if (entidad.ID_ESTADO == 2)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_OBSE";                        
                        entidad.CONDICION = "(INI.ID_ESTADO = 2)";
                    }
                    else if (entidad.ID_ESTADO == 3)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_APRO";                        
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4))";
                    }
                    else if (entidad.ID_ESTADO == 4)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_REVI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8))";
                    }
                    else if (entidad.ID_ESTADO == 5)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_EVAL";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6)";
                    }
                    else if (entidad.ID_ESTADO == 6)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_VRFI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7)";
                    }
                    else if (entidad.ID_ESTADO == 7)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_TODO";
                        entidad.CONDICION = "NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)";
                    }

                    //if (entidad.ID_ROL == 1)
                    //{
                    //    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    //}
                    p.Add("pBuscar", entidad.buscar);
                    //p.Add("pRegistros", entidad.cantidad_registros);
                    //p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListaBusquedaSimplePrivado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQUEDA_SIMPLE";
                    if (entidad.ID_ESTADO == 1)
                    {
                        if (entidad.ID_ROL == 1)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_USU";
                            entidad.CONDICION = "(INI.ID_USUARIO = "+ entidad.ID_USUARIO +")";
                        }
                        else if (entidad.ID_ROL == 2)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_ESP";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3))";
                        }
                        else if (entidad.ID_ROL == 3)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_ADM";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4)";
                        }
                        else if (entidad.ID_ROL == 4)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_EVA";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6)";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5)";
                        }
                        else if (entidad.ID_ROL == 5)
                        {
                            //sp += "USP_SEL_BUSQUEDA_SPL_PRI_VRF";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8))";
                        }
                    }
                    else if (entidad.ID_ESTADO == 2)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_OBSE";                        
                        entidad.CONDICION = "(INI.ID_ESTADO = 2)";
                    }
                    else if (entidad.ID_ESTADO == 3)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_APRO";                        
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4))";
                    }
                    else if (entidad.ID_ESTADO == 4)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_REVI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8))";
                    }
                    else if (entidad.ID_ESTADO == 5)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_EVAL";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6)";
                    }
                    else if (entidad.ID_ESTADO == 6)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_VRFI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7)";
                    }
                    else if (entidad.ID_ESTADO == 7)
                    {
                        //sp += "USP_SEL_BUSQUEDA_SPL_PRI_TODO";
                        entidad.CONDICION = "NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)";
                    }
                    
                    //if (entidad.ID_ROL == 1)
                    //{
                    //    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    //}
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }



        public List<IniciativaBE> ListaExcelAvanzado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQ_AVANZ_EXCEL";

                    if (entidad.ID_ESTADO == 1)
                    {
                        if (entidad.ID_ROL == 1)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_USU";
                            entidad.CONDICION = "(INI.ID_USUARIO = " + entidad.ID_USUARIO + ")";
                        }
                        else if (entidad.ID_ROL == 2)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_ESP";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3))";
                        }
                        else if (entidad.ID_ROL == 3)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_ADM";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4)";
                        }
                        else if (entidad.ID_ROL == 4)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_EVA";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6)";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5)";
                        }
                        else if (entidad.ID_ROL == 5)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_VRF";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8))";
                        }
                    }
                    else if (entidad.ID_ESTADO == 2)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_OBSE";
                        entidad.CONDICION = "(INI.ID_ESTADO = 2)";
                    }
                    else if (entidad.ID_ESTADO == 3)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_APRO";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4))";
                    }
                    else if (entidad.ID_ESTADO == 4)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_REVI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8))";
                    }
                    else if (entidad.ID_ESTADO == 5)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_EVAL";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6)";
                    }
                    else if (entidad.ID_ESTADO == 6)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_VRFI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7)";
                    }
                    else if (entidad.ID_ESTADO == 7)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_TODO";
                        entidad.CONDICION = "NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)";
                    }

                    //var p = new OracleDynamicParameters();
                    //if (entidad.ID_ROL == 1)
                    //{
                    //    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    //}
                    p.Add("pMedida", entidad.medida_b);
                    p.Add("pAnio", entidad.anio_b);
                    p.Add("pSector", entidad.sector_b);
                    p.Add("pGei", entidad.gei_b);
                    p.Add("pEnerg", entidad.energ_b);
                    entidad.FECHA = entidad.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    p.Add("pFECHA_EJECUCION", entidad.FECHA);
                    entidad.FECHA_FIN = entidad.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                    p.Add("pFECHA_FINALIZACION", entidad.FECHA_FIN);
                    p.Add("pNOMBRE_INICIATIVA", entidad.NOMBRE_INICIATIVA);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListaBusquedaAvanzadoPrivado(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQUEDA_AVANZADA";

                    if (entidad.ID_ESTADO == 1)
                    {
                        if (entidad.ID_ROL == 1)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_USU";
                            entidad.CONDICION = "(INI.ID_USUARIO = " + entidad.ID_USUARIO + ")";
                        }
                        else if (entidad.ID_ROL == 2)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_ESP";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 4))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (1,5) AND INI.ID_ETAPA IN (1,3))";
                        }
                        else if (entidad.ID_ROL == 3)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_ADM";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4) OR (INI.ID_ESTADO IN (2) AND INI.ID_ETAPA IN (5,8))";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 4)";
                        }
                        else if (entidad.ID_ROL == 4)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_EVA";
                            //entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5) OR (INI.ID_ESTADO = 2 AND INI.ID_ETAPA = 6)";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA = 5)";
                        }
                        else if (entidad.ID_ROL == 5)
                        {
                            //sp += "USP_SEL_BUSQUEDA_AVA_PRI_VRF";
                            entidad.CONDICION = "(INI.ID_ESTADO IN (3,5) AND INI.ID_ETAPA IN (6,8))";
                        }
                    }
                    else if (entidad.ID_ESTADO == 2)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_OBSE";
                        entidad.CONDICION = "(INI.ID_ESTADO = 2)";
                    }
                    else if (entidad.ID_ESTADO == 3)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_APRO";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (2,4))";
                    }
                    else if (entidad.ID_ESTADO == 4)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_REVI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA IN (5,8))";
                    }
                    else if (entidad.ID_ESTADO == 5)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_EVAL";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 6)";
                    }
                    else if (entidad.ID_ESTADO == 6)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_VRFI";
                        entidad.CONDICION = "(INI.ID_ESTADO = 3 AND INI.ID_ETAPA = 7)";
                    }
                    else if (entidad.ID_ESTADO == 7)
                    {
                        //sp += "USP_SEL_BUSQUEDA_AVA_PRI_TODO";
                        entidad.CONDICION = "NOT (INI.ID_ESTADO = 0 AND INI.ID_ETAPA = 1)";
                    }                    

                    //var p = new OracleDynamicParameters();
                    //if (entidad.ID_ROL == 1)
                    //{
                    //    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    //}
                    p.Add("pMedida", entidad.medida_b);
                    p.Add("pAnio", entidad.anio_b);
                    p.Add("pSector", entidad.sector_b);
                    p.Add("pGei", entidad.gei_b);
                    p.Add("pEnerg", entidad.energ_b);
                    entidad.FECHA = entidad.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                    p.Add("pFECHA_EJECUCION", entidad.FECHA);
                    entidad.FECHA_FIN = entidad.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                    p.Add("pFECHA_FINALIZACION", entidad.FECHA_FIN);
                    p.Add("pNOMBRE_INICIATIVA", entidad.NOMBRE_INICIATIVA);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);                    
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<SustentoIniciativaBE> ListarArchivosGuardados(IniciativaBE entidad)
        {
            List<SustentoIniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_ARCHIVO_GUARDADO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<SustentoIniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }


        public List<IniciativaBE> ListaBusquedaSimplePublico(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQUEDA_SIMPLE_PUB";
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ListaBusquedaAvanzadaPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage;
                    var p = new OracleDynamicParameters();
                    sp += "USP_SEL_BUSQUEDA_AVANZADA_PUB";
                    p.Add("pMedida", entidad.medida_b);
                    p.Add("pAnio", entidad.anio_b);
                    p.Add("pSector", entidad.sector_b);
                    p.Add("pGei", entidad.gei_b);
                    p.Add("pEnerg", entidad.energ_b);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pCondicion", entidad.CONDICION);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    foreach (var item in Lista)
                    {
                        item.FECHA = item.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA == "01/01/0001") item.FECHA = "--/--/----";
                        item.FECHA_FIN = item.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
                        if (item.FECHA_FIN == "01/01/0001") item.FECHA_FIN = "--/--/----";
                        if (string.IsNullOrEmpty(item.NOMBRE_INICIATIVA)) item.NOMBRE_INICIATIVA = "";
                        if (string.IsNullOrEmpty(item.NOMBRE_MEDMIT)) item.NOMBRE_MEDMIT = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public List<IniciativaBE> ValidarDetalleIndicador(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_VALIDAR_DETALLE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public IniciativaBE ValidarDetalleArchivo(IniciativaBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_VALIDAR_ARCHIVO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
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

        public List<IniciativaBE> ListarCodIndicador(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_LISTA_COD_INDICADOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_ENFOQUE", entidad.ID_ENFOQUE);
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

        public int getIdEnfoqueMenor(IniciativaBE entidad)
        {
            int id_enque = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage2 + "USP_SEL_GET_ENFOQUE_MENOR";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_INICIATIVA", entidad.ID_INICIATIVA);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var id = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    id_enque = Convert.ToInt32(id);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return id_enque;
        }

    }

}
