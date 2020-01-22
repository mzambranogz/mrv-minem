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

namespace datos.minem.gob.pe
{
    public class UsuarioDA : BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_ADMIN_SISTEMA.";

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
                    p.Add("pFLG_TERMINOS", entidad.TERMINOS);
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
        public UsuarioBE EditarUsuario(UsuarioBE entidad)
        {

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = "USERMRV.PKG_MRV_MANTENIMIENTO." + "USP_UPD_USUARIO";
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
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                entidad.OK = false;
                entidad.extra = ex.Message;
            }

            return entidad;
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
                    string sp = "USERMRV.PKG_MRV_INICIATIVA_MITIGACION." + "USP_SEL_INFORMACION_USUARIO";
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
                    string sp = "USERMRV.PKG_MRV_MANTENIMIENTO." + "USP_SEL_MANTENIMIENTO_USUARIO";
                    var p = new OracleDynamicParameters();
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
                    string sp = "USERMRV.PKG_MRV_MANTENIMIENTO." + "USP_SEL_MANTE_ID_USUARIO";
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
                    string sp = sPackage + "USP_SEL_VERIFICAR_CLAVE";
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

    }
}
