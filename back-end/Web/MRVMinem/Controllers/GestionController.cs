using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Repositorio;
using System.Threading;
using System.Threading.Tasks;
using System.Text;
using System.Net.Mail;
using System.Net.Mime;
using MRVMinem.Models;
using System.Web.Configuration;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Style;

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

        public ActionResult CambiarClave()
        {
            return View();
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

        public ActionResult VerMasIniciativa(int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.iniciativa = ini;
            modelo.detalle = 0;
            return View(modelo);
        }

        public ActionResult VerMasIniciativaDetalle(int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.iniciativa = ini;
            modelo.detalle = 1;
            return View(modelo);
        }

        public ActionResult TerminosCondiciones()
        {
            return View();
        }

        public ActionResult PreguntasFrecuentes()
        {
            return View();
        }

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

        public JsonResult CargarDatosUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = new List<UsuarioBE>();
            entidad = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
            if (entidad.OK)
            {
                lista.Add(entidad);
            }            
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.RegistrarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                    entidad.ASUNTO = "Registro Iniciativa - Entidad " + usuario.INSTITUCION;
                    entidad.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha realizado un registro de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }

            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            return Respuesta(itemRespuesta);
        }

        public JsonResult ActualizarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.ActualizarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                    entidad.ASUNTO = "Observación subsanada Iniciativa - Entidad " + usuario.INSTITUCION;
                    entidad.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de la Iniciativa llamada (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }

            }
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
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                entidad.ASUNTO = "Observación Iniciativa - MRVMinem ";
                entidad.DESCRIPCION = "En la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/>" + entidad.DESCRIPCION + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.AprobarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                entidad.ASUNTO = "Aprobación Iniciativa - MRVMinem ";
                entidad.DESCRIPCION = "Su iniciativa fue revisada y aprobada<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
            }
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

            //entidad = IndicadorLN.RegistrarDetalleIndicador(entidad);
            if (entidad.ID_ESTADO == 1)
            {
                var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
                iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
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
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = entidad.EMAIL_USUARIO;
                iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/>" + entidad.DESCRIPCION + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.AprobarDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = entidad.EMAIL_USUARIO;
                iniciativa.ASUNTO = "Aprobación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores de su iniciativa fueron revisadas y aprobadas<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult CorregirDetIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.CorregirDetalleIndicador(entidad);
            if (entidad.ID_ESTADO == 5)
            {
                var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Observación subsanada de Detalle Indicador - Entidad " + usuario.INSTITUCION;
                iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
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
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Aprobación Iniciativa y Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores y la iniciativa ("+entidad.NOMBRE_INICIATIVA+") fueron revisados y aprobadas por el Administrador MINEM<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }


        public JsonResult EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IndicadorLN.EvaluarIniciativaDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Evaluación Iniciativa y Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores y la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") fueron revisados y aprobadas por el Evaluador MINAM<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
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
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Verificación Iniciativa y Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores y la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") fueron revisados y aprobadas por el Verificador Externo<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
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

        public JsonResult ListaUsuarioMedidaMitigacion(UsuarioMedMitBE entidad)
        {
            List<UsuarioMedMitBE> lista = UsuarioLN.ListaUsuarioMedidaMitigacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult EditarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            if (!string.IsNullOrEmpty(entidad.MEDIDAS))
            {
                entidad.MEDIDAS = entidad.MEDIDAS.Substring(0, entidad.MEDIDAS.Length - 1);
            }
            entidad.USUARIO_REGISTRO = Session["usuario"].ToString();
            entidad.IP_PC = Request.UserHostAddress.ToString().Trim();

            if (entidad.ESTADO == "1")
            {
                InstitucionBE institucion = new InstitucionBE(entidad.ID_SECTOR_INST, entidad.RUC, entidad.INSTITUCION, entidad.DIRECCION);
                institucion = InstitucionLN.registrarInstitucion(institucion);
                if (institucion.ID_INSTITUCION != 0)
                {
                    entidad.ID_INSTITUCION = institucion.ID_INSTITUCION;
                    entidad = UsuarioLN.RegistraUsuario(entidad);
                }
            }
            else
            {
                entidad = UsuarioLN.EditarUsuario(entidad);
            }
            
            if (entidad.OK)
            {
                if (entidad.ESTADO == "1")
                {
                    string perfil = "";
                    string estado = "";
                    if (entidad.ID_ROL == 1)
                    {
                        perfil = "Usuario Administrado";
                    }
                    else if (entidad.ID_ROL == 2)
                    {
                        perfil = "Especialista";
                    }
                    else if (entidad.ID_ROL == 3)
                    {
                        perfil = "Administrador";
                    }
                    else if (entidad.ID_ROL == 4)
                    {
                        perfil = "Evluador";
                    }
                    else if (entidad.ID_ROL == 5)
                    {
                        perfil = "Verificador";
                    }

                    if (entidad.ID_ESTADO_USUARIO == 1) 
                    {
                        estado = " Además, tiene los permisos para acceder al sistema"; 
                    }
                    entidad.ASUNTO = "Registro - MRVMinem ";
                    entidad.DESCRIPCION = entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + "ha sido registrado por el Administrador MINEM con el perfil " + perfil + "." + estado + "<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeUsuarioReg());
                }
                else
                {
                    if ((entidad.ID_ESTADO_ANTERIOR == 0 && entidad.ID_ESTADO_USUARIO == 1) || (entidad.ID_ESTADO_ANTERIOR == 2 && entidad.ID_ESTADO_USUARIO == 1))
                    {
                        EnvioCorreo hilo_correo = new EnvioCorreo(entidad);
                        Task tarea = Task.Factory.StartNew(() => hilo_correo.AprobacionUsuario());
                    }
                }
            }           
            
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

        public JsonResult VerificarClave(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.VerificarClave(entidad);
            itemRespuesta.success = entidad.OK;
            if (!entidad.OK)
            {
                itemRespuesta.extra = entidad.extra;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult CambiarNuevaClave(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = UsuarioLN.CambiarClave(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult validarConfirmarCorreo(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            //entidad = UsuarioLN.validarConfirmarCorreo(entidad);
            //itemRespuesta.success = entidad.OK;
            //itemRespuesta.extra = entidad.extra;
            itemRespuesta.success = true;
            return Respuesta(itemRespuesta);
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
            itemRespuesta.message = entidad.OK ? "Se registro la visualización de la notificación" : "Ocurrio error al registrar la visualización de la notificación";
            return Respuesta(itemRespuesta);
        }

        //Busqueda Simple Privada
        public JsonResult BusquedaSimpleUsuario(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimplePrivado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        public JsonResult BusquedaSimpleEsp(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimpleEsp(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaSimpleMi(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimplePrivadoMi(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        public JsonResult BusquedaSimpleEvaMRV(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimplePrivadoEvaMRV(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaSimpleVerVis(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimplePrivadoVerVis(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        //Busqueda Avanzada Privada
        public JsonResult BusquedaAvanzadaUsuario(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzadaPrivado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaAvanzadaEspecialista(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzadaPrivadoEspecialista(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaAvanzadaAdmMi(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzadaAdmMi(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        public JsonResult BusquedaAvanzadaEvaMRV(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzadaEvaMRV(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaAvanzadaVerVis(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzadaVerVis(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaObservado(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaObservado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaAprobado(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaAprobado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaRevisado(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaRevisado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaEvaluado(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaEvaluado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaVerificado(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaVerificado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaTodo(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaTodo(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaIniciativasVerificar(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaVerificar(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        //cambios 26.01.2020
        public JsonResult RegistrarDetalleIndicador2(HttpPostedFileBase[] fledoc, HttpPostedFileBase[] fledocumentos, IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (fledoc != null)
            {
                foreach (var f in fledoc)
                {
                    if (f != null)
                    {
                        string archivoOriginal = f.FileName;
                        string nomArchivoSave = "";
                        nomArchivoSave = Guid.NewGuid() + Path.GetExtension(f.FileName).ToString();
                        var carpeta = WebConfigurationManager.AppSettings.Get("Sustentatorio");
                        var ruta = Path.Combine(carpeta, nomArchivoSave);
                        f.SaveAs(ruta);


                        if (entidad.ListaIndicadores != null)
                        {
                            foreach (IndicadorBE item in entidad.ListaIndicadores)
                            {
                                if (item.ADJUNTO_BASE != null)
                                {
                                    if (item.ADJUNTO_BASE.Contains(archivoOriginal))
                                    {
                                        item.ADJUNTO = nomArchivoSave;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if (fledocumentos != null)
            {
                foreach (var f in fledocumentos)
                {
                    if (f != null)
                    {
                        string archivoOriginal = f.FileName;
                        string nomArchivoSave = "";
                        nomArchivoSave = Guid.NewGuid() + Path.GetExtension(f.FileName).ToString();
                        var carpeta = WebConfigurationManager.AppSettings.Get("Sustentatorio");
                        var ruta = Path.Combine(carpeta, nomArchivoSave);
                        f.SaveAs(ruta);


                        if (entidad.ListaSustentos != null)
                        {
                            foreach (SustentoIniciativaBE item in entidad.ListaSustentos)
                            {
                                if (item.ADJUNTO_BASE != null)
                                {
                                    if (item.ADJUNTO_BASE.Contains(archivoOriginal))
                                    {
                                        item.ADJUNTO = nomArchivoSave;
                                        break;
                                    }
                                }
                            }
                        }
                        //else
                        //{
                        //    entidad.ListaSustentos = new List<SustentoIniciativaBE>();
                        //}
                        //SustentoIniciativaBE item2 = new SustentoIniciativaBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ADJUNTO = nomArchivoSave };
                        //entidad.ListaSustentos.Add(item2);
                    }
                }
            }

            IndicadorBE indicador = null;
            if (entidad.ListaIndicadores != null)
                indicador = IndicadorLN.RegistraTodosIndicadores(entidad.ListaIndicadores);

            SustentoIniciativaBE sustento = null;
            if (entidad.ListaSustentos != null)
                sustento = IndicadorLN.RegistraTodosSustentoIniciativa(entidad.ListaSustentos);

            entidad = IndicadorLN.RegistrarEnvioDetalle(entidad);

            if (entidad.ID_ESTADO == 1)
            {
                var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
                iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
                iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            return Respuesta(itemRespuesta);
        }

        public JsonResult GetDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            IndicadorBE lista = IndicadorLN.GetDetalleIndicador(entidad);
            string carpetaTemp = WebConfigurationManager.AppSettings["RutaTemp"];
            string carpeta = WebConfigurationManager.AppSettings["Sustentatorio"];
            if (lista != null)
            {
                if (System.IO.File.Exists(carpeta + "\\" + lista.ADJUNTO))
                {
                    System.IO.File.Copy(carpeta + "\\" + lista.ADJUNTO, carpetaTemp + "\\" + lista.ADJUNTO, true);
                    itemRespuesta.success = true;
                }
                itemRespuesta.extra = lista.ADJUNTO;
            }

            return Respuesta(itemRespuesta);
        }

        public JsonResult GeIniciativaSustento(SustentoIniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            List<SustentoIniciativaBE> lista = IniciativaLN.ListaSustentoIniciativa(entidad);
            string carpetaTemp = WebConfigurationManager.AppSettings["RutaTemp"];
            string carpeta = WebConfigurationManager.AppSettings["Sustentatorio"];
            if (lista != null)
            {
                if (System.IO.File.Exists(carpeta + "\\" + lista[0].ADJUNTO))
                {
                    System.IO.File.Copy(carpeta + "\\" + lista[0].ADJUNTO, carpetaTemp + "\\" + lista[0].ADJUNTO, true);
                    itemRespuesta.success = true;
                }
                itemRespuesta.extra = lista[0].ADJUNTO;
            }

            return Respuesta(itemRespuesta);
        }

        //EXPORTAR EXCEL
        public void ExportarToExcelProyectos(IniciativaBE entidad)
        {
            //ProyectoBE proyecto = new ProyectoBE();

            //proyecto.ID_CLIENTE = entidad.IdCliente;
            //proyecto.NOMBRE = entidad.Nombre;
            //proyecto.ID_RESOLUCION = entidad.Resolucion == null ? "-" : entidad.Resolucion;
            //proyecto.ID_PRIORIDAD = entidad.TipoPrioridad == null ? "-" : entidad.TipoPrioridad;
            //proyecto.ID_TIPO_RUBRO = entidad.Rubro;
            //proyecto.ID_SITUACION_PROY = entidad.Situacion;
            //var dt = ProyectoLN.ListaProyectos(proyecto);
            int row = 5;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("PROYECTOS INVERSION SOCIAL");
                    using (var rng = ws1.Cells[1, 1, row, 6])
                    {
                        rng.Style.Font.Bold = true;
                        rng.Style.WrapText = true;
                        rng.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        rng.Style.Font.Size = 14;
                        rng.Merge = true;
                        rng.Value = "PROYECTOS DE INVERSIÓN SOCIAL " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(10);
                    ws1.Cells["B" + row].Value = "NOMBRE DEL PROYECTO";
                    ws1.Cells["B" + row].AutoFitColumns(120);
                    ws1.Cells["C" + row].Value = "RESOLUCIÓN";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "TIPO DE PRIORIDAD";
                    ws1.Cells["D" + row].AutoFitColumns(40);
                    ws1.Cells["E" + row].Value = "RUBRO";
                    ws1.Cells["E" + row].AutoFitColumns(40);
                    ws1.Cells["F" + row].Value = "SITUACIÓN DEL PROYECTO";
                    ws1.Cells["F" + row].AutoFitColumns(50);

                    //using (var rng = ws1.Cells["A" + row + ":F" + row])
                    //{
                    //    rng.Style.Font.Bold = true;
                    //    rng.Style.WrapText = false;
                    //    rng.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    //    rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    //    rng.Style.Fill.PatternType = ExcelFillStyle.Solid;
                    //    rng.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(66, 139, 202));
                    //    rng.Style.Font.Color.SetColor(Color.FromArgb(255, 255, 255));
                    //    rng.Style.Font.Size = 12;
                    //    rng.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    //    rng.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    //    rng.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                    //    rng.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    //    rng.Style.Border.Top.Color.SetColor(Color.FromArgb(221, 221, 221));
                    //    rng.Style.Border.Left.Color.SetColor(Color.FromArgb(255, 255, 255));
                    //    rng.Style.Border.Right.Color.SetColor(Color.FromArgb(255, 255, 255));
                    //    rng.Style.Border.Bottom.Color.SetColor(Color.FromArgb(255, 255, 255));
                    //}
                    //ws1.Row(row).Height = 42;
                    //row++;
                    //if (dt.Count > 0)
                    //{
                    //    var xNum = 0;
                    //    foreach (ProyectoBE dt_fila in dt)
                    //    {
                    //        xNum++;
                    //        ws1.Cells["A" + row].Value = xNum;
                    //        ws1.Cells["B" + row].Value = dt_fila.NOMBRE;
                    //        ws1.Cells["C" + row].Value = dt_fila.RESOLUCION;
                    //        ws1.Cells["D" + row].Value = dt_fila.TIPO_PRIORIDAD;
                    //        ws1.Cells["E" + row].Value = dt_fila.DESC_TIPO_RUBRO;
                    //        ws1.Cells["F" + row].Value = dt_fila.SITUACION_PROYECTO;
                    //        row++;
                    //    }
                    //    row++;
                    //}

                    string strFileName = "PROYECTOS_INVERSION_" + DateTime.Now.ToString() + ".xlsx";
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
    }
}