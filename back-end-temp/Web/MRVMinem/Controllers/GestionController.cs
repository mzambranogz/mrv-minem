using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;

namespace MRVMinem.Controllers
{
    public class GestionController : BaseController
    {
        // GET: Gestion
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AccionMitigacion()
        {
            return View();
        }
        public ActionResult Sesion()
        {
            return View();
        }

        public ActionResult IniciativaMitigacion(int id, int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.iniciativa = ini;
            return View(modelo);
        }

        public ActionResult CorregirIniciativa(int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.iniciativa = ini;
            return View(modelo);
        }

        public ActionResult RevisarIniciativa(int id, int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.iniciativa = ini;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult DetalleIndicador(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }

        public ActionResult RevisarDetalleIndicador(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult CorregirDetalleIndicador(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }

        public ActionResult RevisarAdminDetalleIndicador(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult EvaluarIniciativaDetalle(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult VerificarIniciativaDetalle(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult SeguimientoIniciativa(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }
        ////////////////////
        public ActionResult MantenimientoTablas()
        {
            return View();
        }

        public ActionResult MantenimientoUsuario()
        {
            return View();
        }
        ////////////////////////////
        public JsonResult ListaIniciativasEspecialista(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaEspecialista(entidad);
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

        public JsonResult ListaIniciativasUsuario(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaUsuario(entidad);
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

        public JsonResult ListarGEI(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = GasEfectoInvernaderoLN.ListarGEI(entidad);
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

        public JsonResult ListarMoneda(MonedaBE entidad)
        {
            List<MonedaBE> lista = MonedaLN.ListarMoneda(entidad);
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

        public JsonResult RegistrarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.RegistrarIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            return Respuesta(itemRespuesta);
        }

        public JsonResult ActualizarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.ActualizarIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ID_ESTADO.ToString();
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

        public JsonResult ObservacionIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.ObservacionIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.AprobarIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarDetalleIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> lista = IndicadorLN.ListarDetalleIndicador(entidad);
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

        public JsonResult CalcularIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> lista = IndicadorLN.CalcularIndicador(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.RegistrarDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AvanceDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.AvanceDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarDetalleIndicadorRevision(IndicadorBE entidad)
        {
            List<IndicadorBE> lista = IndicadorLN.ListarDetalleIndicadorRevision(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObservacionDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.ObservacionDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.AprobarDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult CorregirDetIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.CorregirDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult CorregirAvanceDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.CorregirAvanceDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarAdminIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.AprobarAdminIniciativaDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        
        public JsonResult EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.EvaluarIniciativaDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }
        
        public JsonResult ListaIniciativasEvaluar(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaEvaluar(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult VerificarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.VerificarIniciativaDetalleIndicador(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult MostrarSeguimiento(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.MostrarSeguimiento(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        //////////////////////////////////////////
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

        public JsonResult EditarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.EditarUsuario(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarRol(RolBE entidad)
        {
            List<RolBE> lista = RolLN.ListarRol(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        /*Session["VARIABLE"] = entidad;

            entidad = (UsuarioBE)Session["VARIABLE"];*/

        ////// CAMBIOS EDUARDO CH

        public JsonResult ConsultaNotificaciones(NotificacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = NotificacionLN.ConsultaNotificaciones(entidad.ID_USUARIO, entidad.ID_ROL);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.NOTIFICACIONES.ToString();
            return Respuesta(itemRespuesta);
        }

        public ActionResult RegistroIniciativaMitigacion()
        {
            return View();
        }

        public ActionResult NuevaIniciativaMitigacion(int id)
        {
            MvIniciativa modelo = new MvIniciativa();
            modelo.id = id;
            return View(modelo);
        }

        public ActionResult Notificacion()
        {
            return View();
        }

        public JsonResult ListarNotificacion(NotificacionBE entidad)
        {
            //entidad.ROL = Session["rol"].ToString();
            List<NotificacionBE> lista = NotificacionLN.ListarNotificacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public ActionResult DetalleNotificacion(NotificacionBE entidad)
        {
            NotificacionBE modelo = NotificacionLN.GetNotificacion(entidad);
            return View(modelo);
        }

        public JsonResult RegistraVistoNotificacion(NotificacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = NotificacionLN.RegistraVistoNotificacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.message = entidad.OK? "Se registro la visualización de la notificación": "Ocurrio error al registrar la visualización de la notificación";
            return Respuesta(itemRespuesta);
        }
    }
}