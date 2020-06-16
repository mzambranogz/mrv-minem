using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System.Data;
using Dapper;
using utilitario.minem.gob.pe;
using MRVMinem.Datos.DataBaseHelpers;
using Oracle.DataAccess.Types;
using System.Web.Configuration;

namespace datos.minem.gob.pe
{
    public class UsuarioDA : BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_ADMIN_SISTEMA.";

        public int VerificarEmail(UsuarioBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_VERIFICAR_EMAIL";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pEMAIL_USUARIO", entidad.EMAIL_USUARIO);
                    parametros[1] = new OracleParameter("pVerificar", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[1].Value.ToString());
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return cod;
        }
        public UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pNOMBRES_USUARIO", entidad.NOMBRES_USUARIO);
                    p.Add("pAPELLIDOS_USUARIO", entidad.APELLIDOS_USUARIO);
                    p.Add("pID_INSTITUCION", entidad.ID_INSTITUCION);
                    p.Add("pPASSWORD_USUARIO", entidad.PASSWORD_USUARIO);
                    p.Add("pEMAIL_USUARIO", entidad.EMAIL_USUARIO);
                    p.Add("pTELEFONO_USUARIO", entidad.TELEFONO_USUARIO);
                    p.Add("pANEXO_USUARIO", entidad.ANEXO_USUARIO);
                    p.Add("pCELULAR_USUARIO", entidad.CELULAR_USUARIO);
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pID_ESTADO_USUARIO", entidad.ID_ESTADO_USUARIO);
                    p.Add("pFLG_TERMINOS", entidad.TERMINOS);
                    p.Add("pADJUNTO",entidad.ADJUNTO);
                    p.Add("pADJUNTO_BASE", entidad.ADJUNTO_BASE);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var CODIGO = db.ExecuteScalar(sp, p, commandType: CommandType.StoredProcedure);
                    entidad.ID_USUARIO = Convert.ToInt32(CODIGO);

                    if (entidad.ID_ROL == 3)
                    {
                        DeshabilitarUsuario(new UsuarioBE { ID_USUARIO = Convert.ToInt32(entidad.USUARIO_REGISTRO)});
                    }
                }
                entidad.OK = true;
                string[] medidas;
                if (!string.IsNullOrEmpty(entidad.MEDIDAS))
                {
                    using (IDbConnection db = new OracleConnection(CadenaConexion))
                    {
                        string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_DEL_USUARIO_MEDMIT";
                        var p = new OracleDynamicParameters();
                        p.Add("pID_USUARIO", entidad.ID_USUARIO);
                        p.Add("pID_USUREG", entidad.USUARIO_REGISTRO);
                        p.Add("pIP", entidad.IP_PC);
                        db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    }

                    medidas = entidad.MEDIDAS.Split('|');
                    for (int i = 0; i < medidas.Length; i++)
                    {
                        UsuarioMedMitBE entidad2 = new UsuarioMedMitBE() { ID_USUARIO = entidad.ID_USUARIO, ID_MEDMIT = int.Parse(medidas[i]), USUARIO_REGISTRO = entidad.USUARIO_REGISTRO, IP_PC = entidad.IP_PC };
                        entidad2 = RegistraUsuarioMedidaMitigacion(entidad2);
                        if (!entidad2.OK)
                        {
                            entidad.OK = false;
                            entidad.extra = entidad2.extra;
                            break;
                        }
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
        public UsuarioBE EditarUsuario(UsuarioBE entidad)
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_UPD_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pNOMBRES_USUARIO", entidad.NOMBRES_USUARIO);
                    p.Add("pAPELLIDOS_USUARIO", entidad.APELLIDOS_USUARIO);
                    //p.Add("pID_INSTITUCION", entidad.ID_INSTITUCION);
                    //p.Add("pPASSWORD_USUARIO", entidad.PASSWORD_USUARIO);
                    p.Add("pEMAIL_USUARIO", entidad.EMAIL_USUARIO);
                    p.Add("pTELEFONO_USUARIO", entidad.TELEFONO_USUARIO);
                    p.Add("pANEXO_USUARIO", entidad.ANEXO_USUARIO);
                    p.Add("pCELULAR_USUARIO", entidad.CELULAR_USUARIO);
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pID_ESTADO_USUARIO", entidad.ID_ESTADO_USUARIO);
                    db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                }
                entidad.OK = true;
                string[] medidas;
                if (!string.IsNullOrEmpty(entidad.MEDIDAS))
                {
                    using (IDbConnection db = new OracleConnection(CadenaConexion))
                    {
                        string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_DEL_USUARIO_MEDMIT";
                        var p = new OracleDynamicParameters();
                        p.Add("pID_USUARIO", entidad.ID_USUARIO);
                        p.Add("pID_USUREG", entidad.USUARIO_REGISTRO);
                        p.Add("pIP", entidad.IP_PC);
                        db.Execute(sp, p, commandType: CommandType.StoredProcedure);
                    }

                    medidas = entidad.MEDIDAS.Split('|');
                    for (int i = 0; i < medidas.Length; i++)
                    {
                        UsuarioMedMitBE entidad2 = new UsuarioMedMitBE() { ID_USUARIO = entidad.ID_USUARIO, ID_MEDMIT = int.Parse(medidas[i]), USUARIO_REGISTRO = entidad.USUARIO_REGISTRO, IP_PC = entidad.IP_PC };
                        entidad2 = RegistraUsuarioMedidaMitigacion(entidad2);
                        if (!entidad2.OK)
                        {
                            entidad.OK = false;
                            entidad.extra = entidad2.extra;
                            break;
                        }
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

        public UsuarioMedMitBE RegistraUsuarioMedidaMitigacion(UsuarioMedMitBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_MNT_USUARIO_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pID_MEDMIT", entidad.ID_MEDMIT);
                    p.Add("pID_USUREG", entidad.USUARIO_REGISTRO);
                    p.Add("pIP", entidad.IP_PC);
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


        public List<UsuarioMedMitBE> ListaUsuarioMedidaMitigacion(UsuarioMedMitBE entidad)
        {
            List<UsuarioMedMitBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_SEL_USUARIO_MEDMIT";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioMedMitBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public UsuarioBE ObtenerPassword(UsuarioBE entidad)
        {
            List<UsuarioBE> Lista = null;
            UsuarioBE usu = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_PASSWORD";
                    var p = new OracleDynamicParameters();
                    p.Add("pUsuarioLogin", entidad.USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();

                    if (Lista.Count > 0)
                    {
                        foreach (var item in Lista)
                        {
                            usu.PASSWORD_USUARIO = item.PASSWORD_USUARIO;
                            usu.ID_USUARIO = item.ID_USUARIO;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return usu;
        }
        public bool VerificarEstadoUsuario(UsuarioBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_VERIFICAR_ESTADO";
                    var parametros = new OracleParameter[2];
                    parametros[0] = new OracleParameter("pID_USUARIO", entidad.ID_USUARIO);
                    parametros[1] = new OracleParameter("pVerificar", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[1].Value.ToString());
                }
                entidad.OK = true;
                if (cod == 1)
                {
                    entidad.OK = false;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return entidad.OK;
        }
        public List<UsuarioBE> ObtenerInformacionUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_INICIATIVA_MITIGACION." + "USP_SEL_INFORMACION_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }
        public List<UsuarioBE> ListaMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_SEL_MANTENIMIENTO_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }
        public List<UsuarioBE> SeleccionarMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_SEL_MANTE_ID_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public UsuarioBE validarConfirmarCorreo(UsuarioBE entidad)
        {
            UsuarioBE usuario = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_VALIDAR_CORREO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    usuario = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return usuario;
        }

        public UsuarioBE VerificarClave(UsuarioBE entidad)
        {
            UsuarioBE usuario = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_CLAVE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    usuario = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                entidad.OK = true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }

            return usuario;
        }

        public UsuarioBE CambiarClave(UsuarioBE entidad)
        {
            //UsuarioBE usuario = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_CAMBIAR_CLAVE";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
                    p.Add("pNUEVO_PASSWORD", entidad.NUEVO_PASSWORD_USUARIO);
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

        public UsuarioBE obtenerUsuario(UsuarioBE entidad)
        {
            //UsuarioBE usuario = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBTENER_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pEMAIL_USUARIO", entidad.EMAIL_USUARIO);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    entidad = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
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

        public UsuarioBE obtenerUsuarioId(int cod)
        {
            UsuarioBE entidad = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_OBTENER_USUARIO_ID"; //AGREGAR AL STORE CAMPOS DE USUARIO COMO INSTITUCION, SECTOR, ETC
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", cod);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ent = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    if (ent != null)
                    {
                        entidad = ent;
                    }
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

        public UsuarioBE EspecialistaMedida(int medida)
        {
            UsuarioBE entidad = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_ESPECIALISTA_MEDMIT"; //AGREGAR AL STORE CAMPOS DE USUARIO COMO INSTITUCION, SECTOR, ETC
                    var p = new OracleDynamicParameters();
                    p.Add("pID_MEDMIT", medida);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ent = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    if (ent != null)
                    {
                        entidad = ent;
                    }
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

        public UsuarioBE UsuarioAdministrador()
        {
            UsuarioBE entidad = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_USUARIO_ADMIN";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ent = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    if (ent != null)
                    {
                        entidad = ent;
                    }
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

        public UsuarioBE UsuarioEvaluador()
        {
            UsuarioBE entidad = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_USUARIO_EVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ent = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    if (ent != null)
                    {
                        entidad = ent;
                    }
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

        public UsuarioBE UsuarioIniciativa(int id)
        {
            UsuarioBE entidad = new UsuarioBE();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_USUARIO_INICIATIVA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO",id);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    var ent = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    if (ent != null)
                    {
                        entidad = ent;
                    }
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

        public List<UsuarioBE> BuscarMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> Lista = null;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_MANTENIMIENTO." + "USP_SEL_BUSCAR_USUARIO_MANT";
                    var p = new OracleDynamicParameters();
                    p.Add("pBuscar", entidad.buscar);
                    p.Add("pRegistros", entidad.cantidad_registros);
                    p.Add("pPagina", entidad.pagina);
                    p.Add("pSortColumn", entidad.order_by);
                    p.Add("pSortOrder", entidad.order_orden);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public UsuarioBE ActualizarPrimeraVisita(UsuarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_PRIMERA_VISTA";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
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

        public UsuarioBE DeshabilitarUsuario(UsuarioBE entidad)
        {
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_UPD_DESHABILITAR_USUARIO";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_USUARIO", entidad.ID_USUARIO);
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

        public List<UsuarioBE> ListarActorEnviar(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = new List<UsuarioBE>();
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_LISTA_EVA_VERF";
                    var p = new OracleDynamicParameters();
                    p.Add("pID_ROL", entidad.ID_ROL);
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    lista = db.Query<UsuarioBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                    entidad.OK = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
            }
            return lista;
        }

    }
}
