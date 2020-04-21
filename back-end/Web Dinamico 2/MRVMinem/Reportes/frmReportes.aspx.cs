using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using utilitario.minem.gob.pe;

namespace MRVMinem.Reportes
{
    public partial class frmReportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try //add trycatch
            {
                if (!Page.IsPostBack)
                {
                    if (Request.QueryString["IdReporte"] == "1")
                    {
                        ReporteIniciativa();
                    }
                    else if (Request.QueryString["IdReporte"] == "2")
                    {
                        ReporteMedidaMitigacion();
                    }

                    else if (Request.QueryString["IdReporte"] == "3")
                    {
                        ReporteEscenarios();
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
            
        }

        private void ConfigurarReporte()
        {
            rvReporte.ProcessingMode = ProcessingMode.Local;
        }


        //public JsonResult ReporteEscenario(EscenarioRptBE entidad)
        //{
        //    ResponseEntity itemRespuesta = new ResponseEntity();
        //    string Archivo = Guid.NewGuid().ToString();
        //    entidad.ID_MEDMIT = 0;
        //    string NombreRpt = WebConfigurationManager.AppSettings["RutaTemp"] + "\\" + Archivo + ".pdf";
        //    if (new Reporte().GenerarPDFReporte(entidad, NombreRpt))
        //    {
        //        itemRespuesta.success = true;
        //        itemRespuesta.extra = NombreRpt;
        //    }
        //    else
        //    {
        //        itemRespuesta.success = false;
        //        itemRespuesta.extra = "";
        //    }
        //    return Respuesta(itemRespuesta);
        //}


        private void ReporteMedidaMitigacion()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            MedMitRptBE entidad = new MedMitRptBE() { ID_MEDMIT = 0 };

            ConfigurarReporte();
            rvReporte.LocalReport.ReportPath = string.Format("{0}\\rptMedMit.rdlc", rutatarget);
            List<MedMitRptBE> lbeReporte = ReporteLN.ListaMedMitRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DtMedMit", lbeReporte);

            rvReporte.LocalReport.DataSources.Clear();
            rvReporte.LocalReport.DataSources.Add(dataSource);
            rvReporte.ServerReport.Refresh();
        }

        private void ReporteIniciativa()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            IniciativaRptBE entidad = new IniciativaRptBE() { ID_INICIATIVA = 0 };

            ConfigurarReporte();
            rvReporte.LocalReport.ReportPath = string.Format("{0}\\rptIniciativa.rdlc", rutatarget);
            List<IniciativaRptBE> lbeReporte = ReporteLN.ListaIniciativaRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DtIniciativa", lbeReporte);

            rvReporte.LocalReport.DataSources.Clear();
            rvReporte.LocalReport.DataSources.Add(dataSource);
            rvReporte.ServerReport.Refresh();

        }

        /*private void ReporteInstitucion()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            InstitucionRptBE entidad = new InstitucionRptBE() { ID_INICIATIVA = 0 };

            ConfigurarReporte();
            rvReporte.LocalReport.ReportPath = string.Format("{0}\\rptInstitucion.rdlc", rutatarget);
            List<InstitucionRptBE> lbeReporte = ReporteLN.ListaInstitucionRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DtInstitucion", lbeReporte);

            rvReporte.LocalReport.DataSources.Clear();
            rvReporte.LocalReport.DataSources.Add(dataSource);
            rvReporte.ServerReport.Refresh();

        }*/

        private void ReporteUbicacionMedidas()
        {

        }

        private void ReporteEstadoIniciativa()
        {

        }

        private void ReporteTipoIniciativa()
        {

        }

        private void ReporteDocumentosMedida()
        {

        }

        private void ReporteEscenarios()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            EscenarioRptBE entidad = new EscenarioRptBE() { ID_MEDMIT = 0 };

            ConfigurarReporte();
            rvReporte.LocalReport.ReportPath = string.Format("{0}\\EscenarioRpt.rdlc", rutatarget);
            List<EscenarioRptBE> lbeReporte = EscenarioRptLN.ListaEscenariosRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DsEscenario", lbeReporte);

            rvReporte.LocalReport.DataSources.Clear();
            rvReporte.LocalReport.DataSources.Add(dataSource);
            rvReporte.ServerReport.Refresh();

        }
    }
}