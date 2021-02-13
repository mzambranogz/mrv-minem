using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class ReporteLN
    {
        private static ReporteDA reporteDA = new ReporteDA();

        public static List<MedMitRptBE> ListaMedMitRpt(MedMitRptBE entidad)
        {
            return reporteDA.ListaMedMitRpt(entidad);
        }

        public static List<IniciativaRptBE> ListaIniciativaRpt(IniciativaRptBE entidad)
        {
            return reporteDA.ListaIniciativaRpt(entidad);
        }

        public static List<InstitucionRptBE> ListaInstitucionRpt(InstitucionRptBE entidad)
        {
            return reporteDA.ListaInstitucionRpt(entidad);
        }

        public static List<MedGeneralRptBE> ListaMedGeneralRpt(MedGeneralRptBE entidad)
        {
            return reporteDA.ListaMedGeneralRpt(entidad);
        }

        public static List<AuditoriaRpt> ListaAuditoriaRpt()
        {
            return reporteDA.ListaAuditoriaRpt();
        }
    }
}
