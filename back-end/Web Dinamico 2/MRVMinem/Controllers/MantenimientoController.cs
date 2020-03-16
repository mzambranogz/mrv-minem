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
using System.IO;
using System.Web.Configuration;

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


        public ActionResult MedidaMitigacionDetalle(EnfoqueBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new EnfoqueBE() { cantidad_registros = 10, order_by = "ID_ENFOQUE", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvParametro modelo = new MvParametro();
            MedidaMitigacionBE medida = new MedidaMitigacionBE();
            modelo.listaControl = TipoControlLN.listarTipoControl();
            modelo.listaParametro = ParametroLN.ListarParametroControl();
            modelo.listaGrupo = GrupoIniciativaLN.listarGrupoIniciativa();
            modelo.listaMedida = MedidaMitigacionLN.ListarMedidaMitigacion(medida);
            modelo.listaFactor = FactorLN.listarFactores();
            modelo.listaParametroInd = ParametroIndicadorLN.ListarParametroIndicador(entidad);
            modelo.listaVariable = VariableLN.ListaVariables(new VariableBE() { ID_VARIABLE = 0 });
            modelo.menor = getMenorControl(modelo.listaControl);
            return View(modelo);
        }

        public JsonResult ListarMedidaMitigacionDetalle(EnfoqueBE entidad)
        {
            List<ParametroIndicadorBE> lista = ParametroIndicadorLN.ListarParametroIndicador(entidad);
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

        public JsonResult ValidarMedidaEnfoque(EnfoqueBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = EnfoqueLN.ValidarMedidaEnfoque(entidad);
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

        //////////////////////////////////////////////////// MANTENIMIENTO ENFOQUE FACTORES

        public ActionResult EnfoqueFactor(FactorBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new FactorBE() { cantidad_registros = 10, order_by = "ID_ENFOQUE", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvParametro modelo = new MvParametro();
            modelo.listaEnfoque = EnfoqueLN.ListarEnfoque();
            modelo.listaFactor = FactorLN.listarFactores();
            modelo.listaEnfoqueFactor = FactorLN.listarEnfoqueFactor(entidad);
            return View(modelo);
        }

        public JsonResult ListarTablaEnfoqueFactor(FactorBE entidad)
        {
            List<FactorBE> listaEnfoqueFctor = FactorLN.listarEnfoqueFactor(entidad);
            var jsonResult = Json(listaEnfoqueFctor, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        //public JsonResult ListaMedidaFactor(FactorBE entidad)
        //{
        //    List<FactorBE> lista = FactorLN.listarMedidaFactor();
        //    var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
        //    jsonResult.MaxJsonLength = int.MaxValue;
        //    return jsonResult;
        //}

        public JsonResult GetEnfoqueFactor(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.GetEnfoqueFactor(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        //public JsonResult ListarCabeceraFactor(FactorParametroBE entidad)
        //{
        //    List<FactorParametroBE> lista = FactorLN.ListarCabeceraFactor(entidad);
        //    var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
        //    jsonResult.MaxJsonLength = int.MaxValue;
        //    return jsonResult;
        //}

        //public JsonResult ListarCuerpoFactor(FactorParametroBE entidad)
        //{
        //    List<FactorParametroBE> lista = FactorLN.ListarCuerpoFactor(entidad);
        //    var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
        //    jsonResult.MaxJsonLength = int.MaxValue;
        //    return jsonResult;
        //}

        //public JsonResult ListarDatosFactorData(FactorParametroDataBE entidad)
        //{
        //    List<FactorParametroDataBE> lista = FactorLN.ListarDatosFactorData(entidad);
        //    var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
        //    jsonResult.MaxJsonLength = int.MaxValue;
        //    return jsonResult;
        //}

        //public JsonResult GuardarFactores(FactorBE entidad)
        //{
        //    ResponseEntity itemRespuesta = new ResponseEntity();
        //    entidad = FactorLN.GuardarFactores(entidad);
        //    itemRespuesta.success = entidad.OK;
        //    return Respuesta(itemRespuesta);
        //}

        public JsonResult GuardarEnfoqueFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = FactorLN.GuardarEnfoqueFactor(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ValidarEnfoqueFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = FactorLN.ValidarEnfoqueFactor(entidad);
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

        /////////////////////////////////////  MANTENIMIENTO MEDIDA MITIGACION

        public ActionResult MedidaMitigacion(MedidaMitigacionBE entidad)
        {
            MvMedidaMitigacion modelo = new MvMedidaMitigacion();
            if (entidad.pagina == 0)
            {
                entidad = new MedidaMitigacionBE() { cantidad_registros = 10, order_by = "ID_MEDMIT", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            modelo.listaMedida = MedidaMitigacionLN.ListaMedidaMitigacionMantenimiento(entidad);
            return View(modelo);
        }

        public JsonResult ListarPaginadoMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListaMedidaMitigacionMantenimiento(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaNamaControl(NamaBE entidad)
        {
            List<NamaBE> lista = NamaLN.ListaNamaControl(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaIPCCControl(IPCCBE entidad)
        {
            List<IPCCBE> lista = IPCCLN.ListaIPCCControl(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarMantenimientoMedida(HttpPostedFileBase fledocumentos, FormCollection forms)
        {
            MedidaMitigacionBE entidad = new MedidaMitigacionBE();

            entidad.ID_MEDMIT = int.Parse(Request.Form["ID_MEDMIT"].ToString());
            entidad.NOMBRE_MEDMIT = Request.Form["NOMBRE_MEDMIT"].ToString();
            entidad.NUMERO_MEDMIT = Request.Form["NUMERO_MEDMIT"].ToString();
            entidad.DESCRIPCION_MEDMIT = Request.Form["DESCRIPCION_MEDMIT"].ToString();
            entidad.ID_NAMA = int.Parse(Request.Form["ID_NAMA"].ToString());
            entidad.OBJETIVO_MEDMIT = Request.Form["OBJETIVO_MEDMIT"].ToString();
            entidad.ID_IPCC = int.Parse(Request.Form["ID_IPCC"].ToString());

            ResponseEntity itemRespuesta = new ResponseEntity();

            string nomArchivoSave = "";
            string nomOriginal = "";
            if (fledocumentos != null)
            {
                nomOriginal = fledocumentos.FileName;
                var content = new byte[fledocumentos.ContentLength];
                fledocumentos.InputStream.Read(content, 0, fledocumentos.ContentLength);
                double tamanio = (fledocumentos.ContentLength / 1024);
                nomArchivoSave = Guid.NewGuid() + Path.GetExtension(fledocumentos.FileName).ToString();
            }else
            {
                nomArchivoSave = "nul";
            }
            entidad.ADJUNTO = nomArchivoSave;
            entidad.ADJUNTO_BASE = nomOriginal;
            entidad = MedidaMitigacionLN.GuardarMedidaMitigacion(entidad);

           if (!entidad.OK)
           {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
           }
           else
           {
                if (fledocumentos != null)
                {
                    try
                    {
                        var carpeta = WebConfigurationManager.AppSettings.Get("IMG");
                        var ruta = Path.Combine(carpeta, nomArchivoSave);
                        fledocumentos.SaveAs(ruta);
                        itemRespuesta.success = true;
                    }
                    catch (Exception e)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.extra = e.Message;
                    }
                }
                itemRespuesta.success = true;
                
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult BuscarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.BuscarMedidaMitigacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult EliminarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = MedidaMitigacionLN.EliminarMedidaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////////////////////////////// MANTENIMIENTO IPCC

        public ActionResult IPCC(IPCCBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new IPCCBE() { cantidad_registros = 10, order_by = "ID_IPCC", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvIPCC modelo = new MvIPCC();
            modelo.listaIPCC = IPCCLN.ListarIPCCPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarIPCC(IPCCBE entidad)
        {
            IPCCBE lista = IPCCLN.GetIPCCPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaIPCC(IPCCBE entidad)
        {
            List<IPCCBE> lista = IPCCLN.ListarIPCCPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarIPCC(IPCCBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = IPCCLN.RegistrarIPCC(entidad);
            }
            else
            {
                entidad = IPCCLN.ActualizarIPCC(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarIPCC(IPCCBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IPCCLN.EliminarIPCC(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////////////////////////////// MANTENIMIENTO TIPO INICIATIVA

        public ActionResult TipoIniciativa(TipoIniciativaBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new TipoIniciativaBE() { cantidad_registros = 10, order_by = "ID_TIPO_INICIATIVA", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvTipoIniciativa modelo = new MvTipoIniciativa();
            modelo.listaTipoIniciativa = TipoIniciativaLN.ListarTipoIniciativaPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarTipoIniciativa(TipoIniciativaBE entidad)
        {
            TipoIniciativaBE lista = TipoIniciativaLN.GetTipoIniciativaPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaTipoIniciativa(TipoIniciativaBE entidad)
        {
            List<TipoIniciativaBE> lista = TipoIniciativaLN.ListarTipoIniciativaPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarTipoIniciativa(TipoIniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = TipoIniciativaLN.RegistrarTipoIniciativa(entidad);
            }
            else
            {
                entidad = TipoIniciativaLN.ActualizarTipoIniciativa(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarTipoIniciativa(TipoIniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = TipoIniciativaLN.EliminarTipoIniciativa(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////////////////////////////// MANTENIMIENTO NAMA

        public ActionResult Nama(NamaBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new NamaBE() { cantidad_registros = 10, order_by = "ID_NAMA", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvNama modelo = new MvNama();
            modelo.listaNamas = NamaLN.ListarNamaPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarNama(NamaBE entidad)
        {
            NamaBE lista = NamaLN.GetNamaPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaNama(NamaBE entidad)
        {
            List<NamaBE> lista = NamaLN.ListarNamaPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarNama(NamaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLG_ESTADO == "1")
            {
                entidad = NamaLN.RegistrarNama(entidad);
            }
            else
            {
                entidad = NamaLN.ActualizarNama(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarNama(NamaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = NamaLN.EliminarNama(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////////////////////////////// MANTENIMIENTO PLAZO

        public ActionResult Plazo(PlazoBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new PlazoBE() { cantidad_registros = 10, order_by = "ID_PLAZO_ETAPA_ESTADO", order_orden = "ASC", pagina = 1, buscar = "" };
            }
            MvPlazo modelo = new MvPlazo();
            modelo.listaPlazo = PlazoLN.ListarPlazoPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarPlazo(PlazoBE entidad)
        {
            PlazoBE lista = PlazoLN.GetPlazoPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaPlazo(PlazoBE entidad)
        {
            List<PlazoBE> lista = PlazoLN.ListarPlazoPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarPlazo(PlazoBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = PlazoLN.ActualizarPlazo(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        /////////// exportar excel

        //================================================================== MANTENIMIENTO ENFOQUE FACTOR

        public void ExportarMantenimientoEnfoqueFactor(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<FactorBE>(item);
                    ExportarToExcelMantenimientoEnfoqueFactor(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoEnfoqueFactor(FactorBE entidad)
        {
            List<FactorBE> lista = null;
            lista = FactorLN.ListarEnfoqueFactorExcel(entidad);
            var limite = getMayorControlF(lista);
            limite += 3;

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA ENFOQUE FACTOR");
                    using (var m = ws1.Cells[1, 1, row, limite])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "ENFOQUE FACTOR " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "ENFOQUE";
                    ws1.Cells["B" + row].AutoFitColumns(50);
                    ws1.Cells["C" + row].Value = "MEDIDA MITIGACIÓN";
                    ws1.Cells["C" + row].AutoFitColumns(70);                    
                    ws1.Cells["D" + row].Value = "FACTOR(ES)";
                    ws1.Cells["D" + row].AutoFitColumns(30);

                    for (var i = 4; i < limite; i++)
                    {
                        ws1.Cells[obtenerLetra(i + 1) + row].Value = "";
                        ws1.Cells[obtenerLetra(i + 1) + row].AutoFitColumns(40);
                        FormatoCelda(ws1, obtenerLetra(i + 1), row, 0, 123, 255, 255, 255, 255);
                    }

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {

                        foreach (FactorBE dt_fila in lista)
                        {
                            var xNum = 4;
                            ws1.Cells["A" + row].Value = dt_fila.ID_ENFOQUE;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION;
                            ws1.Cells["C" + row].Value = dt_fila.NOMBRE_MEDMIT;
                            foreach (var item in dt_fila.listaFactor)
                            {
                                ws1.Cells[obtenerLetra(xNum) + row].Value = item.NOMBRE_FACTOR;
                                FormatoCelda(ws1, obtenerLetra(xNum), row, 91, 192, 222, 255, 255, 255);
                                xNum++;
                            }

                            formatoDetalle(ws1, "A", obtenerLetra(xNum), row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "ENFOQUE_FACTOR_" + DateTime.Now.ToString() + ".xlsx";
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

        //=================================================================== MANTENIMIENTO MEDIDA ENFOQUE
        public void ExportarMantenimientoMedidaEnfoque(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<EnfoqueBE>(item);
                    ExportarToExcelMantenimientoMedidaEnfoque(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoMedidaEnfoque(EnfoqueBE entidad)
        {
            List<ParametroIndicadorBE> lista = null;
            lista = ParametroIndicadorLN.ListarMedidaEnfoqueExcel(entidad);
            var limite = getMayorControl(lista);
            limite += 3;

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("MEDIDA ENFOQUE");
                    using (var m = ws1.Cells[1, 1, row, limite])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "MEDIDA ENFOQUE " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "MEDIDA MITIGACIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(70);
                    ws1.Cells["C" + row].Value = "ENFOQUE";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "ESTRUCTURA";
                    ws1.Cells["D" + row].AutoFitColumns(40);

                    for (var i = 4; i < limite; i++)
                    {
                        ws1.Cells[obtenerLetra(i+1) + row].Value = "";
                        ws1.Cells[obtenerLetra(i + 1) + row].AutoFitColumns(40);
                        FormatoCelda(ws1, obtenerLetra(i+1), row, 0, 123, 255, 255, 255, 255);
                    }

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        
                        foreach (ParametroIndicadorBE dt_fila in lista)
                        {
                            var xNum = 4;
                            ws1.Cells["A" + row].Value = dt_fila.ID_ENFOQUE;
                            ws1.Cells["B" + row].Value = dt_fila.MEDIDA_MIT;
                            ws1.Cells["C" + row].Value = dt_fila.ENFOQUE;
                            foreach (var item in dt_fila.ListaParametroInd)
                            {
                                ws1.Cells[obtenerLetra(xNum) + row].Value = item.NOMBRE_PARAMETRO;
                                if (item.ID_GRUPO_INDICADOR == 1)
                                {
                                    FormatoCelda(ws1, obtenerLetra(xNum), row, 40, 167, 69, 255, 255, 255);
                                }
                                else if (item.ID_GRUPO_INDICADOR == 2)
                                {
                                    FormatoCelda(ws1, obtenerLetra(xNum), row, 255, 193, 7, 52, 58, 64);
                                }
                                else if (item.ID_GRUPO_INDICADOR == 3)
                                {
                                    FormatoCelda(ws1, obtenerLetra(xNum), row, 0, 123, 255, 255, 255, 255);
                                }
                                xNum++;
                            }

                            formatoDetalle(ws1, "A", obtenerLetra(xNum), row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "MEDIDA_ENFOQUE_" + DateTime.Now.ToString() + ".xlsx";
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
        //============================= EXCEL MEDIDA MITIGACION

        public void ExportarMantenimientoMedidaMitigacion(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<MedidaMitigacionBE>(item);
                    ExportarToExcelMantenimientoMedidaMitigacion(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = null;
            lista = MedidaMitigacionLN.ListarMedidaMitigacionExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA MEDIDA MITIGACION");
                    using (var m = ws1.Cells[1, 1, row, 6])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA MEDIDA MITIGACION " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "NOMBRE DE LA MEDIDA DE MITIGACIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(70);
                    ws1.Cells["C" + row].Value = "DESCRIPCIÓN CORTA";
                    ws1.Cells["C" + row].AutoFitColumns(15);
                    ws1.Cells["D" + row].Value = "DESCRIPCIÓN LARGA";
                    ws1.Cells["D" + row].AutoFitColumns(100);
                    ws1.Cells["E" + row].Value = "OBJETIVO";
                    ws1.Cells["E" + row].AutoFitColumns(100);
                    ws1.Cells["F" + row].Value = "IPCC";
                    ws1.Cells["F" + row].AutoFitColumns(40);

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
                        foreach (MedidaMitigacionBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_MEDMIT;
                            ws1.Cells["B" + row].Value = dt_fila.NOMBRE_MEDMIT;
                            ws1.Cells["C" + row].Value = dt_fila.NUMERO_MEDMIT;
                            ws1.Cells["D" + row].Value = dt_fila.DESCRIPCION_MEDMIT;
                            ws1.Cells["E" + row].Value = dt_fila.OBJETIVO_MEDMIT;
                            ws1.Cells["F" + row].Value = dt_fila.IPSC_MEDMIT;
                            formatoDetalle(ws1, "A", "F", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_MEDIDA_MITIGACION_" + DateTime.Now.ToString() + ".xlsx";
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



        //=========================================================
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

        ////////////// EXPORTAR IPCC
        public void ExportarMantenimientoIPCC(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<IPCCBE>(item);
                    ExportarToExcelMantenimientoIPCC(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoIPCC(IPCCBE entidad)
        {
            List<IPCCBE> lista = null;
            lista = IPCCLN.ListarIPCCExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA IPCC");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA NAMA " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "IPCC";
                    ws1.Cells["B" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (IPCCBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_IPCC;
                            ws1.Cells["B" + row].Value = dt_fila.IPCC;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_IPCC_" + DateTime.Now.ToString() + ".xlsx";
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
        //============================================================================================================ 

        ////////////// EXPORTAR NAMA
        public void ExportarMantenimientoNama(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<NamaBE>(item);
                    ExportarToExcelMantenimientoNama(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoNama(NamaBE entidad)
        {
            List<NamaBE> lista = null;
            lista = NamaLN.ListarNamaExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA NAMA");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA NAMA " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "NAMA";
                    ws1.Cells["B" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (NamaBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_NAMA;
                            ws1.Cells["B" + row].Value = dt_fila.DESCRIPCION_NAMA;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_NAMA_" + DateTime.Now.ToString() + ".xlsx";
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
        //============================================================================================================ 

        ////////////// EXPORTAR PLAZO
        public void ExportarMantenimientoPlazo(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<PlazoBE>(item);
                    ExportarToExcelMantenimientoPlazo(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoPlazo(PlazoBE entidad)
        {
            List<PlazoBE> lista = null;
            lista = PlazoLN.ListarPlazoExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA PLAZO");
                    using (var m = ws1.Cells[1, 1, row, 6])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA PLAZO " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "ETAPA";
                    ws1.Cells["B" + row].AutoFitColumns(50);
                    ws1.Cells["C" + row].Value = "ESTADO";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "RESPONSABLE";
                    ws1.Cells["D" + row].AutoFitColumns(40);
                    ws1.Cells["E" + row].Value = "DESCRIPCIÓN";
                    ws1.Cells["E" + row].AutoFitColumns(50);
                    ws1.Cells["F" + row].Value = "PLAZO (DÍAS)";
                    ws1.Cells["F" + row].AutoFitColumns(30);

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
                        foreach (PlazoBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_PLAZO_ETAPA_ESTADO;
                            ws1.Cells["B" + row].Value = dt_fila.ETAPA;
                            ws1.Cells["C" + row].Value = dt_fila.ESTADO;
                            ws1.Cells["D" + row].Value = dt_fila.DESCRIPCION_ROL;
                            ws1.Cells["E" + row].Value = dt_fila.DESCRIPCION;
                            ws1.Cells["F" + row].Value = dt_fila.PLAZO;
                            formatoDetalle(ws1, "A", "F", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_PLAZO_" + DateTime.Now.ToString() + ".xlsx";
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
        //============================================================================================================ 

        ////////////// EXPORTAR NAMA
        public void ExportarMantenimientoTipoIniciativa(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<TipoIniciativaBE>(item);
                    ExportarToExcelMantenimientoTipoIniciativa(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoTipoIniciativa(TipoIniciativaBE entidad)
        {
            List<TipoIniciativaBE> lista = null;
            lista = TipoIniciativaLN.ListarTipoIniciativaExcel(entidad);

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("LISTA TIPO INICIATIVA");
                    using (var m = ws1.Cells[1, 1, row, 2])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 10;
                        m.Merge = true;
                        m.Value = "LISTA TIPO INICIATIVA " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(4, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "TIPO INICIATIVA";
                    ws1.Cells["B" + row].AutoFitColumns(40);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (TipoIniciativaBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = dt_fila.ID_TIPO_INICIATIVA;
                            ws1.Cells["B" + row].Value = dt_fila.TIPO_INICIATIVA;
                            formatoDetalle(ws1, "A", "B", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_TIPO_INICIATIVA_" + DateTime.Now.ToString() + ".xlsx";
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

        //==================================================================================================================================

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

        private int getMayorControlF(List<FactorBE> lista)
        {
            var mayor = -1;
            foreach (var item in lista)
            {
                if (item.listaFactor.Count > mayor)
                {
                    mayor = item.listaFactor.Count;
                }
            }
            return mayor;
        }

        private int getMayorControl(List<ParametroIndicadorBE> lista)
        {
            var mayor = -1;
            foreach (var item in lista)
            {
                if (item.ListaParametroInd.Count > mayor)
                {
                    mayor = item.ListaParametroInd.Count;
                }
            }
            return mayor;
        }

        private string obtenerLetra(int num)
        {
            string letra = "";
            if (num == 1) letra = "A";
            if (num == 2) letra = "B";
            if (num == 3) letra = "C";
            if (num == 4) letra = "D";
            if (num == 5) letra = "E";
            if (num == 6) letra = "F";
            if (num == 7) letra = "G";
            if (num == 8) letra = "H";
            if (num == 9) letra = "I";
            if (num == 10) letra = "J";
            if (num == 11) letra = "K";
            if (num == 12) letra = "L";
            if (num == 13) letra = "M";
            if (num == 14) letra = "N";
            if (num == 15) letra = "O";
            if (num == 16) letra = "P";
            if (num == 17) letra = "Q";
            if (num == 18) letra = "R";
            if (num == 19) letra = "S";
            if (num == 20) letra = "T";
            if (num == 21) letra = "U";
            if (num == 22) letra = "V";
            if (num == 23) letra = "W";
            if (num == 24) letra = "X";
            if (num == 25) letra = "Y";
            if (num == 26) letra = "Z";
            return letra;
        }

    }
}