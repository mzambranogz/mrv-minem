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
using System.Drawing;
using utilitario.minem.gob.pe;
using MRVMinem.Tags;
using MRVMinem.Helper;

namespace MRVMinem.Controllers
{
    [Autenticado]
    public class GestionController : BaseController
    {

        public ActionResult Logout()
        {
            SessionHelper.DestroyUserSession();
            return RedirectToAction("Login", "Home");
        }

        // GET: Gestion
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AccionMitigacion()
        {
            ListaObjeto modelo = new ListaObjeto();
            UsuarioBE usu = new UsuarioBE();
            if (Convert.ToString(Session["rol"]) == "1")
            {
                usu.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
                usu.NOMBRES_USUARIO = Convert.ToString(Session["nombres"]);
                usu.APELLIDOS_USUARIO = Convert.ToString(Session["apellidos"]);
                usu.PRIMER_INICIO = Convert.ToString(Session["primer_inicio"]);
            }
            else
            {
                usu.PRIMER_INICIO = "0";
            }
            
            modelo.usuario = usu;
            //if (Convert.ToInt32(Session["rol"]) == 1)
            //{
            //    modelo.listaIni = IniciativaLN.ListaIniciativaUsuario(ini);
            //}
            //else if (Convert.ToInt32(Session["rol"]) == 2)
            //{
            //    modelo.listaIni = IniciativaLN.ListaIniciativaEspecialista(ini);
            //}
            //else if (Convert.ToInt32(Session["rol"]) == 3)
            //{
            //    modelo.listaIni = IniciativaLN.ListaIniciativaGeneral(ini);
            //}
            //else if (Convert.ToInt32(Session["rol"]) == 4)
            //{
            //    modelo.listaIni = IniciativaLN.ListaIniciativaEvaluar(ini);
            //}
            //else if (Convert.ToInt32(Session["rol"]) == 5)
            //{
            //    modelo.listaIni = IniciativaLN.ListaIniciativaVerificar(ini);
            //}
            return View(modelo);
        }
        public ActionResult Sesion()
        {
            return View();
        }

        public ActionResult IniciativaMitigacion(int id, int ini)
        {
            //MvSesion modelo = new MvSesion();
            //modelo.identificador = id;
            //modelo.iniciativa = ini;
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = ini;
            inic.ID_MEDMIT = id;
            modelo.iniciativa_mit = inic;
            if (ini > 0){
                                
            }
            else if (id > 0)
            {
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            }
            //inic.ID_INICIATIVA = ini;
            //modelo.iniciativa_mit = inic;
            //modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            //modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            //modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            //modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            return View(modelo);
        }

        public ActionResult CorregirIniciativa(int id, int ini)
        {
            MvSesion modelo = new MvSesion();
            modelo.iniciativa = ini;
            return View(modelo);
        }

        public ActionResult RevisarIniciativa(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = ini;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            //modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = EnergeticoLN.ListarENERG(new EnergeticoBE());
            //modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = GasEfectoInvernaderoLN.ListarGEI(new GasEfectoInvernaderoBE());
            modelo.usuario = UsuarioLN.UsuarioIniciativa(modelo.iniciativa_mit.ID_USUARIO);
            modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
            modelo.revision = 1;
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            Session["nombres_destino"] = modelo.usuario.NOMBRES;
            return View(modelo);
        }

        public ActionResult DetalleIndicador(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.menor = IndicadorLN.DetalleIndicadorEnfoque(modelo.iniciativa_mit.ID_INICIATIVA);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);

           modelo.listaParametro = ParametroLN.ListarParametro(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.revision = 0;
                       
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            int enf = IniciativaLN.getIdEnfoqueMenor(inic);
            if (enf == 0)
            {
                if (modelo.menor == 0)
                {
                    modelo.menor = getMenorId(modelo.listaEnfoque);
                    Session["enfoque"] = 0;
                }
            }else
            {
                modelo.menor = enf;
                Session["enfoque"] = enf;
            }            
            return View(modelo);
        }

        public ActionResult RevisarDetalleIndicador(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            IndicadorDataBE ida = new IndicadorDataBE();
            inic.ID_INICIATIVA = id;
            ida.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            //modelo.listaEnfoque = EnfoqueLN.listarEnfoqueIniciativa(modelo.iniciativa_mit.ID_INICIATIVA);
            ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);

            //modelo.listaParametro = ParametroLN.ListarParametro(modelo.iniciativa_mit.ID_MEDMIT);            
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.UsuarioIniciativa(modelo.iniciativa_mit.ID_USUARIO);
            modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
            modelo.id_enfoques = concatenarIdEnfoque(modelo.listaIndData); //add 2-3-20
            modelo.revision = 1;
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            Session["nombres_destino"] = modelo.usuario.NOMBRES;

            string factores = "";
            if (modelo.listaIndData.Count > 0)
            {
                List<int> id_factores = modelo.listaIndData[modelo.listaIndData.Count - 1].id_factores;

                for (var i = 0; i < id_factores.Count; i++)
                {
                    factores += id_factores[i] + ",";
                }
                factores = factores.Substring(0, factores.Length - 1);
                modelo.id_factores = factores;
            }
            
            return View(modelo);
        }

