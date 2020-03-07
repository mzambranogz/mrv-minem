using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using utilitario.minem.gob.pe;

namespace MRVMinem.Repositorio
{
    public class ReporteRepositorio
    {
        ReportViewer rvReporte = new ReportViewer();

        private void ConfigurarReporte()
        {
            rvReporte.ProcessingMode = ProcessingMode.Local;
        }

        public bool GenerarPDFBlockChain(int IdBlockChain, string NombrePDF)
        {
            bool OK = true;
            try
            {
                Warning[] warnings;
                string[] streamids;
                string mimeType;
                string encoding;
                string filenameExtension;
                string rutatarget = WebConfigurationManager.AppSettings["RutaReportes"].ToString();

                ConfigurarReporte();
                rvReporte.LocalReport.ReportPath = string.Format("{0}\\rptBlockChain.rdlc", rutatarget);
                List<BlockChainBE> listaBlock = BlockChainLN.ListaBlockChain(new BlockChainBE() { ID_BLOCKCHAIN = IdBlockChain });
                ReportDataSource dataSource = new ReportDataSource("DtBlockChain", listaBlock);

                rvReporte.LocalReport.DataSources.Clear();
                rvReporte.LocalReport.DataSources.Add(dataSource);
                //List<ReportParameter> parameters = new List<ReportParameter>();
                //parameters.Add(new ReportParameter("PI_IDCONVOCATORIA", IdConvocatoria.ToString()));

                //rvReporte.ServerReport.SetParameters(parameters);
                byte[] bytes = rvReporte.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);

                using (FileStream fs = new FileStream(NombrePDF, FileMode.Create))
                {
                    fs.Write(bytes, 0, bytes.Length);
                    fs.Close();
                }
            }
            catch (Exception ex)
            {
                OK = false;
                Log.Error(ex);
            }
            return OK;
        }

    }
}