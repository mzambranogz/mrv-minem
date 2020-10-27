using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using Microsoft.Reporting.WebForms;
using System.Configuration;

namespace MRVMinem.Reportes
{
    public partial class frmEscenario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargaMedidaMitigacion();
            }
        }

        private void cargaMedidaMitigacion()
        {
            MedidaMitigacionBE entidad = new MedidaMitigacionBE();
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacion(entidad);

            ddlMedMit_e.DataValueField = "ID_MEDMIT";
            ddlMedMit_e.DataTextField = "NOMBRE_MEDMIT";
            ddlMedMit_e.DataSource = lista;
            ddlMedMit_e.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReporteEscenarios();
        }

        private void ReporteEscenarios()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            EscenarioRptBE entidad = new EscenarioRptBE() { ID_MEDMIT = int.Parse(ddlMedMit_e.SelectedValue) };

            ConfigurarReporte();
            ReportViewer1.LocalReport.ReportPath = string.Format("{0}\\EscenarioRpt.rdlc", rutatarget);
            List<EscenarioRptBE> lbeReporte = EscenarioRptLN.ListaEscenariosRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DsEscenario", lbeReporte);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSource);
            ReportViewer1.ServerReport.Refresh();

            //string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            //IniciativaRptBE entidad = new IniciativaRptBE() { ID_INICIATIVA = 0, ID_MEDMIT = int.Parse(ddlMedMit.SelectedValue), ID_SECTOR_INSTITUCION = 1 };

            //ConfigurarReporte();
            //ReportViewer1.LocalReport.ReportPath = string.Format("{0}\\rptIniciativa.rdlc", rutatarget);
            //List<IniciativaRptBE> lbeReporte = ReporteLN.ListaIniciativaRpt(entidad);

            //ReportDataSource dataSource = new ReportDataSource("DtIniciativa", lbeReporte);

            //ReportViewer1.LocalReport.DataSources.Clear();
            //ReportViewer1.LocalReport.DataSources.Add(dataSource);
            //ReportViewer1.ServerReport.Refresh();

        }

        private void ConfigurarReporte()
        {
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
        }
    }
}