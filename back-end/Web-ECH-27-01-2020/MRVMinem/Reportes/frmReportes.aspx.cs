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

namespace MRVMinem.Reportes
{
    public partial class frmReportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["IdReporte"] == "1")
                {
                    ReporteIniciativaPeriodo();
                }
                else if (Request.QueryString["IdReporte"] == "2")
                {
                    ReporteIndicadoresPeriodo();
                }
                else if (Request.QueryString["IdReporte"] == "3")
                {
                    ReporteEntidadesRegistradas();
                }
                else if (Request.QueryString["IdReporte"] == "4")
                {
                    ReporteUbicacionMedidas();
                }
                else if (Request.QueryString["IdReporte"] == "5")
                {
                    ReporteEstadoIniciativa();
                }
                else if (Request.QueryString["IdReporte"] == "6")
                {
                    ReporteTipoIniciativa();
                }
                else if (Request.QueryString["IdReporte"] == "7")
                {
                    ReporteDocumentosMedida();
                }
                else if (Request.QueryString["IdReporte"] == "8")
                {
                    ReporteEscenarios();
                }
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


        private void ReporteIniciativaPeriodo()
        {

        }

        private void ReporteIndicadoresPeriodo()
        {

        }

        private void ReporteEntidadesRegistradas()
        {

        }

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