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
using utilitario.minem.gob.pe;

namespace MRVMinem.Reportes
{
    public partial class frmGeneral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                cargaAnno();
            }
        }

        private void cargaAnno()
        {
            List<AnnoBE> lista = AnnoLN.ListaAnno(DateTime.Today.Year);

            ddlAnnio.DataValueField = "DESCRIPCION";
            ddlAnnio.DataTextField = "DESCRIPCION";
            ddlAnnio.DataSource = lista;
            ddlAnnio.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try //add trycatch
            {
                string rutatarget = WebConfigurationManager.AppSettings["RutaReportes"].ToString();
                List<MedidaMitigacionBE> listado = EscenarioRptLN.ListaEscenariosRptGeneral(int.Parse(ddlAnnio.SelectedValue));

                ReportDataSource dataSource = new ReportDataSource("DtMedGeneral", listado);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = string.Format("{0}\\rptMedGeneral.rdlc", rutatarget);
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
            catch (Exception ex)
            {
                Log.Error(ex);
            }

        }
    }
}