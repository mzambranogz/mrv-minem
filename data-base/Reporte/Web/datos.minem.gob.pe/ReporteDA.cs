using Dapper;
using entidad.minem.gob.pe;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using utilitario.minem.gob.pe;

namespace datos.minem.gob.pe
{
   public class ReporteDA :BaseDA
    {
        private string sPackage = WebConfigurationManager.AppSettings.Get("UserBD") + ".PKG_MRV_REPORTES.";

        public List<MedMitRptBE> ListaMedMitRpt(MedMitRptBE entidad)
        {
            List<MedMitRptBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "SP_SEL_MEDMIT_RPT";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdMedMit", entidad.ID_MEDMIT);
                    p.Add("pCursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<MedMitRptBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return Lista;
        }



        public List<IniciativaRptBE> ListaIniciativaRpt(IniciativaRptBE entidad)
        {
            List<IniciativaRptBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "SP_SEL_INICIATIVAS_RPT";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdIniciativa", entidad.ID_INICIATIVA);
                    p.Add("pCursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<IniciativaRptBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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


        public List<InstitucionRptBE> ListaInstitucionRpt(InstitucionRptBE entidad)
        {
            List<InstitucionRptBE> Lista = null;

            try
            {
                using (IDbConnection db = new OracleConnection(CadenaConexion))
                {
                    string sp = sPackage + "SP_SEL_INSTITUCIONES_RPT";
                    var p = new OracleDynamicParameters();
                    p.Add("pIdMedMit", entidad.ID_MEDMIT);
                    p.Add("pIdSectorInst", entidad.ID_SECTOR_INST);
                    p.Add("pCursor", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);
                    Lista = db.Query<InstitucionRptBE>(sp, p, commandType: CommandType.StoredProcedure).ToList();
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