        public ActionResult CorregirDetalleIndicador(int id, int ini)
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
            modelo.menor = IniciativaLN.getIdEnfoqueMenor(inic);
            modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.revision = 0;
            //if (modelo.menor == 0)
            //{
            //    modelo.menor = getMenorId(modelo.listaEnfoque);
            //}
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            return View(modelo);
        }

        public ActionResult RevisarAdminDetalleIndicador(int id, int ini)
        {
            //MvSesion modelo = new MvSesion();
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            IndicadorDataBE ida = new IndicadorDataBE();
            inic.ID_INICIATIVA = id;
            ida.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            //modelo.listaEnfoque = EnfoqueLN.listarEnfoqueIniciativa(modelo.iniciativa_mit.ID_INICIATIVA);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
            ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
            modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
            modelo.revision = 1;
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            Session["id_medida"] = modelo.medida.ID_MEDMIT;
            return View(modelo);
        }

        public ActionResult EvaluarIniciativaDetalle(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            IndicadorDataBE ida = new IndicadorDataBE();
            inic.ID_INICIATIVA = id;
            ida.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            //modelo.listaEnfoque = EnfoqueLN.listarEnfoqueIniciativa(modelo.iniciativa_mit.ID_INICIATIVA);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
            ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
            modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);
            
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.UsuarioAdministrador();
            modelo.revision = 1;
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            Session["usuario_destino"] = modelo.usuario.ID_USUARIO;

            return View(modelo);
        }

        public ActionResult VerificarIniciativaDetalle(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            IndicadorDataBE ida = new IndicadorDataBE();
            inic.ID_INICIATIVA = id;
            ida.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            //modelo.listaEnfoque = EnfoqueLN.listarEnfoqueIniciativa(modelo.iniciativa_mit.ID_INICIATIVA);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
            ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
            modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            if (modelo.iniciativa_mit.ID_ETAPA == 8)
            {
                modelo.usuario = UsuarioLN.UsuarioAdministrador();
            }
            else
            {
                modelo.usuario = UsuarioLN.UsuarioEvaluador();
            }
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            Session["usuario_destino"] = modelo.usuario.ID_USUARIO;
            modelo.revision = 1;
            return View(modelo);
        }

        public ActionResult CambiarClave()
        {
            return View();
        }

        public ActionResult SeguimientoIniciativa(int id, int ini)
        {
            ViewBag.usuario = Session["nombres"];
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
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
            ListaObjeto modelo = new ListaObjeto();
            UsuarioBE usu = new UsuarioBE();
            usu.buscar = "";
            usu.cantidad_registros = 10;
            usu.pagina = 1;
            usu.order_by = "ID_ESTADO_USUARIO";
            usu.order_orden = "ASC";
            modelo.listaUsuario = UsuarioLN.BuscarMantenimientoUsuario(usu);
            return View(modelo);
        }
        ////////////////////////////

        public ActionResult VerMasIniciativa(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = ini;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            return View(modelo);
        }

        public ActionResult VerMasIniciativaDetalle(int id, int ini)
        {
            //MvSesion modelo = new MvSesion();
            //modelo.iniciativa = ini;
            //modelo.detalle = 1;
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            IndicadorDataBE ida = new IndicadorDataBE();
            inic.ID_INICIATIVA = ini;
            ida.ID_INICIATIVA = ini;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);

            modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
            ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
            modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
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
        public ActionResult MapaSitio()
        {
            return View();
        }

        public ActionResult Resultados()
        {
            MvAnno model = new MvAnno();
            var anno = DateTime.Now.Year;
            model.listaAnno = AnnoLN.ListaAnno(anno);
            return View(model);
        }
        ////////////////////////////////////////////////////////7

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

            var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
            entidad = IniciativaLN.RegistrarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    entidad.ASUNTO = "Registro Iniciativa - Entidad " + usuario.INSTITUCION;
                    entidad.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha realizado un registro de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }

            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra2 = Convert.ToString(entidad.ID_INICIATIVA);
            itemRespuesta.extra = entidad.ASUNTO;   // entidad.ID_ESTADO.ToString();
            return Respuesta(itemRespuesta);
        }

        public JsonResult ActualizarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
            entidad = IniciativaLN.ActualizarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    entidad.ASUNTO = "Registro Iniciativa - Entidad " + usuario.INSTITUCION;
                    entidad.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha realizado un registro de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
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

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IniciativaLN.ObservacionIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Observación Iniciativa - MRVMinem";
                iniciativa.DESCRIPCION = "En la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor responder a este correo " + Convert.ToString(Session["correo"]) + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
                                
                //entidad.EMAIL_USUARIO_ORIGEN = Convert.ToString(Session["correo"]);
                //entidad.NOMBRES = Convert.ToString(Session["nombres_destino"]);
                //entidad.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                //entidad.ASUNTO = "Observación Iniciativa - MRVMinem ";
                //entidad.CABECERA_EMAIL = "<strong>Estimado Usuario: &nbsp;</strong><span>" + entidad.NOMBRES + ", se realizó una observación en su iniciativa.</span>";
                //entidad.DESCRIPCION = "En la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>";
                //EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                //Task tarea = Task.Factory.StartNew(() => hilo_correo.enviarMensajeIniciativa());
                //itemRespuesta.extra = entidad.DESCRIPCION;
                //Session["correo_destino"] = "";
                //Session["nombres_destino"] = "";
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IniciativaLN.AprobarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                entidad.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                entidad.ASUNTO = "Aprobación Iniciativa - MRVMinem ";
                entidad.DESCRIPCION = "Su iniciativa fue revisada y aprobada<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ASUNTO;
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

        //public JsonResult RegistrarDetalleIndicador(IndicadorBE entidad)
        //{
        //    ResponseEntity itemRespuesta = new ResponseEntity();

        //    //entidad = IndicadorLN.RegistrarDetalleIndicador(entidad);
        //    if (entidad.ID_ESTADO == 1)
        //    {
        //        var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
        //        IniciativaBE iniciativa = new IniciativaBE();
        //        iniciativa.EMAIL_USUARIO = WebConfigurationManager.AppSettings.Get("UsermailEsp");
        //        iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
        //        iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
        //        EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
        //        Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
        //    }
        //    itemRespuesta.success = entidad.OK;
        //    return Respuesta(itemRespuesta);
        //}

        public JsonResult RegistrarDetalleIndicador(HttpPostedFileBase[] fledoc, HttpPostedFileBase[] fledocumentos, IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            try
            {
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

                            if (entidad.extra.Contains(archivoOriginal))
                            {
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
                            }
                        }
                    }
                }

                //==========================================================
                List<IndicadorDataBE> listaDataE = new List<IndicadorDataBE>();
                if (!string.IsNullOrEmpty(entidad.DATA))
                {                    
                    var valores = entidad.DATA.Split('/');

                    for (int i = 0; i < valores.Length; i++)
                    {
                        var indic = valores[i].Split(';');
                        var valores_det = indic[0].Split('|');
                        IndicadorDataBE dataE = new IndicadorDataBE();
                        List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();
                        for (int j = 0; j < valores_det.Length; j++)
                        {
                            var parametros = valores_det[j].Split(',');

                            IndicadorDataBE ind = new IndicadorDataBE();
                            ind.ID_ENFOQUE = Convert.ToInt32(parametros[0]);
                            ind.ID_MEDMIT = Convert.ToInt32(parametros[1]);
                            ind.ID_PARAMETRO = Convert.ToInt32(parametros[2]);
                            if (Convert.ToString(parametros[3]) == "0")
                            {
                                ind.VALOR = "";
                            }
                            else
                            {
                                ind.VALOR = Convert.ToString(parametros[3]);
                            }
                            listaP.Add(ind);
                        }
                        if (string.IsNullOrEmpty(indic[1])) indic[1] = "0";
                        dataE.ID_INDICADOR = Convert.ToInt32(indic[1]);
                        dataE.listaInd = listaP;
                        listaDataE.Add(dataE);
                    }
                }
                

                //============================================================ add 12-03-2020
                if (Convert.ToInt32(Session["enfoque"]) != entidad.ID_ENFOQUE)
                {
                    if (entidad.ID_ESTADO == 0)
                    {
                        IndicadorLN.deleteRegDetalle(entidad);
                        Session["enfoque"] = entidad.ID_ENFOQUE;
                    }                    
                }
                //==========================================================
                //IndicadorBE indicador = null;
                IndicadorDataBE indicador = null;
                //if (entidad.ListaIndicadores != null)
                if (listaDataE != null && listaDataE.Count > 0)
                {
                    //indicador = IndicadorLN.RegistraTodosIndicadores(entidad.ListaIndicadores);
                    indicador = IndicadorLN.RegistraTodosIndicadoresData(entidad, listaDataE);
                    if (!indicador.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro de indicadores.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                IniciativaBE iniciativaM = null;
                if (!string.IsNullOrEmpty(entidad.ID_INDICADOR_DELETE))
                    iniciativaM = IndicadorLN.EliminarIndicadores(entidad);

                if (!string.IsNullOrEmpty(entidad.ID_INDICADOR_ELIMINAR))
                    iniciativaM = IndicadorLN.EliminarIndicadoresFile(entidad);

                SustentoIniciativaBE sustento = null;
                if (entidad.ListaSustentos != null)
                {
                    sustento = IndicadorLN.RegistraTodosSustentoIniciativa(entidad.ListaSustentos);
                    if (!sustento.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro del sustento.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                if (entidad.ID_ESTADO == 1) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarEnvioDetalle(entidad);
                }
                else if (entidad.ID_ESTADO == 5) //add 30-01-20
                {
                    entidad = IndicadorLN.CorregirDetalleIndicador2(entidad);
                }
                else if (entidad.ID_ESTADO == 0 || entidad.ID_ESTADO == 6) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarAvanceDetalleIndicador(entidad);
                }


                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Observación subsanada de Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                Session["correo_destino"] = "";
                itemRespuesta.success = entidad.OK;
                itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            }
            catch (Exception ex)
            {
                itemRespuesta.success = false;
                itemRespuesta.message = "Ocurrio un problema durante el registro.";
                itemRespuesta.extra = ex.Message;
                Log.Error(ex);
            }

            //itemRespuesta.success = true;
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

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IndicadorLN.ObservacionDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor responder a este correo " + Convert.ToString(Session["correo"]) + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";

                //IniciativaBE iniciativa = new IniciativaBE();
                //iniciativa.EMAIL_USUARIO_ORIGEN = Convert.ToString(Session["correo"]);
                //iniciativa.NOMBRES = Convert.ToString(Session["nombres_destino"]);
                //iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                //iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                //iniciativa.CABECERA_EMAIL = "<strong>Estimado Usuario: &nbsp;</strong><span>" + iniciativa.NOMBRES + ", se realizó una observación a su detalle de indicadores.</span>";
                //iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>";
                //EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                //Task tarea = Task.Factory.StartNew(() => hilo_correo.enviarMensajeIniciativa());
                //itemRespuesta.extra = entidad.DESCRIPCION;
                //Session["correo_destino"] = "";
                //Session["nombres_destino"] = "";
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IndicadorLN.AprobarDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Aprobación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores de su iniciativa fueron revisadas y aprobadas<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
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

        public JsonResult ObservacionAdminDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.ID_MEDMIT = Convert.ToInt32(Session["id_medida"]);
            entidad = IndicadorLN.ObservacionAdminDetalleIndicador(entidad);
            if (entidad.OK)
            {
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/>" + entidad.DESCRIPCION + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
                Session["id_medida"] = 0;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarAdminIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.ID_MEDMIT = Convert.ToInt32(Session["id_medida"]);
            entidad = IndicadorLN.AprobarAdminIniciativaDetalleIndicador(entidad);
            //if (entidad.OK)
            //{
            //    IniciativaBE iniciativa = new IniciativaBE();
            //    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
            //    iniciativa.ASUNTO = "Aprobación Iniciativa y Detalle Indicador - MRVMinem ";
            //    iniciativa.DESCRIPCION = "Los detalles de indicadores y la iniciativa ("+entidad.NOMBRE_INICIATIVA+") fueron revisados y aprobadas por el Administrador MINEM<br/><br/>";
            //    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
            //    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            //    Session["correo_destino"] = "";
            //    Session["id_medida"] = 0;
            //}
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ObservacionEvaluarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.ID_ADMINISTRADOR = Convert.ToInt32(Session["usuario_destino"]);
            entidad = IndicadorLN.ObservacionEvaluarDetalleIndicador(entidad);
            if (entidad.OK)
            {
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/>" + entidad.DESCRIPCION + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                //itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
                Session["usuario_destino"] = 0;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.ID_ADMINISTRADOR = Convert.ToInt32(Session["usuario_destino"]);
            entidad = IndicadorLN.EvaluarIniciativaDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Evaluación Iniciativa y Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "Los detalles de indicadores y la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") fueron revisados y aprobados por el Evaluador MINAM<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                Session["correo_destino"] = "";
                Session["usuario_destino"] = 0;

                BlockChainBE block = new BlockChainBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ID_USUARIO = entidad.ID_USUARIO, IP_PC = Request.UserHostAddress.ToString().Trim() };
                block = BlockChainLN.GeneraBlockChain(block);
                if (block.OK)
                {
                    itemRespuesta.extra = block.ID_BLOCKCHAIN.ToString();
                    itemRespuesta.extra2 = block.HASH;
                }
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

        public JsonResult ObservacionVerificarDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.ID_USUARIO_DESTINO = Convert.ToInt32(Session["usuario_destino"]);
            entidad = IndicadorLN.ObservacionVerificarDetalleIndicador(entidad);
            if (entidad.OK)
            {
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                iniciativa.ASUNTO = "Observación Detalle Indicador - MRVMinem ";
                iniciativa.DESCRIPCION = "En los detalles indicadores de la iniciativa (" + entidad.NOMBRE_INICIATIVA + ") se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/>" + entidad.DESCRIPCION + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                //itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
                Session["usuario_destino"] = 0;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult VerificarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string urlSello = WebConfigurationManager.AppSettings.Get("Sello");

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.NOMBRES = Convert.ToString(Session["nombres"]);
            BlockChainBE block = new BlockChainBE() { ID_INICIATIVA = entidad.ID_INICIATIVA, ID_USUARIO = entidad.ID_USUARIO, IP_PC = Request.UserHostAddress.ToString().Trim() };
            block = BlockChainLN.GeneraBlockChain(block);
            if (block.OK)
            {
                itemRespuesta.extra = block.ID_BLOCKCHAIN.ToString();
                itemRespuesta.extra2 = block.HASH;
            }
            
            entidad.BLOCKCHAIN = block.HASH;
            entidad.ID_USUARIO_DESTINO = Convert.ToInt32(Session["usuario_destino"]);
            entidad = IndicadorLN.VerificarIniciativaDetalleIndicador(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = entidad.ID_INICIATIVA });
                //IniciativaBE iniciativa = new IniciativaBE();
                //iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                //iniciativa.EMAIL_USUARIO = ini.EMAIL_USUARIO;
                //ini.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.ASUNTO = "Su Iniciativa de Mitigación ha sido Evaluada y/o Verificada - MRVMinem ";
                iniciativa.SALUDO = "Estimado Sr(a): " + iniciativa.NOMBRES + "<br/></br/>";
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "Felicitaciones, su Iniciativa de Mitigación ha sido evaluada y/o verificada por nuestro equipo, asimismo ha contribuido en la reducción de los gases de efecto invernadero (GEI). Por ello, lo invitamos a ingresar a nuestra <a href=\"" + urlSello + "\">Plataforma del Sello de Reconocimiento de Energía Sostenible</a><br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                Session["correo_destino"] = "";
                Session["usuario_destino"] = 0;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult DescargarBlockChain(BlockChainBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string nombreArchivo = Guid.NewGuid() + ".pdf";
            string nombrePDF = nombrePDF = WebConfigurationManager.AppSettings["RutaTemp"] + "\\" + nombreArchivo;
            itemRespuesta.success = new ReporteRepositorio().GenerarPDFBlockChain(entidad.ID_BLOCKCHAIN, nombrePDF);
            if (itemRespuesta.success)
                itemRespuesta.extra = nombreArchivo;

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
                    entidad.USUARIO_REGISTRO = Convert.ToString(Session["usuario"]);
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
                    entidad.DESCRIPCION = entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + " ha sido registrado por el Administrador MINEM con el perfil " + perfil + "." + estado + "<br/><br/>";
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
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            try
            {
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
                        }
                    }
                }

                IndicadorBE indicador = null;
                if (entidad.ListaIndicadores != null)
                {
                    indicador = IndicadorLN.RegistraTodosIndicadores(entidad.ListaIndicadores);
                    if (!indicador.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro de indicadores.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                IniciativaBE iniciativaM = null;
                if (!string.IsNullOrEmpty(entidad.ID_INDICADOR_DELETE))
                    iniciativaM = IndicadorLN.EliminarIndicadores(entidad);

                SustentoIniciativaBE sustento = null;
                if (entidad.ListaSustentos != null)
                {
                    sustento = IndicadorLN.RegistraTodosSustentoIniciativa(entidad.ListaSustentos);
                    if (!sustento.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro del sustento.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                if (entidad.ID_ESTADO == 1) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarEnvioDetalle(entidad);
                }
                else if (entidad.ID_ESTADO == 5) //add 30-01-20
                {
                    entidad = IndicadorLN.CorregirDetalleIndicador2(entidad);
                }
                else if (entidad.ID_ESTADO == 0 || entidad.ID_ESTADO == 6) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarAvanceDetalleIndicador(entidad);
                }


                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Observación subsanada de Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                Session["correo_destino"] = "";
                itemRespuesta.success = entidad.OK;
                itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            }
            catch (Exception ex)
            {
                itemRespuesta.success = false;
                itemRespuesta.message = "Ocurrio un problema durante el registro.";
                itemRespuesta.extra = ex.Message;
                Log.Error(ex);
            }

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

        public JsonResult BuscarMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = UsuarioLN.BuscarMantenimientoUsuario(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaBusquedaSimplePrivado(IniciativaBE entidad)
        {
            entidad.ID_ROL = Convert.ToInt32(Session["rol"]);
            List<IniciativaBE> lista = IniciativaLN.ListaBusquedaSimplePrivado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaBusquedaAvanzadaPrivado(IniciativaBE entidad)
        {
            entidad.ID_ROL = Convert.ToInt32(Session["rol"]);
            List<IniciativaBE> lista = IniciativaLN.ListaBusquedaAvanzadoPrivado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ActualizarPrimeraVisita(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = UsuarioLN.ActualizarPrimeraVisita(entidad);
            if (entidad.OK)
            {
                Session["primer_inicio"] = "0";
            }
            itemRespuesta.success = entidad.OK;

            return Respuesta(itemRespuesta);
        }

        public JsonResult GetDeclaracionUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            List<UsuarioBE> lista = UsuarioLN.SeleccionarMantenimientoUsuario(entidad);
            string carpetaTemp = WebConfigurationManager.AppSettings["RutaTemp"];
            string carpeta = WebConfigurationManager.AppSettings["DJ"];
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

        public JsonResult ConsultaUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string descripcion = entidad.DESCRIPCION;
            entidad = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
            entidad.EMAIL_USUARIO_ORIGEN = Convert.ToString(Session["correo"]);
            entidad.ASUNTO = "MRVMinem - Consulta";
            entidad.CABECERA_EMAIL = "le enviamos la siguiente consulta:";
            entidad.DESCRIPCION = descripcion + "<br/><br/>";
            EnvioCorreo hilo_correo = new EnvioCorreo(entidad);
            Task tarea = Task.Factory.StartNew(() => hilo_correo.enviarMensaje());

            itemRespuesta.success = true;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarArchivosGuardados(IniciativaBE entidad)
        {
            List<SustentoIniciativaBE> lista = IniciativaLN.ListarArchivosGuardados(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult CalcularIndicadorDinamico(string Valor)
        {
            List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();

            try
            {
                var valores = Valor.Split('|');

                for (int i = 0; i < valores.Length; i++)
                {
                    var valores_det = valores[i].Split(',');

                    IndicadorDataBE p = new IndicadorDataBE();
                    p.ID_ENFOQUE = Convert.ToInt32(valores_det[0]);
                    p.ID_MEDMIT = Convert.ToInt32(valores_det[1]);
                    p.ID_PARAMETRO = Convert.ToInt32(valores_det[2]);
                    if (Convert.ToString(valores_det[3]) == "0")
                    {
                        p.VALOR = "";
                    }
                    else
                    {
                        p.VALOR = Convert.ToString(valores_det[3]);
                    }

                    listaP.Add(p);
                }

                listaP = IndicadorLN.CalculoIndicador(listaP);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
            
            var jsonResult = Json(listaP, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarEnfoqueMedida(EnfoqueBE entidad)
        {
            List<EnfoqueBE> lista = EnfoqueLN.listarEnfoqueMedida(entidad.ID_MEDMIT);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarCabeceraIndicador(ParametroBE entidad)
        {
            List<ParametroBE> lista = ParametroLN.ListarCabeceraIndicador(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarCuerpoIndicador(ParametroBE entidad)
        {
            List<ParametroBE> lista = ParametroLN.ListarParametroEnfoque(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        public JsonResult ListarDatosIndicadorData(IndicadorDataBE entidad)
        {
            List<IndicadorDataBE> lista = IndicadorLN.ListarDatosIndicadorData(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult DeshabilitarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.DeshabilitarUsuario(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ValidarDetalleIndicador(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            List<IniciativaBE> lista = IniciativaLN.ValidarDetalleIndicador(entidad);
            itemRespuesta.success = true;
            itemRespuesta.extra = Convert.ToString(lista.Count());
            return Respuesta(itemRespuesta);
        }

        public JsonResult ValidarDetalleArchivo(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            IniciativaBE ent = IniciativaLN.ValidarDetalleArchivo(entidad);
            itemRespuesta.success = true;
            itemRespuesta.extra = Convert.ToString(ent.CANTIDAD);
            return Respuesta(itemRespuesta);
        }
                
        public JsonResult CorreoAdministrador(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.UsuarioAdministrador();
            itemRespuesta.success = true;
            itemRespuesta.extra = Convert.ToString(entidad.EMAIL_USUARIO);
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarEnfoqueFactorVerificar(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.ListarEnfoqueFactorVerificar(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        public JsonResult ListarFormulasVerificar(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.ListarFormulaVerificar(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarFactoresVerificar(string ID_FACTORES)
        {
            List<FactorBE> lista = FactorLN.ListarFactoresVerificar(ID_FACTORES);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult VerificarIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.VerificarIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = Convert.ToString(entidad.CANTIDAD);
            return Respuesta(itemRespuesta);
        }

        public JsonResult VerificarRevisionIniciativaMitigacion(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.VerificarRevisionIniciativaMitigacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = Convert.ToString(entidad.CANTIDAD);
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarActorEnviar(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = UsuarioLN.ListarActorEnviar(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
        
        public JsonResult AsignarIniciativaMasivo(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            MedidaMitigacionBE med = MedidaMitigacionLN.getMedidaMitigacion(entidad.ID_MEDMIT);

            entidad.NOMBRE_MEDMIT = med.NOMBRE_MEDMIT;
            entidad.FECHA = entidad.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy");
            entidad.FECHA_FIN = entidad.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy");
            entidad.ID_USUARIO_ADMIN = Convert.ToInt32(Session["usuario"]);
            entidad = IniciativaLN.AsignarIniciativaMasivo(entidad);

            UsuarioBE usu = new UsuarioBE();
            usu = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                IniciativaBE iniciativa = new IniciativaBE();
                iniciativa.EMAIL_USUARIO = usu.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.SALUDO = "Estimado Sr(a): " + usu.NOMBRES + "<br/></br/>";
                if (entidad.ID_ROL == 4)
                {
                    
                    iniciativa.ASUNTO = "Envio de Paquete de Iniciativas de mitigación - MRVMinem ";
                    iniciativa.DESCRIPCION = iniciativa.SALUDO + "Se envió un paquete de Iniciativas de Mitigación correspondiente a la medida " + med.NOMBRE_MEDMIT + " del período "+ entidad.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy") + " - " + entidad.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy") + ", en espera de su evaluación<br/><br/>";
                }
                else
                {
                    iniciativa.ASUNTO = "Envio de Iniciativa(s) de mitigación - MRVMinem ";
                    iniciativa.DESCRIPCION = iniciativa.SALUDO + "Se le asignó un grupo de Iniciativas de Mitigación para su verificación<br/><br/>";
                }
                
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult MostrarUsuarioRecordatorio(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.MostrarUsuarioRecordatorio(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult EnviarRecordatorio(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            UsuarioBE usu = new UsuarioBE();
            IniciativaBE inic = IniciativaLN.IniciativaMitigacionRecordatorio(entidad.ID_INICIATIVA);
            usu = UsuarioLN.obtenerUsuarioId(entidad.ID_ASIGNADO);
            entidad.EMAIL_USUARIO = usu.EMAIL_USUARIO;
            entidad.VALIDAR_RUTA = 1;
            entidad.ASUNTO = "Recordatorio - MRV";
            entidad.SALUDO = "Estimado Sr(a): "+ usu.NOMBRES+"<br/></br/>";

            entidad.CABECERA = "Detallamos la siguiente información de su registro:<br/><br/>Código de la Iniciativa de Mitigación: " + inic.ID_INICIATIVA + "<br/>Nombre de su proyecto: " + inic.NOMBRE_INICIATIVA + "<br/>Medida de Mitigación asociada: " + inic.NOMBRE_MEDMIT + "<br/>Estado: Evaluada y atendida<br/>Fecha " + inic.FECHA + "<br/><br/>";

            //if (entidad.ID_ROL == 1)
            //{
            //    entidad.CABECERA = "Le informamos de su inicativa de mitigación de código " + inic.ID_INICIATIVA + ", con nombre de proyecto (" + inic.NOMBRE_INICIATIVA + ")" + " asociado a la medida de mitigación " + inic.NOMBRE_MEDMIT + ", evaluada y atendida en la fecha "+ inic.FECHA + " :<br/><br/>";
            //}
            //else
            //{
            //    entidad.CABECERA = "La inicativa de mitigación de código " + inic.ID_INICIATIVA + ", con nombre de proyecto (" + inic.NOMBRE_INICIATIVA + ")" + " asociado a la medida de mitigación " + inic.NOMBRE_MEDMIT + ", evaluada y atendida en la fecha " + inic.FECHA + " :<br/><br/>";
            //}
            entidad.DESCRIPCION = entidad.SALUDO + entidad.CABECERA + entidad.DESCRIPCION + "<br/><br/>Enviado por el "+ Convert.ToString(Session["nombreRol"]) + ": "+ Convert.ToString(Session["nombres"])+ "<br/><br/>";
            EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
            Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            //itemRespuesta.extra = entidad.DESCRIPCION;
            //Session["correo_destino"] = "";

            itemRespuesta.success = true;
            return Respuesta(itemRespuesta);
        }

        public JsonResult AprobarIniciativaMasivo(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            string urlSello = WebConfigurationManager.AppSettings.Get("Sello");
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad.NOMBRES = Convert.ToString(Session["nombres"]);
            var arr = entidad.ID_INICIATIVA_MASIVO.Split(',');
            for (int i = 0; i < arr.Length; i++)
            {
                //==============================================================
                BlockChainBE block = new BlockChainBE() { ID_INICIATIVA = Convert.ToInt32(arr[i]), ID_USUARIO = entidad.ID_USUARIO, IP_PC = Request.UserHostAddress.ToString().Trim() };
                block = BlockChainLN.GeneraBlockChain(block);
                //itemRespuesta.extra = block.ID_BLOCKCHAIN.ToString();
                entidad.ID_INICIATIVA = Convert.ToInt32(arr[i]);
                entidad.BLOCKCHAIN = block.HASH;
                //===================================================================                
                entidad = IniciativaLN.AprobarIniciativaMasivo(entidad);

                IniciativaBE ini = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = Convert.ToInt32(arr[i]) });
                
                ini.EMAIL_USUARIO = ini.EMAIL_USUARIO;
                //ini.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                ini.VALIDAR_RUTA = 1;
                ini.ASUNTO = "Su Iniciativa de Mitigación ha sido Evaluada y/o Verificada - MRVMinem ";
                ini.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";                
                ini.DESCRIPCION = ini.SALUDO + "Felicitaciones, su Iniciativa de Mitigación ha sido evaluada y/o verificada por nuestro equipo, asimismo ha contribuido en la reducción de los gases de efecto invernadero (GEI). Por ello, lo invitamos a ingresar a nuestra <a href=\""+ urlSello + "\">Plataforma del Sello de Reconocimiento de Energía Sostenible</a><br/><br/>";

                EnvioCorreo hilo_correo = new EnvioCorreo(ini, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
            

            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }
        //public JsonResult ListarTipoIniciativa()
        //{
        //    List<TipoIniciativaBE> lista = TipoIniciativaLN.listarTipoIniciativa();
        //    var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
        //    jsonResult.MaxJsonLength = int.MaxValue;
        //    return jsonResult;
        //}

        //EXPORTAR EXCEL

        public void ExportarMantenimientoUsuario(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<UsuarioBE>(item);
                    ExportarToExcelMantenimientoUsuario(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelMantenimientoUsuario(UsuarioBE entidad)
        {
            List<UsuarioBE> lista = null;
            //if (string.IsNullOrEmpty(entidad.DESCRIPCION))
            //{
                lista = UsuarioLN.ListaMantenimientoUsuario(entidad);
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
                    var ws1 = package.Workbook.Worksheets.Add("MANTENIMIENTO USUARIO");
                    using (var m = ws1.Cells[1, 1, row, 7])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 14;
                        m.Merge = true;
                        m.Value = "MANTENIMIENTO USUARIO " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "NOMBRES Y APELLIDOS";
                    ws1.Cells["B" + row].AutoFitColumns(40);
                    ws1.Cells["C" + row].Value = "CORREO";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "INSTITUCIÓN";
                    ws1.Cells["D" + row].AutoFitColumns(45);
                    ws1.Cells["E" + row].Value = "TELÉFONO / CELULAR";
                    ws1.Cells["E" + row].AutoFitColumns(45);
                    ws1.Cells["F" + row].Value = "PERFIL";
                    ws1.Cells["F" + row].AutoFitColumns(30);
                    ws1.Cells["G" + row].Value = "ESTADO";
                    ws1.Cells["G" + row].AutoFitColumns(20);

                    FormatoCelda(ws1, "A", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "B", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "C", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "D", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "E", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "F", row, 0, 123, 255, 255, 255, 255);
                    FormatoCelda(ws1, "G", row, 0, 123, 255, 255, 255, 255);
                    ws1.Row(row).Height = 42;
                    row++;
                    if (lista.Count > 0)
                    {
                        var xNum = 0;
                        foreach (UsuarioBE dt_fila in lista)
                        {
                            xNum++;
                            ws1.Cells["A" + row].Value = xNum;
                            ws1.Cells["B" + row].Value = dt_fila.NOMBRES;
                            ws1.Cells["C" + row].Value = dt_fila.CORREO;
                            ws1.Cells["D" + row].Value = dt_fila.INSTITUCION;
                            if (string.IsNullOrEmpty(dt_fila.TELEFONO_USUARIO))
                            {
                                ws1.Cells["E" + row].Value = "                    - "+dt_fila.CELULAR_USUARIO;
                            } else if (string.IsNullOrEmpty(dt_fila.CELULAR_USUARIO))
                            {
                                ws1.Cells["E" + row].Value = dt_fila.TELEFONO_USUARIO + " -                    ";
                            }
                            else
                            {
                                ws1.Cells["E" + row].Value = dt_fila.TELEFONO_USUARIO + " - " + dt_fila.CELULAR_USUARIO;
                            }
                            //ws1.Cells["E" + row].Value = dt_fila.DIRECCION;
                            ws1.Cells["F" + row].Value = dt_fila.ROL;
                            ws1.Cells["G" + row].Value = dt_fila.ESTADO;
                            formatoDetalle(ws1, "A", "G", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_USUARIO_" + DateTime.Now.ToString() + ".xlsx";
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

        public void ExportarDetalleIndicador(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<IndicadorBE>(item);
                    ExportarToExcelDetalleIndicador(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelDetalleIndicador(IndicadorBE entidad)
        {
            IndicadorDataBE ida = new IndicadorDataBE();
            ida.ID_INICIATIVA = entidad.ID_INICIATIVA;
            ida.ID_MEDMIT = entidad.ID_MEDMIT;
            //var lista = IndicadorLN.ListarDetalleIndicador(entidad);
            var lista = IndicadorLN.ListarDatosTablaDinamica(ida);
            int tam = lista[0].listaParam.Count;

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("DETALLE INDICADORES");
                    using (var m = ws1.Cells[1, 1, row, tam])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 14;
                        m.Merge = true;
                        m.Value = "DETALLE INDICADORES " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(3, 1);

                    

                    foreach (var item in lista)
                    {
                        row++;
                        ws1.Cells["B" + row].Value = item.DESCRIPCION;

                        row++;
                        int j = 1;
                        ws1.Cells["A" + row].Value = "N°";
                        ws1.Cells["A" + row].AutoFitColumns(5);
                        foreach (var itemD in item.listaParam)
                        {
                            j++;
                            string L = obtenerLetra(j);
                            ws1.Cells[L + row].Value = itemD.NOMBRE_PARAMETRO;
                            ws1.Cells[L + row].AutoFitColumns(35);
                        }

                        j = 1;
                        FormatoCelda(ws1, "A", row, 40, 167, 69, 255, 255, 255); //V
                        foreach (var itemD in item.listaParam)
                        {
                            j++;
                            string L = obtenerLetra(j);
                            if (itemD.ID_GRUPO_INDICADOR == 1)
                            {
                                FormatoCelda(ws1, L, row, 40, 167, 69, 255, 255, 255); //V                                
                            }
                            else if (itemD.ID_GRUPO_INDICADOR == 2)
                            {
                                FormatoCelda(ws1, L, row, 255, 193, 7, 52, 58, 64); //N
                            }
                            else if (itemD.ID_GRUPO_INDICADOR == 3)
                            {
                                FormatoCelda(ws1, L, row, 0, 123, 255, 255, 255, 255); //A
                            }

                        }

                        ws1.Row(row).Height = 42;
                        //var total = 0.0;
                        row++;
                        var xNum = 0;
                        foreach (var itemI in item.listaInd)
                        {
                            j = 1;                            
                            if (itemI.listaInd.Count > 0)
                            {
                                xNum++;
                                ws1.Cells["A" + row].Value = xNum;
                                foreach (var itemDet in itemI.listaInd)
                                {
                                    j++;
                                    string L = obtenerLetra(j);
                                    if (itemDet.ID_TIPO_CONTROL == 1)
                                    {
                                        if (itemDet.ID_PARAMETRO != 6)
                                        {
                                            ws1.Cells[L + row].Value = itemDet.DESCRIPCION;
                                        }
                                        else
                                        {
                                            ws1.Cells[L + row].Value = itemDet.VALOR;
                                        }
                                    }
                                    else
                                    {
                                        ws1.Cells[L + row].Value = itemDet.VALOR;
                                    }                                    
                                }
                                formatoDetalle(ws1, "A", obtenerLetra(j), row);
                                row++;
                            }
                        }
                        row++;
                        row++;
                        

                        //if (lista.Count > 0)
                        //{
                        //    var xNum = 0;
                        //    foreach (IndicadorBE dt_fila in lista)
                        //    {
                        //        xNum++;
                        //        ws1.Cells["A" + row].Value = xNum;
                                
                        //        ws1.Cells["C" + row].Value = dt_fila.TIPO_VEHICULO;
                        //        ws1.Cells["D" + row].Value = dt_fila.TIPO_COMBUSTIBLE;
                        //        ws1.Cells["E" + row].Value = dt_fila.KRV_BASE;
                        //        ws1.Cells["F" + row].Value = dt_fila.CANT_BASE;
                        //        ws1.Cells["G" + row].Value = dt_fila.F_RENDIMIENTO;
                        //        ws1.Cells["H" + row].Value = dt_fila.TOTAL_GEI_BASE;
                        //        ws1.Cells["I" + row].Value = dt_fila.TOTAL_GEI_INIMIT;
                        //        ws1.Cells["J" + row].Value = dt_fila.TOTAL_GEI_REDUCIDO;
                        //        total += Double.Parse(dt_fila.TOTAL_GEI_REDUCIDO.ToString());
                        //        formatoDetalle(ws1, "A", "J", row);
                        //        row++;
                        //    }
                        //    row++;
                        //}

                    }


                    //ws1.Cells["C" + row].Value = "TIPO VEHÍCULO";
                    //ws1.Cells["C" + row].AutoFitColumns(25);
                    //ws1.Cells["D" + row].Value = "TIPO COMBUSTIBLE";
                    //ws1.Cells["D" + row].AutoFitColumns(25);
                    //ws1.Cells["E" + row].Value = "KRV";
                    //ws1.Cells["E" + row].AutoFitColumns(15);
                    //ws1.Cells["F" + row].Value = "CANTIDAD";
                    //ws1.Cells["F" + row].AutoFitColumns(15);
                    //ws1.Cells["G" + row].Value = "FACTOR RENDIMIENTO";
                    //ws1.Cells["G" + row].AutoFitColumns(25);
                    //ws1.Cells["H" + row].Value = "LÍNEA BASE EMISIONES GEI (tCO2eq)";
                    //ws1.Cells["H" + row].AutoFitColumns(40);
                    //ws1.Cells["I" + row].Value = "INICIATIVA M. EMISIONES GEI (tCO2eq)";
                    //ws1.Cells["I" + row].AutoFitColumns(40);
                    //ws1.Cells["J" + row].Value = "EMISIONES GEI REDUCIDAS (tCO2eq)";
                    //ws1.Cells["J" + row].AutoFitColumns(40);                    

                    //FormatoCelda(ws1, "A", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "B", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "C", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "D", row, 255, 193, 7, 52, 58, 64); //N
                    //FormatoCelda(ws1, "E", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "F", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "G", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "H", row, 255, 193, 7, 52, 58, 64); //N
                    //FormatoCelda(ws1, "I", row, 40, 167, 69, 255, 255, 255); //V
                    //FormatoCelda(ws1, "J", row, 0, 123, 255, 255, 255, 255); //A


                    //ws1.Row(row).Height = 42;
                    //var total = 0.0;
                    //row++;
                    //if (lista.Count > 0)
                    //{
                    //    var xNum = 0;
                    //    foreach (IndicadorBE dt_fila in lista)
                    //    {
                    //        xNum++;
                    //        ws1.Cells["A" + row].Value = xNum;
                    //        ws1.Cells["B" + row].Value = dt_fila.ANNO_BASE;
                    //        ws1.Cells["C" + row].Value = dt_fila.TIPO_VEHICULO;
                    //        ws1.Cells["D" + row].Value = dt_fila.TIPO_COMBUSTIBLE;
                    //        ws1.Cells["E" + row].Value = dt_fila.KRV_BASE;
                    //        ws1.Cells["F" + row].Value = dt_fila.CANT_BASE;
                    //        ws1.Cells["G" + row].Value = dt_fila.F_RENDIMIENTO;
                    //        ws1.Cells["H" + row].Value = dt_fila.TOTAL_GEI_BASE;
                    //        ws1.Cells["I" + row].Value = dt_fila.TOTAL_GEI_INIMIT;
                    //        ws1.Cells["J" + row].Value = dt_fila.TOTAL_GEI_REDUCIDO;
                    //        total += Double.Parse(dt_fila.TOTAL_GEI_REDUCIDO.ToString());
                    //        formatoDetalle(ws1, "A", "J", row);
                    //        row++;
                    //    }
                    //    row++;
                    //}

                    //row++;
                    //ws1.Cells["I" + row].Value = "TOTAL (tCO2eq)";
                    //ws1.Cells["J" + row].Value = total;
                    //formatoDetalle(ws1, "I", "J", row);
                    //ws1.Cells["I" + row].Style.Font.Bold = true;

                    string strFileName = "DETALLE_INDICADORES_" + DateTime.Now.ToString() + ".xlsx";
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

        private int getMenorId(List<EnfoqueBE> lista)
        {
            var menor = 999999999;
            foreach(var item in lista)
            {
                if(item.ID_ENFOQUE < menor)
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

        private string obtenerLetra (int num)
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

        public string concatenarIdEnfoque(List<IndicadorDataBE> lista)
        {
            string id_enfoques = "";
            if (lista.Count > 0)
            {
                foreach (var item in lista)
                {
                    id_enfoques += item.ID_ENFOQUE + ",";
                }
                id_enfoques = id_enfoques.Substring(0, id_enfoques.Length -1);
            }            

            return id_enfoques;
        }

    }
}