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
using MRVMinem.Tags;

namespace MRVMinem.Controllers
{
    [Autenticado]
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
                entidad = new InstitucionBE() { cantidad_registros = 10, order_by = "NOMBRE_INSTITUCION", order_orden = "ASC", pagina = 1, buscar = "" };
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
                entidad = new UbicacionBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1, buscar = "" };
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
                entidad = new EscenarioBE() { cantidad_registros = 10, order_by = "NOMBRE_MEDMIT", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvEscenario modelo = new MvEscenario();
            modelo.ListaEscenarios = EscenarioLN.ListaEscenariosPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarEscenario(EscenarioBE entidad)
        {
            EscenarioBE lista = EscenarioLN.GetEscenarioPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaEscenarios(EscenarioBE entidad)
        {
            List<EscenarioBE> lista = EscenarioLN.ListaEscenariosPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarEscenario(EscenarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = EscenarioLN.RegistrarEscenario(entidad);
            }
            else
            {
                entidad = EscenarioLN.ActualizarEscenario(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarEscenarios(EscenarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = EscenarioLN.EliminarEscenario(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public ActionResult Energeticos(EnergeticoBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new EnergeticoBE() { cantidad_registros = 10, order_by = "ID_ENERG", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvEnergetico modelo = new MvEnergetico();
            modelo.ListaEnergetico = EnergeticoLN.ListarEnergeticoPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarEnergetico(EnergeticoBE entidad)
        {
            EnergeticoBE lista = EnergeticoLN.GetEnergeticoPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaEnergeticos(EnergeticoBE entidad)
        {
            List<EnergeticoBE> lista = EnergeticoLN.ListarEnergeticoPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarEnergetico(EnergeticoBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = EnergeticoLN.RegistrarEnergetico(entidad);
            }
            else
            {
                entidad = EnergeticoLN.ActualizarEnergetico(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarEnergetico(EnergeticoBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = EnergeticoLN.EliminarEnergetico(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }


        public ActionResult MedidaMitigacionDetalle()
        {
            MvParametro modelo = new MvParametro();
            MedidaMitigacionBE medida = new MedidaMitigacionBE();
            modelo.listaControl = TipoControlLN.listarTipoControl();
            modelo.listaParametro = ParametroLN.ListarParametroControl();
            modelo.listaGrupo = GrupoIniciativaLN.listarGrupoIniciativa();
            modelo.listaMedida = MedidaMitigacionLN.ListarMedidaMitigacion(medida);
            modelo.listaFactor = FactorLN.listarFactores();
            modelo.listaParametroInd = ParametroIndicadorLN.ListarParametroIndicador();
            modelo.listaVariable = VariableLN.ListaVariabes(new VariableBE() { ID_VARIABLE = 0 });
            modelo.menor = getMenorControl(modelo.listaControl);
            return View(modelo);
        }

        public JsonResult ListarMedidaMitigacionDetalle()
        {
            List<ParametroIndicadorBE> lista = ParametroIndicadorLN.ListarParametroIndicador();
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult GetMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            List<ParametroIndicadorBE> lista = ParametroIndicadorLN.GetMedidaMitigacionDetalle(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarMedidaMitigacionDetalle(ParametroIndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = ParametroIndicadorLN.RegistrarMedidaMitigacionDetalle(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        //////////////////////////////////////////////////// MANTENIMIENTO MEDIDA FACTORES

        public ActionResult MedidaFactoresData()
        {
            MvParametro modelo = new MvParametro();
            MedidaMitigacionBE medida = new MedidaMitigacionBE();
            modelo.listaMedida = MedidaMitigacionLN.ListarMedidaMitigacion(medida);
            modelo.listaFactor = FactorLN.listarFactores();
            modelo.listaMedidaFactor = FactorLN.listarMedidaFactor();

            //modelo.listaControl = TipoControlLN.listarTipoControl();
            //modelo.listaParametro = ParametroLN.ListarParametroControl();
            //modelo.listaGrupo = GrupoIniciativaLN.listarGrupoIniciativa();


            //modelo.listaParametroInd = ParametroIndicadorLN.ListarParametroIndicador();
            //modelo.menor = getMenorControl(modelo.listaControl);
            return View(modelo);
        }

        public JsonResult ListarTablaMedidaFactor()
        {
            List<FactorBE> listaMedidaFctor = FactorLN.listarMedidaFactor();
            var jsonResult = Json(listaMedidaFctor, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaMedidaFactor(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.listarMedidaFactor();
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult GetMedidaFactor(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.GetMedidaFactor(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarCabeceraFactor(FactorParametroBE entidad)
        {
            List<FactorParametroBE> lista = FactorLN.ListarCabeceraFactor(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarCuerpoFactor(FactorParametroBE entidad)
        {
            List<FactorParametroBE> lista = FactorLN.ListarCuerpoFactor(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarDatosFactorData(FactorParametroDataBE entidad)
        {
            List<FactorParametroDataBE> lista = FactorLN.ListarDatosFactorData(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult GuardarFactores(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = FactorLN.GuardarFactores(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult GuardarMedidaFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = FactorLN.GuardarMedidaFactor(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ValidarMedidaFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = FactorLN.ValidarMedidaFactor(entidad);
            if (entidad.VALIDAR > 0)
            {
                itemRespuesta.success = false;
            }
            else
            {
                itemRespuesta.success = true;
            }

            return Respuesta(itemRespuesta);
        }
        ////////////////////////////////////////// MANTENIMIENTO FACTORES

        public ActionResult MantenimientoFactores(FactorBE entidad)
        {
            MvFactor Modelo = new MvFactor();
            if (entidad.pagina == 0)
            {
                entidad.cantidad_registros = 10;
                entidad.pagina = 1;
                entidad.order_by = "NOMBRE_FACTOR";
                entidad.order_orden = "ASC";
            }

            Modelo.ListaFactores = FactorLN.ListaFactorPaginado(entidad);
            Modelo.ListaControl = TipoControlLN.listarTipoControl();
            Modelo.ListaParametro = ParametroLN.ListarParametroControl();
            return View(Modelo);
        }

        public JsonResult GetFactorParametro(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.ListaFactor(entidad);
            if (lista != null)
            {
                foreach (var item in lista)
                {
                    item.ListaFactorParametro = FactorLN.ListaFactorParametro(item);
                }
            }

            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistraParametrosFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = FactorLN.RegistraFactor(entidad);

            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.message;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListaFactores(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.ListaFactorPaginado(entidad);

            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        /////////// exportar excel
        public void ExportarMantenimientoInstitucion(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<InstitucionBE>(item);
                    ExportarToExcelMantenimientoInstitucion(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoInstitucion(InstitucionBE entidad)
        {
            List<InstitucionBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = InstitucionLN.ListarInstitucionExcel(entidad);
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
                    var ws1 = package.Workbook.Worksheets.Add("LISTA INSTITUCION");
                    using (var m = ws1.Cells[1, 1, row, 5])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA INSTITUCION " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "INSTITUCIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(40);
                    ws1.Cells["C" + row].Value = "R.U.C.";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "DIRECCIÓN";
                    ws1.Cells["D" + row].AutoFitColumns(40);
                    ws1.Cells["E" + row].Value = "SECTOR";
                    ws1.Cells["E" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "E", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (InstitucionBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_INSTITUCION;
                            ws1.Cells["B" + row].Value = dt_fila.NOMBRE_INSTITUCION;
                            ws1.Cells["C" + row].Value = dt_fila.RUC_INSTITUCION;
                            ws1.Cells["D" + row].Value = dt_fila.DIRECCION_INSTITUCION;
                            ws1.Cells["E" + row].Value = dt_fila.SECTOR_INSTITUCION;
                            formatoDetalle(ws1, "A", "E", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_INSTITUCION_" + DateTime.Now.ToString() + ".xlsx";
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

        public void ExportarMantenimientoUbicacion(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<UbicacionBE>(item);
                    ExportarToExcelMantenimientoUbicacion(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
            lista = UbicacionLN.ListarUbicacionExcel(entidad);
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
                    var ws1 = package.Workbook.Worksheets.Add("LISTA UBICACION");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA UBICACION " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
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
                        foreach (UbicacionBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_UBICACION;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_UBICACION_" + DateTime.Now.ToString() + ".xlsx";
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
                    ws1.View.FreezePanes(4, 1);
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
                    ws1.View.FreezePanes(4, 1);
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
                    ws1.View.FreezePanes(4, 1);
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
                    ws1.View.FreezePanes(4, 1);
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

        public void ExportarMantenimientoEscenarios(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<EscenarioBE>(item);
                    ExportarToExcelMantenimientoEscenarios(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoEscenarios(EscenarioBE entidad)
        {
            List<EscenarioBE> lista = null;
            lista = EscenarioLN.ListarEscenarioExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA ESCENARIO");
                    using (var m = ws1.Cells[1, 1, row, 9])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA ESCENARIO " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "AÑO";
                    ws1.Cells["B" + row].AutoFitColumns(10);
                    ws1.Cells["C" + row].Value = "MEDIDA MITIGACIÓN";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "BAU EMISIÓN";
                    ws1.Cells["D" + row].AutoFitColumns(20);
                    ws1.Cells["E" + row].Value = "MITIGACIÓN EMISIÓN";
                    ws1.Cells["E" + row].AutoFitColumns(20);
                    ws1.Cells["F" + row].Value = "REDUCCIÓN";
                    ws1.Cells["F" + row].AutoFitColumns(20);
                    ws1.Cells["G" + row].Value = "VALOR SOFTWARE";
                    ws1.Cells["G" + row].AutoFitColumns(20);
                    ws1.Cells["H" + row].Value = "EXPOST";
                    ws1.Cells["H" + row].AutoFitColumns(20);
                    ws1.Cells["I" + row].Value = "META ANUAL";
                    ws1.Cells["I" + row].AutoFitColumns(20);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "E", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "F", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "G", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "H", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "I", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (EscenarioBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_ESCENARIO;
                            ws1.Cells["B" + row].Value = dt_fila.ANNO;
                            ws1.Cells["C" + row].Value = dt_fila.NOMBRE_MEDMIT;
                            ws1.Cells["D" + row].Value = dt_fila.BAU_EMISION;
                            ws1.Cells["E" + row].Value = dt_fila.MIT_EMISION;
                            ws1.Cells["F" + row].Value = dt_fila.REDUCCION;
                            ws1.Cells["G" + row].Value = dt_fila.VALOR_SOFTWARE;
                            ws1.Cells["H" + row].Value = dt_fila.EXPOST;
                            ws1.Cells["I" + row].Value = dt_fila.META_ANUAL;
                            formatoDetalle(ws1, "A", "I", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_ESCENARIO_" + DateTime.Now.ToString() + ".xlsx";
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

        public void ExportarMantenimientoEnergeticos(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<EnergeticoBE>(item);
                    ExportarToExcelMantenimientoEnergeticos(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoEnergeticos(EnergeticoBE entidad)
        {
            List<EnergeticoBE> lista = null;
            lista = EnergeticoLN.ListarEnergeticoExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA ENERGETICO");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA ENERGÉTICO " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
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
                        foreach (EnergeticoBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_ENERG;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_ENERGETICOA_" + DateTime.Now.ToString() + ".xlsx";
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

        private int getMenorControl(List<TipoControlBE> lista)
        {
            var menor = 999999999;
            foreach (var item in lista)
            {
                if (item.ID_TIPO_CONTROL < menor)
                {
                    menor = item.ID_TIPO_CONTROL;
                }
            }
            return menor;
        }

    }
}