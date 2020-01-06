using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using utilitario.minem.gob.pe;
using Dapper;
using MRVMinem.Datos.DataBaseHelpers;
using System.Data;

namespace datos.minem.gob.pe
{
    public class InstitucionDA : BaseDA
    {
        private string sPackage = "USERMRV.PKG_MRV_ADMIN_SISTEMA.";

        public List<InstitucionBE> ListaInstitucion(InstitucionBE entidad)
        {
            List<InstitucionBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_SEL_INSTITUCION";
                    var p = new OracleDynamicParameters();
                    p.Add("pRefcursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<InstitucionBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }

        public int registrarInstitucion(InstitucionBE entidad)
        {
            int cod = 0;
            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "USP_INS_INSTITUCION";
                    var parametros = new OracleParameter[5];
                  
                    parametros[0] = new OracleParameter("pInsRuc", entidad.RUC_INSTITUCION);
                    parametros[1] = new OracleParameter("pInsNombre", entidad.NOMBRE_INSTITUCION);
                    parametros[2] = new OracleParameter("pInsDireccion", entidad.DIRECCION_INSTITUCION);
                    parametros[3] = new OracleParameter("pIdInstitucion", OracleDbType.Int32, ParameterDirection.Output);
                    OracleHelper.ExecuteNonQuery(CadenaConexion, CommandType.StoredProcedure, sp, parametros);
                    cod = int.Parse(parametros[4].Value.ToString());
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return cod;
        }

    }
}
