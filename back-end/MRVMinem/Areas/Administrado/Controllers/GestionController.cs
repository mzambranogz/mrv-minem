﻿using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MRVMinem.Core;

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

        public ActionResult Sesion()
        {
            return View();
        }

        public JsonResult ListaIniciativas(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativa(entidad);
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

    }
}