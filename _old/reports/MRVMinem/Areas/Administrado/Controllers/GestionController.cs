﻿using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MRVMinem.Core;
using MRVMinem.Areas.Administrado.Models;
using MRVMinem.Areas.Administrado.Repositorio;
using System.Web.Configuration;

namespace MRVMinem.Areas.Administrado.Controllers
{
    public class GestionController : BaseController
    {
        // GET: Administrado/Gestion
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegistroIniciativaMitigacion()
        {
            return View();
        }

        public ActionResult DetalleIndicador()
        {
            return View();
        }

        public ActionResult Sesion(string id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }

        public ActionResult AccionMitigacion()
        {
            return View();
        }

        public ActionResult NuevaIniciativaMitigacion()
        {
            return View();
        }

        public ActionResult TablaMantenimiento()
        {
            return View();
        }

        public ActionResult MantenimientoUsuario()
        {
            return View();
        }

        public JsonResult ListaIniciativasUsuario(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaUsuario(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaIniciativasGeneral(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaGeneral(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarMoneda(MonedaBE entidad)
        {
            List<MonedaBE> lista = MonedaLN.ListarMoneda(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarGEI(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = GasEfectoInvernaderoLN.ListarGEI(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarENERG(EnergeticoBE entidad)
        {
            List<EnergeticoBE> lista = EnergeticoLN.ListarENERG(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> lista = UbicacionLN.ListarUbicacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarTipoVehiculo(TipoVehiculoBE entidad)
        {
            List<TipoVehiculoBE> lista = TipoVehiculoLN.ListarTipoVehiculo(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarTipoCombustible(TipoCombustibleBE entidad)
        {
            List<TipoCombustibleBE> lista = TipoCombustibleLN.ListarTipoCombustible(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarTipoFuente(TipoFuenteBE entidad)
        {
            List<TipoFuenteBE> lista = TipoFuenteLN.ListarTipoFuente(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarOpciones(RolOpcionesBE entidad)
        {
            List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarRol(RolBE entidad)
        {
            List<RolBE> lista = RolLN.ListarRol(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = UsuarioLN.ListaMantenimientoUsuario(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult SeleccionarMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = UsuarioLN.SeleccionarMantenimientoUsuario(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObtenerMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ObtenerMedidaMitigacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObtenerInformacionUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = UsuarioLN.ObtenerInformacionUsuario(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.RegistrarIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EditarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.EditarUsuario(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult CargarSeleccionUbicacion(IniciativaBE entidad)
        {
            List<UbicacionBE> lista = IniciativaLN.ListarUbicacionIniciativa(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult CargarSeleccionGei(IniciativaBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = IniciativaLN.ListarGeiIniciativa(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult CargarSeleccionEnergetico(IniciativaBE entidad)
        {
            List<EnergeticoBE> lista = IniciativaLN.ListarEnergeticoIniciativa(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult CargarSeleccionIniciativa(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListarIniciativaAvance(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        public JsonResult ReporteEscenario(EscenarioRptBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string Archivo = Guid.NewGuid().ToString();
            entidad.ID_MEDMIT = 0;
            string NombreRpt = WebConfigurationManager.AppSettings["RutaTemp"] + "\\" + Archivo + ".pdf";
            if (new Reporte().GenerarPDFReporte(entidad, NombreRpt))
            {
                itemRespuesta.success = true;
                itemRespuesta.extra = NombreRpt;
            }
            else
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = "";
            }
            return Respuesta(itemRespuesta);
        }


    }
}