﻿using entidad.minem.gob.pe;
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


namespace MRVMinem.Controllers
{
    //[Autenticado]
    public class DetalleController : BaseController
    {
        // GET: Detalle
        public ActionResult DetalleIndicadorMasivo(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
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
            if (modelo.menor == 0)
            {
                modelo.menor = getMenorId(modelo.listaEnfoque);
            }
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            return View(modelo);
        }

        public JsonResult ProcesarExcel(HttpPostedFileBase fledeclaracion, IndicadorBE entidad)
        {
            List<IndicadorBE> listaIndicadores = new List<IndicadorBE>();
            ResponseEntity itemRespuesta = new ResponseEntity();
            List<string> excelData = new List<string>();
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
                        //loop all rows
                        if (pagina < 2)
                        {
                            for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
                            {
                                IndicadorBE item = new IndicadorBE();
                                if (i > 1)
                                {
                                    //loop all columns in a row
                                    if (worksheet.Cells[i, 1].Value != null && worksheet.Cells[i, 2].Value != null && worksheet.Cells[i, 3].Value != null && worksheet.Cells[i, 4].Value != null && worksheet.Cells[i, 5].Value != null && worksheet.Cells[i, 6].Value != null && worksheet.Cells[i, 7].Value != null && worksheet.Cells[i, 8].Value != null)
                                    {
                                        for (int j = worksheet.Dimension.Start.Column; j <= worksheet.Dimension.End.Column; j++)
                                        {
                                            //add the cell data to the List
                                            if (worksheet.Cells[i, j].Value != null)
                                            {
                                                excelData.Add(worksheet.Cells[i, j].Value.ToString());
                                                switch (j)
                                                {
                                                    case 1:
                                                        item.ANNOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ANNO_BASE = item.ANNOB;
                                                        break;
                                                    case 2:
                                                        item.INICIO_OPERACIONES = DateTime.FromOADate(long.Parse(worksheet.Cells[i, j].Value.ToString()));
                                                        break;
                                                    case 3:
                                                        item.ID_TIPO_VEHICULOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ID_TIPO_VEHICULO_BASE = item.ID_TIPO_VEHICULOB;
                                                        break;
                                                    case 4:
                                                        break;
                                                    case 5:
                                                        item.ID_TIPO_COMBUSTIBLEB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ID_TIPO_COMBUSTIBLE_BASE = item.ID_TIPO_COMBUSTIBLEB;
                                                        break;
                                                    case 6:
                                                        break;
                                                    case 7:
                                                        item.KRVB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.KRV_BASE = item.KRVB;
                                                        break;
                                                    case 8:
                                                        item.CANTIDADB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.CANT_BASE = item.CANTIDADB;
                                                        break;
                                                    case 9:
                                                        item.FACTOR_RENDIMIENTO = double.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.F_RENDIMIENTO = item.FACTOR_RENDIMIENTO;
                                                        break;
                                                }
                                            }
                                        }
                                        item.ID_TIPO_FUENTEI = entidad.ID_TIPO_FUENTEI;
                                        IndicadorBE Calculado = IndicadorLN.CalcularIndicador(item)[0];
                                        item.TOTAL_GEI_INIMIT = Calculado.TOTAL_GEI_INIMIT;
                                        item.TOTAL_GEI_REDUCIDO = Calculado.TOTAL_GEI_REDUCIDO;
                                        item.TOTAL_GEI_BASE = Calculado.TOTAL_GEI_BASE;
                                        item.F_RENDIMIENTO = Calculado.FACTOR_RENDIMIENTO;
                                        listaIndicadores.Add(item);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            var jsonResult = Json(listaIndicadores, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;

            //return Respuesta(itemRespuesta);
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

    }
}