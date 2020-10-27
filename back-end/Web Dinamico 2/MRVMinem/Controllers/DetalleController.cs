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
using utilitario.minem.gob.pe;


namespace MRVMinem.Controllers
{
    [Autenticado]
    public class DetalleController : BaseController
    {
        // GET: Detalle
        private int bandera = 0;
        public ActionResult DetalleIndicadorMasivo(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 6 || validar == 7 || validar == 14) //add 14-10-20
            {
                IniciativaBE inic = new IniciativaBE();
                inic.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);

                if (modelo.iniciativa_mit.ListaSustentos.Count > 0) modelo.iniciativa_mit.ListaSustentos = limpiarFileSustento(modelo.iniciativa_mit.ListaSustentos);//add

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
                
                if (modelo.iniciativa_mit.ListaSustentos.Count > 0) modelo.iniciativa_mit.ListaSustentos = limpiarFileSustento(modelo.iniciativa_mit.ListaSustentos);//add

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
            List<IndicadorDataBE> listaData = new List<IndicadorDataBE>();
            try
            {
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
                            if (pagina < 4)
                            {
                                List<IndicadorDataBE> listaDataTemp = new List<IndicadorDataBE>();
                                listaDataTemp = validar_campo(worksheet, entidad, listaParametro, cant_column);
                                if (bandera == 1)
                                {
                                    listaData = listaDataTemp;
                                    break;
                                }

                                for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
                                {
                                    IndicadorDataBE itemData = new IndicadorDataBE();
                                    List<IndicadorDataBE> listaIndicadores = new List<IndicadorDataBE>();
                                    if (i > 3)
                                    {
                                        //loop all columns in a row                                    
                                        var validar = 0;
                                        for (int n = 0; n < cant_column; n++)
                                        {
                                            if (worksheet.Cells[i, (n + 1)].Value == null)
                                            {
                                                validar = 1;
                                                break;
                                            }
                                        }

                                        if (validar == 0)
                                        {
                                            string anno = "";
                                            for (int j = worksheet.Dimension.Start.Column; j <= worksheet.Dimension.End.Column; j++)
                                            {                                                
                                                //add the cell data to the List
                                                if (worksheet.Cells[i, j].Value != null)
                                                {
                                                    IndicadorDataBE item = new IndicadorDataBE();
                                                    excelData.Add(worksheet.Cells[i, j].Value.ToString());
                                                    item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                                                    item.ID_MEDMIT = entidad.ID_MEDMIT;
                                                    item.ID_PARAMETRO = listaParametro[(j - 1)].ID_PARAMETRO;
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
                                                    {
                                                        item.VALOR = worksheet.Cells[i, j].Value.ToString();
                                                        if (item.ID_PARAMETRO == 6) anno = item.VALOR;
                                                    }                                                        

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
                                            //itemData.listaInd = IndicadorLN.CalculoIndicador(listaIndicadores);
                                            itemData.listaAcumulado = detalleAcumulado(listaIndicadores);
                                            listaIndicadores[0].VALOR = anno;
                                            itemData.listaInd = IndicadorLN.CalculoIndicador(listaIndicadores);
                                            listaData.Add(itemData);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex); 

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

        private List<IndicadorDataBE> validar_campo(ExcelWorksheet worksheet, ParametroBE entidad, List<ParametroBE> listaParametro, int cant_column)
        {
            List<IndicadorDataBE> listaData = new List<IndicadorDataBE>();
            for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
            {    
                IndicadorDataBE itemData = new IndicadorDataBE();
                List<IndicadorDataBE> listaIndicadores = new List<IndicadorDataBE>();
                decimal num = 0;
                if (i > 3)
                {


                    var validar = 0;
                    for (int n = 0; n < cant_column; n++)
                    {
                        if (worksheet.Cells[i, (n + 1)].Value == null)
                        {
                            validar = 1;
                            break;
                        }
                    }

                    if (validar == 0)
                    {
                        for (int n = 0; n < cant_column; n++)
                        {
                            IndicadorDataBE item = new IndicadorDataBE();
                            item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                            item.ID_MEDMIT = entidad.ID_MEDMIT;
                            item.ID_PARAMETRO = listaParametro[n].ID_PARAMETRO;
                            if (worksheet.Cells[i, (n + 1)].Value != null)
                            {
                                if (listaParametro[n].ID_TIPO_CONTROL == 2)
                                {
                                    if (listaParametro[n].ID_TIPO_DATO == 1)
                                    {
                                        var fec = Convert.ToString(DateTime.FromOADate(long.Parse(worksheet.Cells[i, (n + 1)].Value.ToString())));
                                        item.VALOR = Convert.ToDateTime(fec).ToString("yyyy-MM-dd");
                                        var fecha = item.VALOR.Split('-');
                                        DateTime fechaActual = DateTime.Today;

                                        int dia = fechaActual.Day;
                                        int mes = fechaActual.Month;
                                        int anno = fechaActual.Year;
                                        if (Convert.ToInt32(fecha[2]) > anno)
                                        {
                                            item.extra = "1";
                                            bandera = 1;
                                        }
                                        else
                                        {
                                            if (Convert.ToInt32(fecha[2]) == anno)
                                            {
                                                if (Convert.ToInt32(fecha[1]) > mes)
                                                {
                                                    item.extra = "1";
                                                    bandera = 1;
                                                }
                                                else
                                                {
                                                    if (Convert.ToInt32(fecha[1]) == mes)
                                                    {
                                                        if (Convert.ToInt32(fecha[0]) > dia)
                                                        {
                                                            item.extra = "1";
                                                            bandera = 1;
                                                        }
                                                        else
                                                        {
                                                            item.extra = "0";
                                                        }
                                                    }
                                                    else
                                                    {
                                                        item.extra = "0";
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                item.extra = "0";
                                            }

                                            

                                        }
                                    }
                                    else if (listaParametro[n].ID_TIPO_DATO == 2)
                                    {
                                        item.VALOR = worksheet.Cells[i, (n + 1)].Value.ToString();
                                        if (!decimal.TryParse((worksheet.Cells[i, (n + 1)].Value).ToString(), out num))
                                        {
                                            item.extra = "1";
                                            bandera = 1;
                                        }
                                        else
                                        {
                                            item.extra = "0";
                                        }
                                    }
                                    else if (listaParametro[n].ID_TIPO_DATO == 3)
                                    {
                                        item.VALOR = worksheet.Cells[i, (n + 1)].Value.ToString();
                                    }
                                }
                                else
                                {
                                    item.VALOR = worksheet.Cells[i, (n + 1)].Value.ToString();
                                    if (worksheet.Cells[i, (n + 1)].Value.ToString() == "NeuN")
                                    {
                                        item.extra = "1";
                                        bandera = 1;
                                    }else
                                    {
                                        item.extra = "0";
                                        //item.VALOR = worksheet.Cells[i, (n + 1)].Value.ToString();
                                    }
                                    //var f = worksheet.Cells[i, (n + 1)].Value.ToString();
                                    //item.VALOR = worksheet.Cells[i, (n + 1)].Value.ToString();
                                }
                            }
                            if (listaParametro[n].AGREGAR == 1)
                                listaIndicadores.Add(item);
                        }
                        for (int m = cant_column; m < listaParametro.Count; m++)
                        {
                            IndicadorDataBE item = new IndicadorDataBE();
                            item.ID_ENFOQUE = entidad.ID_ENFOQUE;
                            item.ID_MEDMIT = entidad.ID_MEDMIT;
                            item.ID_PARAMETRO = listaParametro[m].ID_PARAMETRO;
                            item.VALOR = "0";
                            listaIndicadores.Add(item);
                        }

                        //if (validar == 0)
                        //{
                        itemData.listaInd = listaIndicadores;
                        listaData.Add(itemData);
                    }

                    //loop all columns in a row                                    
                    //var validar = 0;
                    
                    
                    //}
                }
            }
            return listaData;
        }

        public JsonResult CalcularAcumulado(List<IndicadorDataBE> lista)
        {
            List<AcumuladoBE> listaA = new List<AcumuladoBE>();
            listaA = detalleAcumulado(lista);

            var jsonResult = Json(listaA, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public List<AcumuladoBE> detalleAcumulado(List<IndicadorDataBE> listaE)
        {
            List<AcumuladoBE> listaA = new List<AcumuladoBE>();
            try
            {
                List<IndicadorDataBE> lista = new List<IndicadorDataBE>();
                
                lista = listaE;
                int anioP = 0;
                string reducido = "";
                foreach (var item in lista)
                {
                    if (item.ID_PARAMETRO == 17)
                        item.VALOR = "0";
                    else if (item.ID_PARAMETRO == 32)
                    {
                        string fecha = item.VALOR;
                        fecha = fecha.Substring(0, 4);
                        item.VALOR = fecha + "-01-01";
                    }
                    else if (item.ID_PARAMETRO == 6)
                    {
                        anioP = Convert.ToInt32(item.VALOR);
                        item.VALOR = Convert.ToString(anioP);
                    }
                    else if (item.ID_PARAMETRO == 11)
                        reducido = item.VALOR;
                }

                //listaA.Add(new AcumuladoBE { anio = anioP, reducido = reducido });
                if (lista[0].ID_MEDMIT != 12 && lista[0].ID_MEDMIT != 4 && lista[0].ID_ENFOQUE != 6 && lista[0].ID_ENFOQUE != 9) //add 08-09-20
                {
                    List<IndicadorDataBE> listaPr = new List<IndicadorDataBE>();
                    //anioP += 1;
                    while (DateTime.Now.Year > anioP)
                    {
                        listaPr = IndicadorLN.CalculoIndicador(lista);
                        foreach (var item in listaPr)
                        {
                            if (item.ID_PARAMETRO == 6)
                                item.VALOR = Convert.ToString(anioP + 1);
                            else if (item.ID_PARAMETRO == 11)
                                reducido = item.VALOR;
                        }
                        listaA.Add(new AcumuladoBE { anio = anioP, reducido = reducido });
                        anioP += 1;
                    }
                }
                else
                {
                    List<IndicadorDataBE> listaPr = IndicadorLN.CalculoIndicador(lista);
                    foreach (var item in listaPr)
                    {
                        if (item.ID_PARAMETRO == 6)
                            item.VALOR = Convert.ToString(anioP);
                        else if (item.ID_PARAMETRO == 11)
                            reducido = item.VALOR;
                    }
                    listaA.Add(new AcumuladoBE { anio = anioP, reducido = reducido });
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return listaA;
        }

        public List<SustentoIniciativaBE> limpiarFileSustento(List<SustentoIniciativaBE> sustento)
        {

            List<SustentoIniciativaBE> new_lista = new List<SustentoIniciativaBE>();
            string cod_file = "";
            int cod_ini = 0;

            try
            {
                foreach (var item in sustento)
                {
                    if (item.ADJUNTO != null)
                    {
                        new_lista.Add(item);
                    }
                    else
                    {
                        cod_file = item.ID_INICIATIVA_SUSTENTATORIO + ",";
                        cod_ini = item.ID_INICIATIVA;
                    }
                }

                if (!string.IsNullOrEmpty(cod_file))
                {
                    cod_file.Substring(0, cod_file.Length - 1);
                    IndicadorLN.EliminarIndicadoresFile(new IniciativaBE { ID_INICIATIVA = cod_ini, ID_INDICADOR_ELIMINAR = cod_file });
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return new_lista;
        }

    }
}