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
using utilitario.minem.gob.pe;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Drawing;
using System.Web.Security;

namespace MRVMinem.Controllers
{
    public class PortalController : BaseController
    {
        private GoogleReCAPTCHAService _GoogleReCAPTCHAService = new GoogleReCAPTCHAService(new MvReCAPTCHASettings() { ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"], ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"] });

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
            MvAnno model = new MvAnno();
            var anno = DateTime.Now.Year;
            model.listaAnno = AnnoLN.ListaAnno(anno);
            return View(model);
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

        public JsonResult ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult VerificarEmail(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            try
            {
                entidad = UsuarioLN.VerificarEmail(entidad);
                if (!entidad.OK)
                {
                    itemRespuesta.success = false;
                }
                else
                {
                    itemRespuesta.success = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                itemRespuesta.success = false;
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

            try
            {

                var _GoogleRecaptcha = _GoogleReCAPTCHAService.VerifyRecaptcha(entidad.Token);
                if (!_GoogleRecaptcha.Result.success && _GoogleRecaptcha.Result.score <= 0.5)
                {
                    itemRespuesta.success = false;
                    itemRespuesta.extra = "Usted no es una entidad válida (You are Not Human ....)";
                }
                else
                {

                    //if (Membership.ValidateUser(entidad.USUARIO, entidad.PASSWORD_USUARIO))
                    //{
                    //    entidad = UsuarioLN.ObtenerPassword(entidad);
                    //    itemRespuesta.success = entidad.OK;
                    //    //itemRespuesta.success = true;
                    //    Session["usuario"] = entidad.ID_USUARIO.ToString();
                    //    Session["socket"] = WebConfigurationManager.AppSettings.Get("Socket");
                    //    List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(entidad.ID_USUARIO);
                    //    limpiarSetearSesion(lista);
                    //    FormsAuthentication.RedirectFromLoginPage(entidad.USUARIO, false);

                    //    return null;
                    //}
                    //else
                    //{
                    //    itemRespuesta.extra = entidad.extra;
                    //}

                    entidad = UsuarioLN.ObtenerPassword(entidad);
                    itemRespuesta.success = entidad.OK;
                    if (entidad.OK)
                    {
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
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                itemRespuesta.success = false;
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

        /////////////////////////////////////////////////////////////////////7
        public JsonResult ListaBusquedaSimplePublico(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaBusquedaSimplePublico(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaBusquedaAvanzadaPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaBusquedaAvanzadaPublico(entidad);
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

        public JsonResult DashboardResultado(IndicadorBE entidad)
        {
            List<IndicadorBE> lista = IndicadorLN.DashboardResultado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult MostrarGeiporAnio(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IndicadorLN.MostrarGeiporAnio(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public void ExportarIniciativa(string item)
        {
            try
            {
                if (item != null)
                {
                    var entidad = new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<IniciativaBE>(item);
                    entidad.ID_ROL = Convert.ToInt32(Session["rol"]);
                    ExportarToExcelIniciativaMitigacion(entidad);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
        }

        public void ExportarToExcelIniciativaMitigacion(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = new List<IniciativaBE>();
            if (entidad.METODO == 0)
            {
                if (entidad.ID_USUARIO == 0)
                {
                    lista = IniciativaLN.ListaBusquedaSimplePublicoExcel(entidad);
                }
                else
                {
                    lista = IniciativaLN.ListaExcelSimple(entidad);
                }
            }
            else
            {
                lista = IniciativaLN.ListaExcelAvanzado(entidad);
            }

            int row = 2;
            try
            {
                string cadena_fecha = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                using (ExcelPackage package = new ExcelPackage())
                {
                    var ws1 = package.Workbook.Worksheets.Add("INICIATIVA MITIGACIÓN");
                    using (var m = ws1.Cells[1, 1, row, 9])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 14;
                        m.Merge = true;
                        m.Value = "INICIATIVA MITIGACIÓN " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "NOMBRE DE INICIATIVA";
                    ws1.Cells["B" + row].AutoFitColumns(60);
                    ws1.Cells["C" + row].Value = "PROGRESO";
                    ws1.Cells["C" + row].AutoFitColumns(15);
                    ws1.Cells["D" + row].Value = "FECHA DE INICIO";
                    ws1.Cells["D" + row].AutoFitColumns(20);
                    ws1.Cells["E" + row].Value = "FECHA DE TÉRMINO";
                    ws1.Cells["E" + row].AutoFitColumns(20);
                    ws1.Cells["F" + row].Value = "MEDIDA DE MITIGACIÓN";
                    ws1.Cells["F" + row].AutoFitColumns(60);
                    ws1.Cells["G" + row].Value = "ENTIDAD";
                    ws1.Cells["G" + row].AutoFitColumns(35);
                    ws1.Cells["H" + row].Value = "TOTAL REDUCIDO";
                    ws1.Cells["H" + row].AutoFitColumns(30);
                    ws1.Cells["I" + row].Value = "ESTADO";
                    ws1.Cells["I" + row].AutoFitColumns(25);

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
                        foreach (IniciativaBE dt_fila in lista)
                        {
                            xNum++;
                            //ws1.Cells["A" + row].Value = xNum;
                            ws1.Cells["A" + row].Value = dt_fila.ID_INICIATIVA;
                            ws1.Cells["B" + row].Value = dt_fila.NOMBRE_INICIATIVA;
                            int prog = 0;
                            if (dt_fila.PROGRESO > 4) { prog = 4; }
                            else prog = dt_fila.PROGRESO;
                            ws1.Cells["C" + row].Value = Convert.ToString(prog * 25) + "%";
                            ws1.Cells["D" + row].Value = dt_fila.FECHA;
                            ws1.Cells["E" + row].Value = dt_fila.FECHA_FIN;
                            ws1.Cells["F" + row].Value = dt_fila.NOMBRE_MEDMIT;
                            ws1.Cells["G" + row].Value = dt_fila.NOMBRE_INSTITUCION;
                            ws1.Cells["H" + row].Value = dt_fila.TOTAL_GEI;
                            ws1.Cells["I" + row].Value = dt_fila.ESTADO_BANDEJA;
                            formatoDetalle(ws1, "A", "F", row);
                            row++;
                        }
                        row++;
                    }

                    string strFileName = "LISTA_INICIATIVA_MITIGACION_" + DateTime.Now.ToString() + ".xlsx";
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