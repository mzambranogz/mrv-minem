using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using utilitario.minem.gob.pe;

namespace MRVMinem.Areas.Administrado.Repositorio
{
    public class Reporte
    {
        ReportViewer rvReporte = new ReportViewer();

        private void ConfigurarReporte()
        {
            rvReporte.ProcessingMode = ProcessingMode.Local;
        }

        public Boolean GenerarPDFReporte(EscenarioRptBE entidad, String NombrePDF)
        {
            try
            {
                Warning[] warnings;
                string[] streamids;
                string mimeType;
                string encoding;
                string filenameExtension;
                string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();

                ConfigurarReporte();
                //List<ReportParameter> parameters = new List<ReportParameter>();
                
                rvReporte.LocalReport.ReportPath = string.Format("{0}\\EscenarioRpt.rdlc", rutatarget);
                List<EscenarioRptBE> lbeReporte = EscenarioRptLN.ListaEscenariosRpt(entidad);

                ReportDataSource dataSource = new ReportDataSource("DsEscenario", lbeReporte);
                //parameters.Add(new ReportParameter("PI_PUNTAJEMIN", Puntaje));

                rvReporte.LocalReport.DataSources.Clear();
                rvReporte.LocalReport.DataSources.Add(dataSource);
                
                //rvReporte.LocalReport.SetParameters(parameters);
                byte[] bytes = rvReporte.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);

                using (FileStream fs = new FileStream(NombrePDF, FileMode.Create))
                {
                    fs.Write(bytes, 0, bytes.Length);
                    fs.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                return false;
            }
        }
    }
}