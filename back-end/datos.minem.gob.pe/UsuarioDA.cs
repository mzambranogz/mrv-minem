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


    }
}
