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
    public partial class ReporteIni : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargaMedidaMitigacion();
                cargaSector();
            }
        }

        private void cargaMedidaMitigacion()
        {
            MedidaMitigacionBE entidad = new MedidaMitigacionBE();
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacion(entidad);

            ddlMedMit.DataValueField = "ID_MEDMIT";
            ddlMedMit.DataTextField = "NOMBRE_MEDMIT";
            ddlMedMit.DataSource = lista;
            ddlMedMit.DataBind();
        }

        private void cargaSector()
        {
            SectorInstitucionBE entidad = new SectorInstitucionBE();
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);

            ddlSector.DataValueField = "ID_SECTOR_INST";
            ddlSector.DataTextField = "DESCRIPCION";
            ddlSector.DataSource = lista;
            ddlSector.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReporteIniciativa();
        }

        private void ReporteIniciativa()
        {
            string rutatarget = ConfigurationManager.AppSettings["RutaReportes"].ToString();
            IniciativaRptBE entidad = new IniciativaRptBE() { ID_INICIATIVA = 0, ID_MEDMIT = int.Parse(ddlMedMit.SelectedValue), ID_SECTOR_INSTITUCION = int.Parse(ddlSector.SelectedValue) };

            ConfigurarReporte();
            ReportViewer1.LocalReport.ReportPath = string.Format("{0}\\rptIniciativa.rdlc", rutatarget);
            List<IniciativaRptBE> lbeReporte = ReporteLN.ListaIniciativaRpt(entidad);

            ReportDataSource dataSource = new ReportDataSource("DtIniciativa", lbeReporte);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSource);
            ReportViewer1.ServerReport.Refresh();

        }

        private void ConfigurarReporte()
        {
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
        }
    }
}