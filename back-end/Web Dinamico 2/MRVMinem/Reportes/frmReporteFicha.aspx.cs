using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRVMinem.Reportes
{
    public partial class frmReporteFicha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargaMedidaMitigacion();
                cargaSector();
            }
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(rvwFichaEventHandler);

        }

        protected void rvwFichaEventHandler(object sender, SubreportProcessingEventArgs e)
        {
            e.DataSources.Add(new ReportDataSource("DtParametro", LoadParametros()));
        }

        List<FichaParametroBE> LoadParametros()
        {
            return FichaMinamLN.ListaFichaParametros(new FichaParametroBE() { ID_MEDMIT = int.Parse(ddlMedMit.SelectedValue), ID_ENFOQUE = 0 });
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
            List<AnnoBE> lista = AnnoLN.ListaAnno(DateTime.Today.Year);

            ddlAnio.DataValueField = "DESCRIPCION";
            ddlAnio.DataTextField = "DESCRIPCION";
            ddlAnio.DataSource = lista;
            ddlAnio.DataBind();
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            string rutatarget = WebConfigurationManager.AppSettings["RutaReportes"].ToString();
            List<FichaMinamBE> listado = FichaMinamLN.ListaFichaMinam(new FichaMinamBE() { ID_MEDMIT = int.Parse(ddlMedMit.SelectedValue), ANNO = int.Parse(ddlAnio.SelectedValue) });

            ReportDataSource dataSource = new ReportDataSource("DtFichaMinam", listado);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = string.Format("{0}\\rptFichaMinam.rdlc", rutatarget);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSource);

            if (listado != null)
            {
                ReportViewer1.Visible = true;
                ReportViewer1.LocalReport.Refresh();
            }
            else
            {
                ReportViewer1.Visible = false;
            }
        }
    }
}