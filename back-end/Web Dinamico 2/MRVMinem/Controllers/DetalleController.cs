using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;
using MRVMinem.Tags;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Configuration;


namespace MRVMinem.Controllers
{
    [Autenticado]
    public class DetalleController : BaseController
    {
        // GET: Detalle
        public ActionResult DetalleIndicadorMasivo(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 6 || validar == 7)
            {
                IniciativaBE inic = new IniciativaBE();
                inic.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
                modelo.menor = IndicadorLN.DetalleIndicadorEnfoque(modelo.iniciativa_mit.ID_INICIATIVA);
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.url = WebConfigurationManager.AppSettings.Get("Sello");
                //if (modelo.menor == 0)
                //{
                //    modelo.menor = getMenorId(modelo.listaEnfoque);
                //}
                int enf = IniciativaLN.getIdEnfoqueMenor(inic);
                if (enf == 0)
                {
                    if (modelo.menor == 0)
                    {
                        modelo.menor = getMenorId(modelo.listaEnfoque);
                        Session["enfoque"] = 0;
                    }
                }
                else
                {
                    modelo.menor = enf;
                    Session["enfoque"] = enf;
                }
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }


            return View(modelo);
        }

        public ActionResult CorregirDetalleIndicadorMasivo(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 9 || validar == 10)
            {
                IniciativaBE inic = new IniciativaBE();
                inic.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
                //modelo.menor = IndicadorLN.DetalleIndicadorEnfoque(modelo.iniciativa_mit.ID_INICIATIVA);
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.menor = IniciativaLN.getIdEnfoqueMenor(inic);
                modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.url = WebConfigurationManager.AppSettings.Get("Sello");
                modelo.revision = 0;
                Session["enfoque"] = modelo.menor;
                //if (modelo.menor == 0)
                //{
                //    modelo.menor = getMenorId(modelo.listaEnfoque);
                //}
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        //public JsonResult ProcesarExcel(HttpPostedFileBase fledeclaracion, IndicadorBE entidad)
        public JsonResult ProcesarExcel(HttpPostedFileBase fledeclaracion, ParametroBE entidad)
        {
            //List<IndicadorBE> listaIndicadores = new List<IndicadorBE>();
            //ResponseEntity itemRespuesta = new ResponseEntity();
            //List<string> excelData = new List<string>();
            //int pagina = 0;
            //if (fledeclaracion != null)
            //{
            //    //load the uploaded file into the memorystream
            //    byte[] archivo = new byte[fledeclaracion.ContentLength];
            //    fledeclaracion.InputStream.Read(archivo, 0, fledeclaracion.ContentLength - 1);
            //    using (MemoryStream stream = new MemoryStream(archivo))
            //    using (ExcelPackage excelPackage = new ExcelPackage(stream))
            //    {
            //        //loop all worksheets
            //        foreach (ExcelWorksheet worksheet in excelPackage.Workbook.Worksheets)
            //        {
            //            pagina++;
            //            //loop all rows
            //            if (pagina < 2)
            //            {
            //                for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
            //                {
            //                    IndicadorBE item = new IndicadorBE();
            //                    if (i > 1)
            //                    {
            //                        //loop all columns in a row
            //                        if (worksheet.Cells[i, 1].Value != null && worksheet.Cells[i, 2].Value != null && worksheet.Cells[i, 3].Value != null && worksheet.Cells[i, 4].Value != null && worksheet.Cells[i, 5].Value != null && worksheet.Cells[i, 6].Value != null && worksheet.Cells[i, 7].Value != null && worksheet.Cells[i, 8].Value != null)
            //                        {
            //                            for (int j = worksheet.Dimension.Start.Column; j <= worksheet.Dimension.End.Column; j++)
            //                            {
            //                                //add the cell data to the List
            //                                if (worksheet.Cells[i, j].Value != null)
            //                                {
            //                                    excelData.Add(worksheet.Cells[i, j].Value.ToString());
            //                                    switch (j)
            //                                    {
            //                                        case 1:
            //                                            item.ANNOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.ANNO_BASE = item.ANNOB;
            //                                            break;
            //                                        case 2:
            //                                            item.INICIO_OPERACIONES = DateTime.FromOADate(long.Parse(worksheet.Cells[i, j].Value.ToString()));
            //                                            break;
            //                                        case 3:
            //                                            item.ID_TIPO_VEHICULOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.ID_TIPO_VEHICULO_BASE = item.ID_TIPO_VEHICULOB;
            //                                            break;
            //                                        case 4:
            //                                            break;
            //                                        case 5:
            //                                            item.ID_TIPO_COMBUSTIBLEB = int.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.ID_TIPO_COMBUSTIBLE_BASE = item.ID_TIPO_COMBUSTIBLEB;
            //                                            break;
            //                                        case 6:
            //                                            break;
            //                                        case 7:
            //                                            item.KRVB = int.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.KRV_BASE = item.KRVB;
            //                                            break;
            //                                        case 8:
            //                                            item.CANTIDADB = int.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.CANT_BASE = item.CANTIDADB;
            //                                            break;
            //                                        case 9:
            //                                            item.FACTOR_RENDIMIENTO = double.Parse(worksheet.Cells[i, j].Value.ToString());
            //                                            item.F_RENDIMIENTO = item.FACTOR_RENDIMIENTO;
            //                                            break;
            //                                    }
            //                                }
            //                            }
            //                            item.ID_TIPO_FUENTEI = entidad.ID_TIPO_FUENTEI;
            //                            IndicadorBE Calculado = IndicadorLN.CalcularIndicador(item)[0];
            //                            item.TOTAL_GEI_INIMIT = Calculado.TOTAL_GEI_INIMIT;
            //                            item.TOTAL_GEI_REDUCIDO = Calculado.TOTAL_GEI_REDUCIDO;
            //                            item.TOTAL_GEI_BASE = Calculado.TOTAL_GEI_BASE;
            //                            item.F_RENDIMIENTO = Calculado.FACTOR_RENDIMIENTO;
            //                            listaIndicadores.Add(item);
            //                        }
            //                    }
            //                }
            //            }
            //        }
            //    }
            //}

            //var jsonResult = Json(listaIndicadores, JsonRequestBehavior.AllowGet);
            //jsonResult.MaxJsonLength = int.MaxValue;
            //return jsonResult;

            List<IndicadorDataBE> listaData = new List<IndicadorDataBE>();
            
            
            List<ParametroBE> listaParametro = new List<ParametroBE>(); //add
            List<ParametroBE> listaTemp = new List<ParametroBE>(); //add
            ParametroBE entTemp = new ParametroBE();
            ResponseEntity itemRespuesta = new ResponseEntity();
            List<string> excelData = new List<string>();

            listaTemp = ParametroLN.ListarParametroCabeceraExcel(entidad);
            foreach (var item in listaTemp)
            {
                item.AGREGAR = 1;
                listaParametro.Add(item);
                if (item.ID_TIPO_CONTROL == 1)
                {
                    if (item.ID_PARAMETRO != 6)
                    {                        
                        entTemp.AGREGAR = 0;
                        listaParametro.Add(entTemp);
                    }
                }
            }

            int pagina = 0;
            if (fledeclaracion != null)
            {
                //load the uploaded file into the memorystream
                byte[] archivo = new byte[fledeclaracion.ContentLength];
                fledeclaracion.InputStream.Read(archivo, 0, fledeclaracion.ContentLength - 1);
                using (MemoryStream stream = new MemoryStream(archivo))
                using (ExcelPackage excelPackage = new ExcelPackage(stream))
                {
                    //loop all worksheets
                    foreach (ExcelWorksheet worksheet in excelPackage.Workbook.Worksheets)
                    {
                        pagina++;
                        pagina++;
                        var cant_column = worksheet.Dimension.End.Column;
                        var ultimos = listaParametro.Count - cant_column;
                        //loop all rows
                        if (pagina < 3)
                        {
                            for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
                            {
                                IndicadorDataBE itemData = new IndicadorDataBE();
                                List<IndicadorDataBE> listaIndicadores = new List<IndicadorDataBE>();
                                if (i > 2)
                                {
                                    //loop all columns in a row                                    
                                    var validar = 0;
                                    for(int n = 0; n < cant_column; n++)
                                    {
                                        if (worksheet.Cells[i, (n+1)].Value == null)
                                        {
                                            validar = 1;
                                            break;
                                        }
                                    }

                                    if (validar == 0)
                                    {
                                        for (int j = worksheet.Dimension.Start.Column; j <= worksheet.Dimension.End.Column; j++)
                                        {
                                            //add the cell data to the List
                                            if (worksheet.Cells[i, j].Value != null)
                                            {
                                                IndicadorDataBE item = new IndicadorDataBE();
                                                excelData.Add(worksheet.Cells[i, j].Value.ToString());
                                                item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                                                item.ID_MEDMIT = entidad.ID_MEDMIT;
                                                item.ID_PARAMETRO = listaParametro[(j-1)].ID_PARAMETRO;
                                                if (listaParametro[(j - 1)].ID_TIPO_DATO == 1)
                                                {
                                                    var fec = Convert.ToString(DateTime.FromOADate(long.Parse(worksheet.Cells[i, j].Value.ToString())));
                                                    item.VALOR = Convert.ToDateTime(fec).ToString("yyyy-MM-dd");
                                                    //item.VALOR = Convert.ToString(DateTime.FromOADate(long.Parse(worksheet.Cells[i, j].Value.ToString())));
                                                    //item.VALOR = item.VALOR.Substring(0, 10);
                                                    //item.VALOR = "2018-11-12";

                                                    //ALTERNO
                                                    //string p = worksheet.Cells[i, j].Value.ToString();
                                                    //item.VALOR = Convert.ToDateTime(p).ToString("yyyy-MM-dd");
                                                }                                                    
                                                else
                                                    item.VALOR = worksheet.Cells[i, j].Value.ToString();

                                                if (listaParametro[(j - 1)].AGREGAR == 1)
                                                    listaIndicadores.Add(item);
                                            }
                                            else
                                            {
                                                IndicadorDataBE item = new IndicadorDataBE();
                                                excelData.Add(worksheet.Cells[i, j].Value.ToString());
                                                item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                                                item.ID_MEDMIT = entidad.ID_MEDMIT;
                                                item.ID_PARAMETRO = listaParametro[(j - 1)].ID_PARAMETRO;
                                                item.VALOR = "";
                                            }
                                        }
                                        for (int m = cant_column; m < listaParametro.Count; m++)
                                        {
                                            IndicadorDataBE item = new IndicadorDataBE();
                                            item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                                            item.ID_MEDMIT = entidad.ID_MEDMIT;
                                            item.ID_PARAMETRO = listaParametro[m].ID_PARAMETRO;
                                            item.VALOR = "";
                                            listaIndicadores.Add(item);
                                        }
                                        itemData.listaInd = IndicadorLN.CalculoIndicador(listaIndicadores);
                                        listaData.Add(itemData);
                                    }     
                                }
                            }
                        }
                    }
                }
            }

            var jsonResult = Json(listaData, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;

            //return Respuesta(itemRespuesta);
        }

        public JsonResult ListarCodIndicadores(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListarCodIndicadores(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        private int getMenorId(List<EnfoqueBE> lista)
        {
            var menor = 999999999;
            foreach (var item in lista)
            {
                if (item.ID_ENFOQUE < menor)
                {
                    menor = item.ID_ENFOQUE;
                }
            }
            return menor;
        }

        private int getMenorEnfoqueRegistrado(List<IndicadorBE> lista)
        {
            var menor = 999999999;
            foreach (var item in lista)
            {
                if (item.ID_ENFOQUE < menor)
                {
                    menor = item.ID_ENFOQUE;
                }
            }
            return menor;
        }

        //private int validar_campo(ExcelWorksheet worksheet, ParametroBE entidad, List<ParametroBE> listaParametro, int cant_column)
        //{
        //    List<IndicadorDataBE> listaData = new List<IndicadorDataBE>();
        //    for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
        //    {
        //        IndicadorDataBE itemData = new IndicadorDataBE();
        //        List<IndicadorDataBE> listaIndicadores = new List<IndicadorDataBE>();
        //        int num = 0;
        //        if (i > 2)
        //        {
        //            //loop all columns in a row                                    
        //            var validar = 0;
        //            for (int n = 0; n < cant_column; n++)
        //            {
        //                IndicadorDataBE item = new IndicadorDataBE();
        //                item.ID_ENFOQUE = entidad.ID_ENFOQUE;
        //                item.ID_MEDMIT = entidad.ID_MEDMIT;
        //                item.ID_PARAMETRO = listaParametro[(n - 1)].ID_PARAMETRO;
        //                if (worksheet.Cells[i, (n)].Value != null)
        //                {
        //                    if (listaParametro[n].ID_TIPO_CONTROL == 2)
        //                    {
        //                        if (listaParametro[n].ID_TIPO_DATO == 1)
        //                        {
        //                            var fec = Convert.ToString(DateTime.FromOADate(long.Parse(worksheet.Cells[i, (n+1)].Value.ToString())));
        //                            item.VALOR = Convert.ToDateTime(fec).ToString("yyyy-MM-dd");
        //                            var fecha = item.VALOR.Split('-');
        //                            DateTime fechaActual = DateTime.Today;

        //                            int dia = fechaActual.Day;
        //                            int mes = fechaActual.Month;
        //                            int anno = fechaActual.Year;
        //                            if (Convert.ToInt32(fecha[2]) > anno)
        //                            {
        //                                item.extra = "1";
        //                            }
        //                            else if (Convert.ToInt32(fecha[1]) > mes)
        //                            {
        //                                item.extra = "1";
        //                            }
        //                            else if (Convert.ToInt32(fecha[0]) > dia)
        //                            {
        //                                item.extra = "1";
        //                            }
        //                            else
        //                            {
        //                                item.extra = "0";
        //                            }
        //                        }
        //                        else if (listaParametro[n].ID_TIPO_DATO == 2)
        //                        {
        //                            item.VALOR = worksheet.Cells[i, n].Value.ToString();
        //                            if (!int.TryParse((worksheet.Cells[i, n].Value).ToString(), out num))
        //                            {
        //                                item.extra = "1";
        //                            }
        //                            else
        //                            {
        //                                item.extra = "0";
        //                            }
        //                        }
        //                        else if (listaParametro[n + 1].ID_TIPO_DATO == 3)
        //                        {
        //                            item.VALOR = worksheet.Cells[i,n].Value.ToString();
        //                        }
        //                    }
        //                }
        //                if (listaParametro[n].AGREGAR == 1)
        //                    listaIndicadores.Add(item);
        //            }

        //            if (validar == 0)
        //            {                        
        //                itemData.listaInd = listaIndicadores;
        //                listaData.Add(itemData);
        //            }
        //        }
        //    }
        //    return 0;
        //}

    }
}