using Dapper;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
    public class IniciativaDA : BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_INICIATIVA_MITIGACION.";

        public List<IniciativaBE> ListaIniciativaPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INICIATIVAS_PUBLICO";
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
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
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
                    p.Add("pPRIVACIDAD_INICIATIVA", entidad.PRIVACIDAD_INICIATIVA);
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
                    string sp = "USERMRV.PKG_MRV_REPORTES." + "USP_SEL_SEGUIMIENTO_INICIATIVA";
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

    }


}
