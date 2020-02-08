using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using utilitario.minem.gob.pe;
using System.Drawing;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace MRVMinem.Controllers
{
    public class MantenimientoController : BaseController
    {
        // GET: Mantenimiento
        public JsonResult ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacionAsociado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public ActionResult Instituciones(InstitucionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new InstitucionBE() { cantidad_registros = 10, order_by = "NOMBRE_INSTITUCION", order_orden = "ASC", pagina = 1 };
            }
            MvInstitucion modelo = new MvInstitucion();
            modelo.ListaInstitucion = InstitucionLN.ListaInstitucionPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarInstitucion(InstitucionBE entidad)
        {
            InstitucionBE lista = InstitucionLN.GetInstitucionPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaInstitucion(InstitucionBE entidad)
        {
            List<InstitucionBE> lista = InstitucionLN.ListaInstitucionPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarInstitucion(InstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad.INSNOMBRE = entidad.NOMBRE_INSTITUCION;
                entidad.INSDIRECCION = entidad.DIRECCION_INSTITUCION;
                entidad.INSTIPO = entidad.ID_SECTOR_INSTITUCION;
                entidad.INSRUC = entidad.RUC_INSTITUCION;
                entidad = InstitucionLN.registrarInstitucion(entidad);
            }
            else
            {
                entidad = InstitucionLN.ActualizarInstitucion(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarInstitucion(InstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = InstitucionLN.EliminarInstitucion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }


        public ActionResult Ubicaciones(UbicacionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new UbicacionBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1 };
            }
            MvUbicacion modelo = new MvUbicacion();
            modelo.ListaUbicacion = UbicacionLN.ListarUbicacionPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarUbicacion(UbicacionBE entidad)
        {
            UbicacionBE lista = UbicacionLN.GetUbicacionPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> lista = UbicacionLN.ListarUbicacionPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLG_ESTADO == "1")
            {
                entidad = UbicacionLN.RegistrarUbicacion(entidad);
            }
            else
            {
                entidad = UbicacionLN.ActualizarUbicacion(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UbicacionLN.EliminarUbicacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        ///

        public ActionResult Sectores(SectorInstitucionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new SectorInstitucionBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvSector modelo = new MvSector();
            modelo.ListaSectores = SectorInstitucionLN.ListarSectorPaginado(entidad);
            return View(modelo);
        }

        public JsonResult Buscarsector(SectorInstitucionBE entidad)
        {
            SectorInstitucionBE lista = SectorInstitucionLN.GetSectorPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaSectores(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListarSectorPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarSector(SectorInstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = SectorInstitucionLN.RegistrarSector(entidad);
            }
            else
            {
                entidad = SectorInstitucionLN.ActualizarSector(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarSector(SectorInstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = SectorInstitucionLN.EliminarSector(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        ////////////////////////////////

        public ActionResult Monedas(MonedaBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new MonedaBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvMoneda modelo = new MvMoneda();
            modelo.ListaMonedas = MonedaLN.ListarMonedaPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarMoneda(MonedaBE entidad)
        {
            MonedaBE lista = MonedaLN.GetMonedaPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaMonedas(MonedaBE entidad)
        {
            List<MonedaBE> lista = MonedaLN.ListarMonedaPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarMoneda(MonedaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = MonedaLN.RegistrarMoneda(entidad);
            }
            else
            {
                entidad = MonedaLN.ActualizarMoneda(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarMoneda(MonedaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = MonedaLN.EliminarMoneda(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////

        public ActionResult Gei(GasEfectoInvernaderoBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new GasEfectoInvernaderoBE() { cantidad_registros = 10, order_by = "ID_GEI", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvGei modelo = new MvGei();
            modelo.ListaGei = GasEfectoInvernaderoLN.ListarGeiPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarGei(GasEfectoInvernaderoBE entidad)
        {
            GasEfectoInvernaderoBE lista = GasEfectoInvernaderoLN.GetGeiPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaGei(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = GasEfectoInvernaderoLN.ListarGeiPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarGei(GasEfectoInvernaderoBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = GasEfectoInvernaderoLN.RegistrarGei(entidad);
            }
            else
            {
                entidad = GasEfectoInvernaderoLN.ActualizarGei(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarGei(GasEfectoInvernaderoBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = GasEfectoInvernaderoLN.EliminarGei(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        /////////

        public ActionResult Enfoques(EnfoqueBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new EnfoqueBE() { cantidad_registros = 10, order_by = "ID_ENFOQUE", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvEnfoque modelo = new MvEnfoque();
            modelo.ListaEnfoque = EnfoqueLN.ListarEnfoquePaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarEnfoque(EnfoqueBE entidad)
        {
            EnfoqueBE lista = EnfoqueLN.GetEnfoquePorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaEnfoques(EnfoqueBE entidad)
        {
            List<EnfoqueBE> lista = EnfoqueLN.ListarEnfoquePaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarEnfoque(EnfoqueBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = EnfoqueLN.RegistrarEnfoque(entidad);
            }
            else
            {
                entidad = EnfoqueLN.ActualizarEnfoque(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarEnfoque(EnfoqueBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = EnfoqueLN.EliminarEnfoque(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        /////////////////////////////

        public ActionResult Escenarios(EscenarioBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new EscenarioBE() { cantidad_registros = 10, order_by = "NOMBRE_MEDMIT", order_orden = "ASC", pagina = 1 };
            }
            MvEscenario modelo = new MvEscenario();
            modelo.ListaEscenarios = EscenarioLN.ListaEscenariosPaginado(entidad);
            return View(modelo);
        }

        public JsonResult ListaEscenarios(EscenarioBE entidad)
        {
            List<EscenarioBE> lista = EscenarioLN.ListaEscenariosPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        /////////// exportar excel

        public void ExportarMantenimientoSector(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<SectorInstitucionBE>(item);
                    ExportarToExcelMantenimientoSector(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoSector(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = SectorInstitucionLN.ListarSectorExcel(entidad);
            //}
            //else
            //{
            //    lista = UsuarioLN.BuscarMantenimientoUsuario(entidad);
            //}

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA SECTOR");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA SECTOR " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "DESCRIPCIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (SectorInstitucionBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_SECTOR_INST;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_SECTOR_" + DateTime.Now.ToString() + ".xlsx";
                    Response.Clear();
                    byte[] dataByte = package.GetAsByteArray();
                    Response.AddHeader("Content-Disposition", "inline;filename=\"" + strFileName + "\"");
                    Response.AddHeader("Content-Length", dataByte.Length.ToString());
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.BinaryWrite(dataByte);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void ExportarMantenimientoMonedas(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<MonedaBE>(item);
                    ExportarToExcelMantenimientoMonedas(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoMonedas(MonedaBE entidad)
        {
            List<MonedaBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = MonedaLN.ListarMonedaExcel(entidad);
            //}
            //else
            //{
            //    lista = UsuarioLN.BuscarMantenimientoUsuario(entidad);
            //}

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA USUARIO");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA MONEDA " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "DESCRIPCIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (MonedaBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_MONEDA;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_MONEDA_" + DateTime.Now.ToString() + ".xlsx";
                    Response.Clear();
                    byte[] dataByte = package.GetAsByteArray();
                    Response.AddHeader("Content-Disposition", "inline;filename=\"" + strFileName + "\"");
                    Response.AddHeader("Content-Length", dataByte.Length.ToString());
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.BinaryWrite(dataByte);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void ExportarMantenimientoGei(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<GasEfectoInvernaderoBE>(item);
                    ExportarToExcelMantenimientoGei(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoGei(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = GasEfectoInvernaderoLN.ListarGeiExcel(entidad);
            //}
            //else
            //{
            //    lista = UsuarioLN.BuscarMantenimientoUsuario(entidad);
            //}

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA GEI");
                    using (var m = ws1.Cells[1, 1, row, 6])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 12;
                        m.Merge = true;
                        m.Value = "LISTA GEI " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "DESCRIPCIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(40);
                    ws1.Cells["C" + row].Value = "AR2";
                    ws1.Cells["C" + row].AutoFitColumns(10);
                    ws1.Cells["D" + row].Value = "AR4";
                    ws1.Cells["D" + row].AutoFitColumns(10);
                    ws1.Cells["E" + row].Value = "AR5";
                    ws1.Cells["E" + row].AutoFitColumns(10);
                    ws1.Cells["F" + row].Value = "AR6";
                    ws1.Cells["F" + row].AutoFitColumns(10);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "E", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "F", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (GasEfectoInvernaderoBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_GEI;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            ws1.Cells["C" + row].Value = dt_fila.AR2;
                            ws1.Cells["D" + row].Value = dt_fila.AR4;
                            ws1.Cells["E" + row].Value = dt_fila.AR5;
                            ws1.Cells["F" + row].Value = dt_fila.AR6;
                            formatoDetalle(ws1, "A", "F", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_GEI_" + DateTime.Now.ToString() + ".xlsx";
                    Response.Clear();
                    byte[] dataByte = package.GetAsByteArray();
                    Response.AddHeader("Content-Disposition", "inline;filename=\"" + strFileName + "\"");
                    Response.AddHeader("Content-Length", dataByte.Length.ToString());
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.BinaryWrite(dataByte);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void ExportarMantenimientoEnfoques(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<EnfoqueBE>(item);
                    ExportarToExcelMantenimientoEnfoques(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoEnfoques(EnfoqueBE entidad)
        {
            List<EnfoqueBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = EnfoqueLN.ListarEnfoqueExcel(entidad);
            //}
            //else
            //{
            //    lista = UsuarioLN.BuscarMantenimientoUsuario(entidad);
            //}

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA ENFOQUE");
                    using (var m = ws1.Cells[1, 1, row, 3])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA ENFOQUE " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "DESCRIPCIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(40);
                    ws1.Cells["C" + row].Value = "DESCRIPCIÓN_MEDMIT";
                    ws1.Cells["C" + row].AutoFitColumns(60);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (EnfoqueBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_ENFOQUE;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            ws1.Cells["C" + row].Value = dt_fila.DESCRIPCION_MEDMIT;
                            formatoDetalle(ws1, "A", "C", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_ENFOQUE_" + DateTime.Now.ToString() + ".xlsx";
                    Response.Clear();
                    byte[] dataByte = package.GetAsByteArray();
                    Response.AddHeader("Content-Disposition", "inline;filename=\"" + strFileName + "\"");
                    Response.AddHeader("Content-Length", dataByte.Length.ToString());
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.BinaryWrite(dataByte);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void FormatoCelda(ExcelWorksheet ws1, string letra, int row, int color1, int color2, int color3, int fontc1, int fontc2, int fontc3)
        {
            using (var m = ws1.Cells[letra + row + ":" + letra + row])
            {
                m.Style.Font.Bold = true;
                m.Style.WrapText = false;
                m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                m.Style.Fill.PatternType = ExcelFillStyle.Solid;
                m.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(color1, color2, color3));
                m.Style.Font.Color.SetColor(Color.FromArgb(fontc1, fontc2, fontc3));
                m.Style.Font.Size = 12;
                m.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                m.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                m.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                m.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                m.Style.Border.Top.Color.SetColor(Color.FromArgb(color1, color2, color3));
                m.Style.Border.Left.Color.SetColor(Color.FromArgb(color1, color2, color3));
                m.Style.Border.Right.Color.SetColor(Color.FromArgb(color1, color2, color3));
                m.Style.Border.Bottom.Color.SetColor(Color.FromArgb(color1, color2, color3));
            }

        }

        private void formatoDetalle(ExcelWorksheet ws1, string letraI, string letraF, int row)
        {
            using (var m = ws1.Cells[letraI + row + ":" + letraF + row])
            {
                m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            }
        }

    }
}