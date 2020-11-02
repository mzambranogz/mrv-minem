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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Globalization;

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

            modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.UsuarioIniciativa(modelo.iniciativa_mit.ID_USUARIO);
            modelo.detalle = 1;
            Session["lista_indicador_revision"] = modelo.listaIndicador;//add
            return View(modelo);
        }

        public ActionResult ReestablecerClave(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            modelo.ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"];
            modelo.ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"];
            ViewBag.caracter = "@#.";
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
            Session["reclamo"] = WebConfigurationManager.AppSettings["Reclamos"];
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

        public JsonResult CambiarNuevaClave(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = UsuarioLN.CambiarClave(entidad);
            itemRespuesta.success = entidad.OK;
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

        public JsonResult DescargarFicha(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string nombreArchivo = entidad.ID_INICIATIVA + "_MRV.pdf";
            //string nombrePDF = nombrePDF = WebConfigurationManager.AppSettings["RutaTemp"] + "\\" + nombreArchivo;
            //itemRespuesta.success = new ReporteRepositorio().GenerarPDFBlockChain(entidad.ID_INICIATIVA, nombrePDF);

            entidad.NOMBRE_PDF = nombreArchivo;
            itemRespuesta.success = HTMLToPDF(entidad);
            if (itemRespuesta.success)
            {
                itemRespuesta.extra = nombreArchivo;
                //========================================================= add 21-03-2020
                IniciativaLN.NombrePDFFicha(entidad);
            }

            return Respuesta(itemRespuesta);
        }

        //=================================================0
        public JsonResult MostrarFicha(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = IniciativaLN.MostrarFicha(entidad);
            if (entidad.OK)
            {
                itemRespuesta.extra = entidad.NOMBRE_PDF;
            }
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
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
                    Session["nombreRol"] = item.ROL;
                    Session["colorRol"] = "02";
                }
                else if (item.ID_ROL == 2)
                {
                    Session["nombreRol"] = item.ROL;
                    Session["colorRol"] = "03";
                }
                else if (item.ID_ROL == 3)
                {
                    Session["nombreRol"] = item.ROL;
                    Session["colorRol"] = "06";
                }
                else if (item.ID_ROL == 4)
                {
                    Session["nombreRol"] = item.ROL;
                    Session["colorRol"] = "04";
                }
                else if (item.ID_ROL == 5)
                {
                    Session["nombreRol"] = item.ROL;
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
                    var ws1 = package.Workbook.Worksheets.Add("ACCIÓN DE MITIGACIÓN");
                    using (var m = ws1.Cells[1, 1, row, 9])
                    {
                        m.Style.Font.Bold = true;
                        m.Style.WrapText = true;
                        m.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        m.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                        m.Style.Font.Size = 14;
                        m.Merge = true;
                        m.Value = "ACCIONES DE MITIGACIÓN " + cadena_fecha;
                    }
                    ws1.View.FreezePanes(2, 1);
                    row++;
                    ws1.Cells["A" + row].Value = "N°";
                    ws1.Cells["A" + row].AutoFitColumns(5);
                    ws1.Cells["B" + row].Value = "NOMBRE DE ACCIÓN DE MITIGACIÓN";
                    ws1.Cells["B" + row].AutoFitColumns(60);
                    ws1.Cells["C" + row].Value = "PROGRESO DE ACCIÓN DE MITIGACIÓN";
                    ws1.Cells["C" + row].AutoFitColumns(40);
                    ws1.Cells["D" + row].Value = "FECHA DE INICIO";
                    ws1.Cells["D" + row].AutoFitColumns(20);
                    ws1.Cells["E" + row].Value = "FECHA DE TÉRMINO";
                    ws1.Cells["E" + row].AutoFitColumns(20);
                    ws1.Cells["F" + row].Value = "MEDIDA DE MITIGACIÓN";
                    ws1.Cells["F" + row].AutoFitColumns(60);
                    ws1.Cells["G" + row].Value = "ENTIDAD RESPONSABLE";
                    ws1.Cells["G" + row].AutoFitColumns(35);
                    ws1.Cells["H" + row].Value = "TOTAL REDUCIDO";
                    ws1.Cells["H" + row].AutoFitColumns(30);
                    ws1.Cells["I" + row].Value = "ESTADO DE ACCIÓN DE MITIGACIÓN";
                    ws1.Cells["I" + row].AutoFitColumns(50);

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

                    string strFileName = "LISTA_ACCIÓN_MITIGACION_" + DateTime.Now.ToString() + ".xlsx";
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

        public bool HTMLToPDF(IniciativaBE entidad)
        {
            bool validar = true;
            try
            {
                StringWriter sw = new StringWriter();
                string shtml = BuildFicha(entidad.ID_INICIATIVA, entidad.ID_PLAZO_ETAPA_ESTADO);
                sw.WriteLine(shtml);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document();
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

                string rut = WebConfigurationManager.AppSettings["RutaTemp"];

                PdfWriter.GetInstance(pdfDoc, new FileStream(rut + "\\" + entidad.NOMBRE_PDF, FileMode.Create));
                string fullimagepath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"images\header.jpg");
                //string image2 = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"images\logo-minem.jpg");
                pdfDoc.Open();
                //var p = new Paragraph("");
                //p.SpacingBefore = 200;
                //p.SpacingAfter = 0;
                //p.Alignment = 1; //0-Left, 1 middle,2 Right
                //pdfDoc.Add(p);
                iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(fullimagepath);
                //iTextSharp.text.Image imageF2 = iTextSharp.text.Image.GetInstance(image2);
                //image.ScalePercent(20f);
                //imageF2.ScaleAbsolute(250, 750);
                //imageF2.ScalePercent(10f);
                image.ScaleAbsoluteWidth(450);
                image.ScaleAbsoluteHeight(40);
                image.Alignment = 1;
                //imageF2.Alignment = 2;
                pdfDoc.Add(image);
                //pdfDoc.Add(imageF2);

                htmlparser.Parse(sr);
                pdfDoc.Close();
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                validar = false;
            }
            return validar;

        }

        public string BuildFicha(int id, int id_plazo)
        {
            IniciativaBE ini = IniciativaLN.IniciativaFicha(new IniciativaBE { ID_INICIATIVA = id });
            NumberFormatInfo formato = new CultureInfo("es-ES").NumberFormat;
            formato.CurrencyGroupSeparator = ".";
            formato.NumberDecimalSeparator = ",";
            string html = "";
            html += "<html>";
            html += "<head>";
            html += "</head>";
            html += "<body>";
            html += "<br/>";
            html += "<div style='text-align: center;font-weight: bold;font-size: 22px;'>" + ini.NOMBRE_MEDMIT + "</div><br/>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>IPCC:</span>&nbsp;<span> " + ini.IPCC + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Descripción Medida Mitigación:</span>&nbsp;<span> " + ini.DESCRIPCION_MEDMIT + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Objetivo Medida Mitigación:</span>&nbsp;<span> " + ini.OBJETIVO_MEDMIT + "</span></div>";
            html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Datos principales</div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Tipo de iniciativa:</span>&nbsp;<span> " + ini.TIPO_INICIATIVA + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Nombre de la iniciativa:</span>&nbsp;<span> " + ini.NOMBRE_INICIATIVA + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Descripción de la iniciativa:</span>&nbsp;<span> " + ini.DESC_INICIATIVA + "</span></div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Responsable del registro:</span>&nbsp;<span> " + ini.NOMBRES + "</span></div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Correo electrónico:</span>&nbsp;<span> " + ini.EMAIL_USUARIO + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Nombre de la institución:</span>&nbsp;<span> " + ini.INSTITUCION + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Dirección:</span>&nbsp;<span> " + ini.DIRECCION + "</span></div>";
            html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Datos generales</div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Sector de la institución:</span>&nbsp;<span> " + ini.SECTOR + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Ubicación:</span>&nbsp;<span> " + ini.UBICACION + "</span></div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Moneda:</span>&nbsp;<span> " + ini.MONEDA + "</span></div>";
            if (ini.PRIVACIDAD_INVERSION == '1')
            {
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Monto de inversión:</span>&nbsp;<span> " + ini.INVERSION_INICIATIVA.ToString("N", formato) + "</span></div>";
            }            
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Fecha de inicio de operaciones:</span>&nbsp;<span> " + ini.FECHA + "</span></div>";
            if (ini.FECHA_FIN != "01/01/0001")
            {
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Fecha de finalización:</span>&nbsp;<span> " + ini.FECHA_FIN + "</span></div>";
            }

            if (id_plazo >= 12)
            {
                List<IndicadorDataBE> lista = IndicadorLN.ListarDatosTablaDinamica(new IndicadorDataBE { ID_INICIATIVA = ini.ID_INICIATIVA, ID_MEDMIT = ini.ID_MEDMIT });

                if (!string.IsNullOrEmpty(ini.ENERGETICO) || !string.IsNullOrEmpty(ini.GEI))
                {
                    html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Indicadores</div>";
                    if (!string.IsNullOrEmpty(ini.ENERGETICO))
                    {
                        html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Energéticos:</span>&nbsp;<span> " + ini.ENERGETICO + "</span></div>";
                    }
                    if (!string.IsNullOrEmpty(ini.GEI))
                    {
                        html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Gases de efecto invernadero:</span>&nbsp;<span> " + ini.GEI + "</span></div>";
                    }
                }

                if (lista.Count > 0)
                {
                    html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Detalle de la iniciativa de mitigación</div>";
                    html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Enfoque:</span>&nbsp;<span> " + lista[lista.Count() - 1].DESCRIPCION + "</span></div>";
                    html += "<div>";
                    html += "   <table style=''>";
                    html += "       <thead>";
                    html += "           <tr style='font-size: 6px;font-weight: bold;text-align: center;border: black 1px solid;border-collapse: collapse;'>";
                    foreach (var item in lista[lista.Count() - 1].listaParam)
                    {
                        html += "       <th scope='col'><span><small>" + item.NOMBRE_PARAMETRO + "</small></span></th>";
                    }
                    html += "               </tr>";
                    html += "           <thead>";
                    html += "       </thead>";
                    html += "       <tbody>";

                    foreach (var item in lista[lista.Count() - 1].listaInd)
                    {
                        html += "           <tr style='font-size: 6px;background-color: green;text-align: center;border: 1px;border-collapse: collapse;'>";
                        foreach (var itemD in item.listaInd)
                        {
                            if (itemD.ID_TIPO_CONTROL == 1)
                            {
                                if (itemD.ID_PARAMETRO == 6)
                                {
                                    html += "       <td><span><small>" + itemD.VALOR + "</small></span></td>";
                                }
                                else
                                {
                                    html += "       <td><span><small>" + itemD.DESCRIPCION + "</small></span></td>";
                                }
                            }
                            else
                            {
                                html += "       <td><span><small>" + itemD.VALOR + "</small></span></td>";
                            }
                        }
                        html += "               </tr>";
                    }

                    html += "       </tbody>";
                    html += "   </table>";
                    html += "</div>";
                    html += "<br/><div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Total reducido de GEI: </span>&nbsp;<span> " + ini.TOTAL_GEI + " tCO<sub>2</sub>eq</span></div>";
                }
                
                html += "</body>";
                html += "</html>";
            }

            return html;
        }

        public JsonResult MostrarAcumulado(IniciativaBE entidad)
        {
            entidad.ListaIndicadores = (List<IndicadorBE>)Session["lista_indicador_revision"];
            List<IndicadorDataBE> lista = IniciativaLN.MostrarAcumulado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public List<IndicadorBE> capturarIndicadores(List<IndicadorDataBE> lista)
        {
            List<IndicadorBE> listaE = new List<IndicadorBE>();
            //var id_indicadores = "";
            if (lista != null)
            {
                foreach (var item in lista)
                {
                    if (item != null)
                    {
                        foreach (var it in item.listaInd)
                        {
                            IndicadorBE ind = new IndicadorBE();
                            ind.ID_INDICADOR = it.ID_INDICADOR;
                            ind.ID_INICIATIVA = it.ID_INICIATIVA;
                            ind.ID_MEDMIT = it.ID_MEDMIT;
                            ind.ID_ENFOQUE = it.ID_ENFOQUE;
                            ind.SIGLA = it.listaInd[0].VALOR;
                            listaE.Add(ind);
                            //id_indicadores += Convert.ToString(it.ID_INDICADOR) + "/";
                        }
                        //id_indicadores = id_indicadores.Substring(0, id_indicadores.Length - 1);
                    }
                }
            }
            //return id_indicadores;
            return listaE;
        }

    }
}