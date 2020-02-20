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
using System.IO;
using System.Web.Configuration;
using MRVMinem.Helper;

namespace MRVMinem.Controllers
{
    public class PortalController : BaseController
    {
        // GET: Portal
        SessionBE session = new SessionBE();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AccionMitigacion()
        {
            return View();
        }

        public ActionResult ConfirmarCorreo(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View();
        }

        public ActionResult VerMasIniciativa(int ini)
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

        public ActionResult VerMasIniciativaDetalle(int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = ini;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.UsuarioIniciativa(modelo.iniciativa_mit.ID_USUARIO);
            modelo.detalle = 1;
            return View(modelo);
        }

        public ActionResult ReestablecerClave(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }

        public ActionResult Resultados()
        {
            return View();
        }

        public ActionResult TerminosCondiciones()
        {
            return View();
        }

        public ActionResult PreguntasFrecuentes()
        {
            return View();
        }

        public JsonResult ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult VerificarEmail(UsuarioBE entidad)
        {
            entidad = UsuarioLN.VerificarEmail(entidad);
            ResponseEntity itemRespuesta = new ResponseEntity();


            if (!entidad.OK)
            {
                itemRespuesta.success = false;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult RegistrarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            InstitucionBE institucion = new InstitucionBE(entidad.ID_SECTOR_INST, entidad.RUC, entidad.INSTITUCION, entidad.DIRECCION);

            institucion = InstitucionLN.registrarInstitucion(institucion);
            if (institucion.ID_INSTITUCION != 0)
            {
                entidad.ID_INSTITUCION = institucion.ID_INSTITUCION;
                entidad = UsuarioLN.RegistraUsuario(entidad);

                if (!entidad.OK)
                {
                    itemRespuesta.success = false;
                    itemRespuesta.extra = entidad.extra;
                }
                else
                {
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad);    //.CreacionUsuario(entidad);
                    //Thread hilo = new Thread(new ThreadStart(hilo_correo.CreacionUsuario));
                    //hilo.Start();
                    //hilo.Join();

                    Task tarea = Task.Factory.StartNew(() => hilo_correo.CreacionUsuario());

                    itemRespuesta.success = true;
                }
            }
            else
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = institucion.extra;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult RegistrarUsuario2(HttpPostedFileBase fledeclaracion, FormCollection forms)
        {
            UsuarioBE entidad = new UsuarioBE();

            entidad.ID_SECTOR_INST = int.Parse(Request.Form["ID_SECTOR_INST"].ToString());
            entidad.EMAIL_USUARIO = Request.Form["EMAIL_USUARIO"].ToString();
            entidad.NOMBRES_USUARIO = Request.Form["NOMBRES_USUARIO"].ToString();
            entidad.APELLIDOS_USUARIO = Request.Form["APELLIDOS_USUARIO"].ToString();
            entidad.PASSWORD_USUARIO = Request.Form["PASSWORD_USUARIO"].ToString();
            entidad.TELEFONO_USUARIO = Request.Form["TELEFONO_USUARIO"].ToString();
            entidad.CELULAR_USUARIO = Request.Form["CELULAR_USUARIO"].ToString();
            entidad.ANEXO_USUARIO = Request.Form["ANEXO_USUARIO"].ToString();
            entidad.INSTITUCION = Request.Form["INSTITUCION"].ToString();
            entidad.RUC = Request.Form["RUC"].ToString();
            entidad.DIRECCION = Request.Form["DIRECCION"].ToString();
            entidad.ID_ROL = int.Parse(Request.Form["ID_ROL"].ToString());
            entidad.ID_ESTADO_USUARIO = int.Parse(Request.Form["ID_ESTADO_USUARIO"].ToString());
            entidad.TERMINOS = Char.Parse(Request.Form["TERMINOS"]);
            if (entidad.ID_SECTOR_INST == 1)
            {
                entidad.SECTOR = "Público";
            }
            else if (entidad.ID_SECTOR_INST == 2)
            {
                entidad.SECTOR = "Privado";
            }

            ResponseEntity itemRespuesta = new ResponseEntity();
            InstitucionBE institucion = new InstitucionBE(entidad.ID_SECTOR_INST, entidad.RUC, entidad.INSTITUCION, entidad.DIRECCION);

            institucion = InstitucionLN.registrarInstitucion(institucion);
            if (institucion.ID_INSTITUCION != 0)
            {
                string nomArchivoSave = "";
                string nomOriginal = "";
                if (fledeclaracion != null)
                {
                    nomOriginal = fledeclaracion.FileName;
                    var content = new byte[fledeclaracion.ContentLength];
                    fledeclaracion.InputStream.Read(content, 0, fledeclaracion.ContentLength);
                    double tamanio = (fledeclaracion.ContentLength / 1024);
                    nomArchivoSave = Guid.NewGuid() + Path.GetExtension(fledeclaracion.FileName).ToString();
                }                

                entidad.ID_INSTITUCION = institucion.ID_INSTITUCION;
                entidad.ADJUNTO = nomArchivoSave;
                entidad.ADJUNTO_BASE = nomOriginal;
                entidad = UsuarioLN.RegistraUsuario(entidad);

                if (!entidad.OK)
                {
                    itemRespuesta.success = false;
                    itemRespuesta.extra = entidad.extra;
                }
                else
                {
                    if (fledeclaracion != null)
                    {
                        try
                        {
                            //string nomArchivoSave = "";
                            //var content = new byte[fledeclaracion.ContentLength];
                            //fledeclaracion.InputStream.Read(content, 0, fledeclaracion.ContentLength);
                            //double tamanio = (fledeclaracion.ContentLength / 1024);
                            //nomArchivoSave = Guid.NewGuid() + Path.GetExtension(fledeclaracion.FileName).ToString();
                            var carpeta = WebConfigurationManager.AppSettings.Get("DJ");
                            var ruta = Path.Combine(carpeta, nomArchivoSave);
                            fledeclaracion.SaveAs(ruta);
                            itemRespuesta.success = true;
                        }
                        catch (Exception e)
                        {
                            itemRespuesta.success = false;
                            itemRespuesta.extra = e.Message;
                        }
                    }
                    

                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad);    //.CreacionUsuario(entidad);
                    //Thread hilo = new Thread(new ThreadStart(hilo_correo.CreacionUsuario));
                    //hilo.Start();
                    //hilo.Join();

                    //hilo_correo.CreacionUsuario();
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.CreacionUsuario());

                    itemRespuesta.success = true;
                }
            }
            else
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = institucion.extra;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult ListaIniciativasPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaPublico(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult IniciarSesion(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.ObtenerPassword(entidad);
            itemRespuesta.success = entidad.OK;
            if (entidad.OK)
            {
                //session.ID_USUARIO = entidad.ID_USUARIO;
                //Session["Opciones"] = session; 
                //itemRespuesta.extra = entidad.ID_USUARIO.ToString();
                SessionHelper.AddUserToSession(entidad.ID_USUARIO.ToString());
                Session["usuario"] = entidad.ID_USUARIO.ToString();
                Session["socket"] = WebConfigurationManager.AppSettings.Get("Socket");
                List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(entidad.ID_USUARIO);
                limpiarSetearSesion(lista);
            }
            else
            {
                itemRespuesta.extra = entidad.extra;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult VerificarEmailRecuperar(UsuarioBE entidad)
        {
            entidad = UsuarioLN.VerificarEmail(entidad);
            ResponseEntity itemRespuesta = new ResponseEntity();


            if (!entidad.OK)
            {
                itemRespuesta.success = true;
            }
            else
            {
                itemRespuesta.success = false;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult EnviarCorreoRecuperar(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = UsuarioLN.obtenerUsuario(entidad);

            if (entidad.OK)
            {
                EnvioCorreo hilo_correo = new EnvioCorreo(entidad);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.recuperarClave());
                itemRespuesta.success = true;
            }
            else
            {
                itemRespuesta.success = false;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarSector(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }


        public JsonResult ListaEnergetico(GasEfectoInvernaderoBE entidad)
        {
            List<GasEfectoInvernaderoBE> lista = GasEfectoInvernaderoLN.ListarGEI(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaEnergeticoProyecto(EnergeticoBE entidad)
        {
            List<EnergeticoBE> lista = EnergeticoLN.ListarENERGProyecto(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        //Busqueda
        public JsonResult BusquedaSimple(BusquedaSimpleBE entidad)
        {
            List<IniciativaBE> lista = BusquedaSimpleLN.BusquedaSimple(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult BusquedaAvanzada(BusquedaAvanzadaBE entidad)
        {
            List<IniciativaBE> lista = BusquedaAvanzaLN.BusquedaAvanzada(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        private void limpiarSetearSesion(List<RolOpcionesBE> lista)
        {
            Session["opcion1"] = 0;
            Session["opcion2"] = 0;
            Session["opcion3"] = 0;
            Session["opcion4"] = 0;
            Session["opcion5"] = 0;
            Session["opcion6"] = 0;
            Session["opcion7"] = 0;
            Session["opcion8"] = 0;
            Session["opcion9"] = 0;
            foreach (var item in lista)
            {
                if (item.ID_OPCION == 1)
                {
                    Session["opcion1"] = 1;
                }
                else if (item.ID_OPCION == 2)
                {
                    Session["opcion2"] = 1;
                }
                else if (item.ID_OPCION == 3)
                {
                    Session["opcion3"] = 1;
                }
                else if (item.ID_OPCION == 4)
                {
                    Session["opcion4"] = 1;
                }
                else if (item.ID_OPCION == 5)
                {
                    Session["opcion5"] = 1;
                }
                else if (item.ID_OPCION == 6)
                {
                    Session["opcion6"] = 1;
                }
                else if (item.ID_OPCION == 7)
                {
                    Session["opcion7"] = 1;
                }
                else if (item.ID_OPCION == 8)
                {
                    Session["opcion8"] = 1;
                }
                else if (item.ID_OPCION == 9)
                {
                    Session["opcion9"] = 1;
                }

                Session["nombres"] = item.NOMBRES;
                Session["correo"] = item.CORREO;
                Session["rol"] = item.ID_ROL;
                if (item.ID_ROL == 1)
                {
                    Session["nombreRol"] = "Administrado";
                    Session["colorRol"] = "02";
                }
                else if (item.ID_ROL == 2)
                {
                    Session["nombreRol"] = "Especialista";
                    Session["colorRol"] = "03";
                }
                else if (item.ID_ROL == 3)
                {
                    Session["nombreRol"] = "Administrador MINEM";
                    Session["colorRol"] = "06";
                }
                else if (item.ID_ROL == 4)
                {
                    Session["nombreRol"] = "Evaluador MINAM";
                    Session["colorRol"] = "04";
                }
                else if (item.ID_ROL == 5)
                {
                    Session["nombreRol"] = "Verificador Externo";
                    Session["colorRol"] = "05";
                }
                Session["institucion"] = item.INSTITUCION;
                Session["direccion"] = item.DIRECCION;
                Session["sector"] = item.SECTOR;
                Session["primer_inicio"] = item.PRIMER_INICIO;
            }
        }

    }
}