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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Globalization;
using Ionic.Zip;

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
            ListaObjeto modelo = new ListaObjeto();
            modelo.listaMedidaMitigacion = modelo.listaMedidaMitigacion = MedidaMitigacionLN.ListarMedidaMitigacion(new MedidaMitigacionBE());
            return View(modelo);
        }
        public ActionResult AccionMitigacion()
        {
            ListaObjeto modelo = new ListaObjeto();
            UsuarioBE usu = new UsuarioBE();

            if (Session["rol"] == null)
            {
                return RedirectToAction("SinSesion", "Error");
            }
            if (Convert.ToString(Session["rol"]) == "1")
            {
                usu.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
                usu.NOMBRES_USUARIO = Convert.ToString(Session["nombres"]);
                usu.APELLIDOS_USUARIO = Convert.ToString(Session["apellidos"]);
                usu.PRIMER_INICIO = Convert.ToString(Session["primer_inicio"]);
                usu.ID_SECTOR_INST = Convert.ToInt32(Session["id_sector"]); //add
            }
            else
            {
                usu.PRIMER_INICIO = "0";
            }
            if (Convert.ToInt32(Session["rol"]) == 1 || Convert.ToInt32(Session["rol"]) == 2)
            {
                modelo.listaMedidaMitigacion = MedidaMitigacionLN.ListarMedidaMitigacion(new MedidaMitigacionBE());
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
            modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
            modelo.listaMedidaMitigacion = MedidaMitigacionLN.ListarMedidaMitigacion(new MedidaMitigacionBE());
            if (ini > 0)
            {

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
            modelo.id_sector = Convert.ToInt32(Session["id_sector"]); //add
            modelo.id_rol = Convert.ToInt32(Session["rol"]); //add
            return View(modelo);
        }

        public ActionResult CorregirIniciativa(int id, int ini)
        {
            MvSesion modelo = new MvSesion();
            int validar = IniciativaLN.ValidarVista(ini);
            if (validar == 1 || validar == 3 || validar == 4)
            {

                modelo.iniciativa = ini;
                modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
                modelo.listaMedidaMitigacion = MedidaMitigacionLN.ListarMedidaMitigacion(new MedidaMitigacionBE());
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }
            modelo.id_sector = Convert.ToInt32(Session["id_sector"]); //add
            modelo.id_rol = Convert.ToInt32(Session["rol"]); //add

            return View(modelo);
        }

        public ActionResult RevisarIniciativa(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(ini);
            if (validar == 2 || validar == 5)
            {
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
                modelo.estado_flujo = validar;
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
                Session["nombres_destino"] = modelo.usuario.NOMBRES;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult DetalleIndicador(int id, int ini)
        {
            Session["MisArchivos"] = null;
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 6 || validar == 7 || validar == 8 || validar == 12 || validar == 13 || validar == 14 || validar == 15 || validar == 19 || validar == 20 || validar == 21 || validar == 22 || Convert.ToInt16(Session["rol"]) == 7) //add 14-10-20
            {
                IniciativaBE inic = new IniciativaBE();
                inic.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);

                if (modelo.iniciativa_mit.ListaSustentos.Count > 0) modelo.iniciativa_mit.ListaSustentos = limpiarFileSustento(modelo.iniciativa_mit.ListaSustentos);//add

                modelo.menor = IndicadorLN.DetalleIndicadorEnfoque(modelo.iniciativa_mit.ID_INICIATIVA);
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);

                modelo.listaParametro = ParametroLN.ListarParametro(modelo.iniciativa_mit.ID_MEDMIT);

                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.url = WebConfigurationManager.AppSettings.Get("Sello");
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
                }
                else
                {
                    modelo.menor = enf;
                    Session["enfoque"] = enf;
                }
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult RevisarDetalleIndicador(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 8 || validar == 11 || validar == 13)
            {
                IniciativaBE inic = new IniciativaBE();
                IndicadorDataBE ida = new IndicadorDataBE();
                inic.ID_INICIATIVA = id;
                ida.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);

                if(modelo.iniciativa_mit.ListaSustentos.Count > 0) modelo.iniciativa_mit.ListaSustentos = limpiarFileSustento(modelo.iniciativa_mit.ListaSustentos);//add

                //modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
                //modelo.listaEnfoque = EnfoqueLN.listarEnfoqueIniciativa(modelo.iniciativa_mit.ID_INICIATIVA);
                ida.ID_MEDMIT = modelo.iniciativa_mit.ID_MEDMIT;
                modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);

                modelo.listaIndData = IndicadorLN.ListarDatosTablaDinamica(ida);

                modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);
                //modelo.id_indicadores = capturarIndicadores(modelo.listaIndData); //17-05-2020

                //modelo.listaParametro = ParametroLN.ListarParametro(modelo.iniciativa_mit.ID_MEDMIT);            
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.usuario = UsuarioLN.UsuarioIniciativa(modelo.iniciativa_mit.ID_USUARIO);
                //modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
                modelo.id_enfoques = concatenarIdEnfoque(modelo.listaIndData); //add 2-3-20
                modelo.revision = 1;
                modelo.estado_flujo = validar;
                Session["lista_indicador_revision"] = modelo.listaIndicador;//add
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
                Session["nombres_destino"] = modelo.usuario.NOMBRES;

                //string factores = "";
                //if (modelo.listaIndData.Count > 0)
                //{
                //    List<int> id_factores = modelo.listaIndData[modelo.listaIndData.Count - 1].id_factores;

                //    for (var i = 0; i < id_factores.Count; i++)
                //    {
                //        factores += id_factores[i] + ",";
                //    }
                //    factores = factores.Substring(0, factores.Length - 1);
                //    modelo.id_factores = factores;
                //}
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }


            return View(modelo);
        }

        public ActionResult CorregirDetalleIndicador(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 9 || validar == 10)
            {
                IniciativaBE inic = new IniciativaBE();
                inic.ID_INICIATIVA = id;
                modelo.iniciativa_mit = inic;
                modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);

                if (modelo.iniciativa_mit.ListaSustentos.Count > 0) modelo.iniciativa_mit.ListaSustentos = limpiarFileSustento(modelo.iniciativa_mit.ListaSustentos);//add

                modelo.menor = IndicadorLN.DetalleIndicadorEnfoque(modelo.iniciativa_mit.ID_INICIATIVA);
                modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaEnfoque = EnfoqueLN.listarEnfoqueMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.menor = IniciativaLN.getIdEnfoqueMenor(inic);
                modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.url = WebConfigurationManager.AppSettings.Get("Sello");
                modelo.revision = 0;
                Session["enfoque"] = modelo.menor;
                //if (modelo.menor == 0)
                //{
                //    modelo.menor = getMenorId(modelo.listaEnfoque);
                //}
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult RevisarAdminDetalleIndicador(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 12 || validar == 15 || validar == 19)
            {
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

                modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);
                //modelo.id_indicadores = capturarIndicadores(modelo.listaIndData); //17-05-2020

                modelo.id_enfoques = concatenarIdEnfoque(modelo.listaIndData); //add
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
                modelo.listaTipoIniciativa = TipoIniciativaLN.listarTipoIniciativa();
                modelo.revision = 1;
                modelo.estado_flujo = validar;
                Session["lista_indicador_revision"] = modelo.listaIndicador;//add
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
                Session["id_medida"] = modelo.medida.ID_MEDMIT;

            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult EvaluarIniciativaDetalle(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 21)
            {
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

                modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);
                //modelo.id_indicadores = capturarIndicadores(modelo.listaIndData); //17-05-2020

                modelo.id_enfoques = concatenarIdEnfoque(modelo.listaIndData); //add
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                modelo.usuario = UsuarioLN.UsuarioAdministrador();
                modelo.revision = 1;
                modelo.estado_flujo = validar;
                Session["lista_indicador_revision"] = modelo.listaIndicador;//add
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
                Session["usuario_destino"] = modelo.usuario.ID_USUARIO;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult VerificarIniciativaDetalle(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            int validar = IniciativaLN.ValidarVista(id);
            if (validar == 22)
            {
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

                modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);
                //modelo.id_indicadores = capturarIndicadores(modelo.listaIndData); //17-05-2020

                modelo.id_enfoques = concatenarIdEnfoque(modelo.listaIndData); //add
                modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
                modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
                modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
                if (modelo.iniciativa_mit.ID_ETAPA == 10)
                {
                    modelo.usuario = UsuarioLN.UsuarioAdministrador();
                }
                else
                {
                    modelo.usuario = UsuarioLN.UsuarioEvaluador();
                }
                Session["lista_indicador_revision"] = modelo.listaIndicador;//add
                Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
                Session["usuario_destino"] = modelo.usuario.ID_USUARIO;
                modelo.revision = 1;
                modelo.estado_flujo = validar;
            }
            else
            {
                return RedirectToAction("Default", "Error");
            }

            return View(modelo);
        }

        public ActionResult CambiarClave()
        {
            MvReCAPTCHASettings modelo = new MvReCAPTCHASettings()
            {
                ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"],
                ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"],
                OK = true
            };
            ViewBag.caracter = "@#.";
            return View(modelo);
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
            usu.order_by = "U.ID_ESTADO_USUARIO, U.ID_USUARIO";
            usu.order_orden = "DESC";
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
            modelo.detalle = 1;
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

            modelo.listaIndicador = capturarIndicadores(modelo.listaIndData);

            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.detalle = 1;
            Session["lista_indicador_revision"] = modelo.listaIndicador;//add
            return View(modelo);
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

        public ActionResult Resultados()
        {
            MvAnno model = new MvAnno();
            var anno = DateTime.Now.Year;
            model.listaAnno = AnnoLN.ListaAnno(anno);
            return View(model);
        }
        ////////////////////////////////////////////////////////7
        public JsonResult ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
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
                    string ruta = WebConfigurationManager.AppSettings.Get("Server");
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    //entidad.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                    entidad.VALIDAR_RUTA = 1;
                    entidad.ASUNTO = "Registro Acción Mitigación - Entidad " + usuario.INSTITUCION;
                    entidad.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                    string link1 = "Revisar acción de mitigación:<br/>" + link(ruta, 1, 1, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                    entidad.DESCRIPCION = entidad.SALUDO + "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha realizado un registro de la acción mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador<br/><br/>" + link1;
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

            string ruta = WebConfigurationManager.AppSettings.Get("Server");
            var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
            entidad = IniciativaLN.ActualizarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    //entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    //entidad.ASUNTO = "Registro Iniciativa - Entidad " + usuario.INSTITUCION;
                    //entidad.DESCRIPCION = "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha realizado un registro de la Iniciativa <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>";

                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    //entidad.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                    entidad.VALIDAR_RUTA = 1;
                    entidad.ASUNTO = "Registro Acción Mitigación - Entidad " + usuario.INSTITUCION;
                    entidad.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                    string link1 = "Revisar acción de mitigación:<br/>" + link(ruta, 1, 1, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                    entidad.DESCRIPCION = entidad.SALUDO + "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha realizado un registro de la acción mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador<br/><br/>" + link1;
                    EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    entidad.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                    //entidad.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                    entidad.VALIDAR_RUTA = 1;
                    entidad.ASUNTO = "Observación subsanada acción mitigación - Entidad " + usuario.INSTITUCION;
                    entidad.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                    string link1 = "Revisar Subsanación de acción mitigación:<br/>" + link(ruta, 1, 5, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                    entidad.DESCRIPCION = entidad.SALUDO + "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha subsanado la(s) observación(es) de la acción mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse a la acción mitigación<br/><br/>" + link1;
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

            string ruta = WebConfigurationManager.AppSettings.Get("Server");
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IniciativaLN.ObservacionIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                //iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                IniciativaBE iniciativa = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = entidad.ID_INICIATIVA });
                entidad.EMAIL_USUARIO = iniciativa.EMAIL_USUARIO;
                //entidad.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                entidad.VALIDAR_RUTA = 1;
                entidad.ASUNTO = "Observación acción mitigación - MRVMinem";
                entidad.SALUDO = "Estimado Sr(a): " + iniciativa.NOMBRES + "<br/></br/>";
                string link1 = "Observación de acción mitigación:<br/>" + link(ruta, 1, 2, entidad.ID_INICIATIVA, iniciativa.ID_USUARIO, 0);
                entidad.DESCRIPCION = entidad.SALUDO + "En la acción mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong> se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse a su acción de mitigación<br/><br/>" + link1;
                EnvioCorreo hilo_correo = new EnvioCorreo(entidad, 1);
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

            IniciativaBE ini = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = entidad.ID_INICIATIVA });
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            entidad = IniciativaLN.AprobarIniciativaMitigacion(entidad);
            if (entidad.OK)
            {
                //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                //entidad.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                entidad.EMAIL_USUARIO = ini.EMAIL_USUARIO;
                //entidad.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                entidad.VALIDAR_RUTA = 1;
                entidad.ASUNTO = "Aprobación acción mitigación - MRVMinem ";
                entidad.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";
                //string link = "Registro manual de detalle de Iniciativa de Mitigación:<br/><a href=\"" + ruta + "Gestion/DetalleIndicador/" + entidad.ID_INICIATIVA + "/34\" > " + ruta + "Gestion/DetalleIndicador/" + entidad.ID_INICIATIVA + "/34</a><br/><br/>Registro a través de Excel de detalle de Iniciativa de Mitigación:<br/><a href=\"" + ruta + "Detalle/DetalleIndicadorMasivo/" + entidad.ID_INICIATIVA + "/34\" > " + ruta + "Detalle/DetalleIndicadorMasivo/" + entidad.ID_INICIATIVA + "/34</a><br/><br/>";
                //string link = "Registro manual de detalle de Iniciativa de Mitigación:<br/><a href=\"" + ruta + "MRV/MINEM/minem-010-" + entidad.ID_INICIATIVA + "-3-1/reg-minem\" > " + ruta + "MRV/MINEM/minem-010-" + entidad.ID_INICIATIVA + "-3-1/reg-minem</a><br/><br/>Registro a través de Excel de detalle de Iniciativa de Mitigación:<br/><a href=\"" + ruta + "MRV/MINEM/minem-020-" + entidad.ID_INICIATIVA + "-3-1/reg-minem\" > " + ruta + "MRV/MINEM/minem-010-" + entidad.ID_INICIATIVA + "-3-1/reg-minem</a><br/><br/>";
                string link1 = "Registro manual de detalle de acción de mitigación:<br/>" + link(ruta, 2, 3, entidad.ID_INICIATIVA, ini.ID_USUARIO, 1);
                string link2 = "Registro a través de Excel de detalle de acción de mitigación:<br/>" + link(ruta, 2, 3, entidad.ID_INICIATIVA, ini.ID_USUARIO, 2);
                entidad.DESCRIPCION = entidad.SALUDO + "Su acción de mitigación fue aprobada, ahora proceda a completar sus datos en el siguiente link<br/><br/>" + link1 + link2;
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

        public JsonResult RegistrarDetalleIndicador(HttpPostedFileBase[] fledoc2, HttpPostedFileBase[] fledocumentos, IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);

            //for (int i = 0; i < 9999999; i++) { for (int j = 0; j < 499; j++) { var a = 1; } }

            try
            {
                //if (fledoc != null)
                //{
                //    foreach (var f in fledoc)
                //    {
                //        if (f != null)
                //        {
                //            string archivoOriginal = f.FileName;
                //            string nomArchivoSave = "";
                //            nomArchivoSave = Guid.NewGuid() + Path.GetExtension(f.FileName).ToString();
                //            var carpeta = WebConfigurationManager.AppSettings.Get("Sustentatorio");
                //            var ruta = Path.Combine(carpeta, nomArchivoSave);
                //            f.SaveAs(ruta);


                //            if (entidad.ListaIndicadores != null)
                //            {
                //                foreach (IndicadorBE item in entidad.ListaIndicadores)
                //                {
                //                    if (item.ADJUNTO_BASE != null)
                //                    {
                //                        if (item.ADJUNTO_BASE.Contains(archivoOriginal))
                //                        {
                //                            item.ADJUNTO = nomArchivoSave;
                //                            break;
                //                        }
                //                    }
                //                }
                //            }
                //        }
                //    }
                //}

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
                List<IndicadorArchivoBE> lista_remover = new List<IndicadorArchivoBE>(); //add 18-04-2020

                if (entidad.ListaIndicadoresData != null)
                {
                    if (entidad.ListaIndicadoresData.Count > 0)
                    {
                        foreach (IndicadorDataBE ie in entidad.ListaIndicadoresData)
                        {
                            if (!string.IsNullOrEmpty(ie.ADJUNTO))
                            {
                                List<IndicadorArchivoBE> MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                                IndicadorArchivoBE encontrado = MisArchivos.Find(A => A.ADJUNTO_BASE.Equals(ie.ADJUNTO));
                                if (encontrado != null)
                                {
                                    ie.ArchivoSustento = new IndicadorArchivoBE() { ADJUNTO = encontrado.ADJUNTO, ADJUNTO_BASE = encontrado.ADJUNTO_BASE, ID_INICIATIVA = entidad.ID_INICIATIVA, ID_INDICADOR = ie.ID_INDICADOR };
                                    lista_remover.Add(encontrado); //add 18-04-2020
                                    MisArchivos = removerArchivosRepetidos(MisArchivos, lista_remover); //add 18-04-2020
                                }
                            }
                        }
                        listaDataE = entidad.ListaIndicadoresData;
                    }
                }
                


                //if (!string.IsNullOrEmpty(entidad.DATA))
                //{
                //    var valores = entidad.DATA.Split('/');

                //    for (int i = 0; i < valores.Length; i++)
                //    {
                //        var indic = valores[i].Split(';');
                //        var valores_det = indic[0].Split('|');
                //        IndicadorDataBE dataE = new IndicadorDataBE();
                //        List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();
                //        for (int j = 0; j < valores_det.Length; j++)
                //        {
                //            var parametros = valores_det[j].Split(',');

                //            IndicadorDataBE ind = new IndicadorDataBE();
                //            ind.ID_ENFOQUE = Convert.ToInt32(parametros[0]);
                //            ind.ID_MEDMIT = Convert.ToInt32(parametros[1]);
                //            ind.ID_PARAMETRO = Convert.ToInt32(parametros[2]);
                //            if (Convert.ToString(parametros[3]) == "0")
                //            {
                //                ind.VALOR = "";
                //            }
                //            else
                //            {
                //                ind.VALOR = Convert.ToString(parametros[3]);
                //            }
                //            listaP.Add(ind);
                //        }
                //        if (string.IsNullOrEmpty(indic[1])) indic[1] = "0";
                //        dataE.ID_INDICADOR = Convert.ToInt32(indic[1]);
                //        dataE.listaInd = listaP;
                //        //Ubicamos los archivos del detalle - 24.03.2020
                //        if (!string.IsNullOrEmpty(indic[2]))
                //        {
                //            List<IndicadorArchivoBE> MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                //            //if (lista_remover.Count > 0) MisArchivos = removerArchivosRepetidos(MisArchivos, lista_remover); //add 18-04-2020
                //            IndicadorArchivoBE encontrado = MisArchivos.Find(A => A.ADJUNTO_BASE.Equals(indic[2]));                            
                //            if (encontrado != null)
                //            {
                //                dataE.ArchivoSustento = new IndicadorArchivoBE() { ADJUNTO = encontrado.ADJUNTO, ADJUNTO_BASE = encontrado.ADJUNTO_BASE, ID_INICIATIVA = entidad.ID_INICIATIVA, ID_INDICADOR = dataE.ID_INDICADOR };
                //                lista_remover.Add(encontrado); //add 18-04-2020
                //                MisArchivos = removerArchivosRepetidos(MisArchivos, lista_remover); //add 18-04-2020
                //            }                                
                //        }

                //        listaDataE.Add(dataE);
                //    }
                //}


                //============================================================ add 12-03-2020
                //if (Convert.ToInt32(Session["enfoque"]) != entidad.ID_ENFOQUE)
                //{
                if (entidad.ID_ESTADO == 0 || entidad.ID_ESTADO == 1)
                {
                    IndicadorLN.deleteRegDetalle(entidad);
                    //Session["enfoque"] = entidad.ID_ENFOQUE;
                }
                //}
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

                var v = false;
                if (entidad.ID_MEDMIT == 4)
                    v = IniciativaLN.GuardarDatosAuditor(entidad);
                else
                    v = true;

                entidad.OK = v;
                if (entidad.OK) {
                    if (Convert.ToInt16(Session["rol"]) == 7)
                    {
                        entidad.OK = true;
                    }
                    else
                    {
                        registrarInversion(entidad.listaMonto);
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

                        string ruta_link = WebConfigurationManager.AppSettings.Get("Server");
                        if (entidad.ID_ESTADO == 1)
                        {
                            IniciativaBE iniciativa = new IniciativaBE();
                            var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
                            var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                            iniciativa.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                            //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                            iniciativa.VALIDAR_RUTA = 1;
                            iniciativa.ASUNTO = "Registro detalle de la acción de mitigación - Entidad " + usuario.INSTITUCION;
                            entidad.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                            string link1 = "Revisar detalle de la acción de mitigación:<br/>" + link(ruta_link, 3, 1, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                            iniciativa.DESCRIPCION = entidad.SALUDO + "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha registrado el/los detalle(s) de la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse al detalle de la acción de mitigación<br/><br/>" + link1;
                            EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                            Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                        }
                        else if (entidad.ID_ESTADO == 5)
                        {
                            IniciativaBE iniciativa = new IniciativaBE();
                            var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
                            var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                            iniciativa.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                            //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                            iniciativa.VALIDAR_RUTA = 1;
                            iniciativa.ASUNTO = "Observación subsanada de detalle de la acción de mitigación - Entidad " + usuario.INSTITUCION;
                            entidad.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                            string link1 = "Revisar acción de mitigación:<br/>" + link(ruta_link, 3, 5, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                            iniciativa.DESCRIPCION = entidad.SALUDO + "El usuario de la entidad <strong>" + usuario.INSTITUCION + "</strong> ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong>, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse al detalle de la acción de mitigación<br/><br/>" + link1;
                            EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                            Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                        }
                    }
                }                 
                
                Session["correo_destino"] = "";
                itemRespuesta.success = entidad.OK;
                itemRespuesta.extra = entidad.ID_ESTADO.ToString();
                itemRespuesta.message = entidad.OK ? "" : "Ocurrio un problema durante el registro.";
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
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                IniciativaBE iniciativa = new IniciativaBE();
                IniciativaBE ini = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = entidad.ID_INICIATIVA });
                iniciativa.EMAIL_USUARIO = ini.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Observación detalle de la acción de mitigación - MRVMinem";
                iniciativa.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";
                string link1 = "Observación de la acción de mitigación:<br/>" + link(ruta, 3, 2, entidad.ID_INICIATIVA, ini.ID_USUARIO, ini.ID_TIPO_INGRESO);
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "En el detalle de la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong> se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse al detalle de la acción de mitigación<br/><br/>" + link1;
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";
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
                string urlSello = WebConfigurationManager.AppSettings.Get("Sello");
                IniciativaBE iniciativa = new IniciativaBE();
                IniciativaBE ini = IniciativaLN.ObtenerUsuarioIniciativa(new IniciativaBE { ID_INICIATIVA = entidad.ID_INICIATIVA });
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                iniciativa.EMAIL_USUARIO = ini.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Aprobación detalle de la acción de mitigación - MRVMinem ";
                iniciativa.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "Felicitaciones, el detalle de su acción de mitigación fue revisada y aprobada. Lo invitamos a ingresar a nuestra <a href=\"" + urlSello + "\">Plataforma del Sello de Reconocimiento de Energía Sostenible</a><br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;

                IniciativaBE iniciativa2 = new IniciativaBE();
                UsuarioBE usu = UsuarioLN.UsuarioAdministrador();
                iniciativa2.VALIDAR_RUTA = 1;
                iniciativa2.EMAIL_USUARIO = usu.EMAIL_USUARIO;
                //iniciativa2.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa2.ASUNTO = "Aprobación detalle de la acción de mitigación - MRVMinem ";
                iniciativa2.SALUDO = "Estimado Sr(a): " + usu.NOMBRES + "<br/></br/>";
                string link1 = "Revisión detalle de acción de mitigación:<br/>" + link(ruta, 4, 3, entidad.ID_INICIATIVA, usu.ID_USUARIO, 0);
                iniciativa2.DESCRIPCION = iniciativa2.SALUDO + "El detalle de la acción de mitigación <strong>" + ini.NOMBRE_INICIATIVA + "</strong> de la Entidad <strong>" + ini.NOMBRE_INSTITUCION + "</strong> fue revisada y aprobada por el Especialista, en espera de su revisión.<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse al detalle de la acción de mitigación<br/><br/>" + link1;
                EnvioCorreo hilo_correo2 = new EnvioCorreo(iniciativa2, 1);
                Task tarea2 = Task.Factory.StartNew(() => hilo_correo2.menajeIniciativa());
                itemRespuesta.extra = entidad.DESCRIPCION;
                Session["correo_destino"] = "";


                //string link1 = "Registro manual de detalle de Iniciativa de Mitigación:<br/>" + link(ruta, 2, 3, entidad.ID_INICIATIVA, ini.ID_USUARIO, 1);
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
                iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la acción de mitigación (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
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
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                IniciativaBE iniciativa = new IniciativaBE();
                var especialista = UsuarioLN.EspecialistaMedida(entidad.ID_MEDMIT);
                iniciativa.EMAIL_USUARIO = especialista.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Observación detalle de la acción de mitigación - MRVMinem ";
                iniciativa.SALUDO = "Estimado Sr(a): " + especialista.NOMBRES + "<br/></br/>";
                string link1 = "Observación Detalle de la acción de mitigación:<br/>" + link(ruta, 4, 2, entidad.ID_INICIATIVA, especialista.ID_USUARIO, 0);
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "En el detalle de la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong> se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse al detalle de la acción de mitigación<br/><br/>" + link1;
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
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                IniciativaBE iniciativa = new IniciativaBE();
                UsuarioBE usu = UsuarioLN.UsuarioAdministrador();
                iniciativa.EMAIL_USUARIO = usu.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Observación acción de mitigación - MRVMinem";
                iniciativa.SALUDO = "Estimado Sr(a): " + usu.NOMBRES + "<br/></br/>";
                string link1 = "Observación acción de mitigación:<br/>" + link(ruta, 5, 2, entidad.ID_INICIATIVA, usu.ID_USUARIO, 0);
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "En la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong> se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse a la acción de mitigación<br/><br/>" + link1;
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
            int validar = IniciativaLN.ValidarVista(entidad.ID_INICIATIVA);
            if (validar == 21)
            {
                entidad = IndicadorLN.EvaluarIniciativaDetalleIndicador(entidad);
                if (entidad.OK)
                {
                    //var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Evaluación acción de mitigación y detalle Indicador - MRVMinem ";
                    iniciativa.DESCRIPCION = "Los detalles de indicadores y la acción de mitigación (" + entidad.NOMBRE_INICIATIVA + ") fueron revisados y aprobados por el Evaluador MINAM<br/><br/>";
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
                string ruta = WebConfigurationManager.AppSettings.Get("Server");
                IniciativaBE iniciativa = new IniciativaBE();
                UsuarioBE usu = UsuarioLN.UsuarioAdministrador();
                iniciativa.EMAIL_USUARIO = usu.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Observación acción de mitigación - MRVMinem";
                iniciativa.SALUDO = "Estimado Sr(a): " + usu.NOMBRES + "<br/></br/>";
                string link1 = "Observación acción de mitigación:<br/>" + link(ruta, 8, 2, entidad.ID_INICIATIVA, usu.ID_USUARIO, 0);
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "En la acción de mitigación <strong>" + entidad.NOMBRE_INICIATIVA + "</strong> se ha detectado algunos datos a corregir, los detalles en la siguiente descripción: <br/><br/>" + entidad.DESCRIPCION + "<br/><br/>Por favor, pulse o copie el siguiente link en su navegador para dirigirse a la acción de mitigación<br/><br/>" + link1;
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
                //
                //ini.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.EMAIL_USUARIO = iniciativa.EMAIL_USUARIO;
                //iniciativa.EMAIL_USUARIO = "juancarlossotoc1990@gmail.com";
                iniciativa.ASUNTO = "Su acción de mitigación ha sido Evaluada y/o Verificada - MRVMinem ";
                iniciativa.SALUDO = "Estimado Sr(a): " + iniciativa.NOMBRES + "<br/></br/>";
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "Felicitaciones, su acción de mitigación ha sido evaluada y/o verificada por nuestro equipo, asimismo ha contribuido en la reducción de los gases de efecto invernadero (GEI). Por ello, lo invitamos a ingresar a nuestra <a href=\"" + urlSello + "\">Plataforma del Reconocimiento de Energía Eficiente y Sostenible</a><br/><br/>";
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
            {
                itemRespuesta.extra = nombreArchivo;
                //========================================================= add 15-03-2020
                BlockChainLN.NombrePDFBlockchain(new BlockChainBE() { ID_BLOCKCHAIN = entidad.ID_BLOCKCHAIN, NOMBRE_PDF = nombreArchivo });
            }


            return Respuesta(itemRespuesta);
        }

        public JsonResult DescargarBlockChain_2(int IdBlockchain)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string nombreArchivo = Guid.NewGuid() + ".pdf";
            string nombrePDF = nombrePDF = WebConfigurationManager.AppSettings["RutaTemp"] + "\\" + nombreArchivo;
            itemRespuesta.success = new ReporteRepositorio().GenerarPDFBlockChain(IdBlockchain, nombrePDF);
            if (itemRespuesta.success)
            {
                itemRespuesta.extra = nombreArchivo;
                //========================================================= add 15-03-2020
                BlockChainLN.NombrePDFBlockchain(new BlockChainBE() { ID_BLOCKCHAIN = IdBlockchain, NOMBRE_PDF = nombreArchivo });
            }


            return Respuesta(itemRespuesta);
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
                //========================================================= add 15-03-2020
                IniciativaLN.NombrePDFFicha(entidad);
            }


            return Respuesta(itemRespuesta);
        }

        public JsonResult MostrarBlockChain(BlockChainBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad = BlockChainLN.MostrarBlockchain(entidad);
            if (entidad.OK)
            {
                itemRespuesta.extra = entidad.NOMBRE_PDF;
            }
            itemRespuesta.success = entidad.OK;
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
                    else if (entidad.ID_ROL == 7)
                    {
                        perfil = "Auditor";
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
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la acción de mitigación (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Observación subsanada de Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la acción de mitigación (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
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

        //add
        public JsonResult ListaBusquedaAvanzadaPrivadoBlock(IniciativaBE entidad)
        {
            entidad.ID_ROL = Convert.ToInt32(Session["rol"]);
            List<IniciativaBE> lista = IniciativaLN.ListaBusquedaAvanzadoPrivadoBlock(entidad);
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
                        //p.VALOR = "";
                        p.VALOR = Convert.ToString(valores_det[3]);
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

            //List<AcumuladoBE> listaA = new List<AcumuladoBE>();
            //listaA = detalleAcumulado(listaN);

            return jsonResult;
        }

        public JsonResult CalcularAcumulado(string Valor)
        {
            List<IndicadorDataBE> listaP = new List<IndicadorDataBE>();

            List<AcumuladoBE> listaA = new List<AcumuladoBE>();
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
                        //p.VALOR = "";
                        p.VALOR = Convert.ToString(valores_det[3]);
                    }
                    else
                    {
                        p.VALOR = Convert.ToString(valores_det[3]);
                    }

                    listaP.Add(p);
                }

                listaP = IndicadorLN.CalculoIndicador(listaP);                
                listaA = detalleAcumulado(listaP);

            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            var jsonResult = Json(listaA, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult CalcularAcumuladoC(List<IndicadorDataBE> lista)
        {
            List<AcumuladoBE> listaA = new List<AcumuladoBE>();
            listaA = detalleAcumulado(lista);

            var jsonResult = Json(listaA, JsonRequestBehavior.AllowGet);
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
            //foreach (IndicadorDataBE ie in lista)
            //{//add   
            //    string anno = "", bau = "0", ini = "0", reduccion = "0";
            //    foreach (IndicadorDataBE iet in ie.listaInd)
            //    {
            //        if (iet.ID_PARAMETRO == 6) anno = iet.VALOR;
            //        else if (iet.ID_PARAMETRO == 9) bau = iet.VALOR;
            //        else if (iet.ID_PARAMETRO == 10) ini = iet.VALOR;
            //        else if (iet.ID_PARAMETRO == 11) reduccion = iet.VALOR;
            //    }
            //    ie.listaAcumulado = detalleAcumulado(ie.listaInd);                
            //    foreach (IndicadorDataBE iet in ie.listaInd)
            //    {
            //        if (iet.ID_PARAMETRO == 6) iet.VALOR = anno;
            //        else if (iet.ID_PARAMETRO == 9) iet.VALOR = bau;
            //        else if (iet.ID_PARAMETRO == 10) iet.VALOR = ini;
            //        else if (iet.ID_PARAMETRO == 11) iet.VALOR = reduccion;
            //    }
            //}
            lista = IniciativaLN.MostrarAcumuladoInd(lista, entidad.ID_INICIATIVA, entidad.ID_MEDMIT, entidad.ID_ENFOQUE);
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
            //itemRespuesta.extra = "1";
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
                    iniciativa.DESCRIPCION = iniciativa.SALUDO + "Se envió un paquete de acciones de mitigación correspondiente a la medida " + med.NOMBRE_MEDMIT + " del período " + entidad.FECHA_IMPLE_INICIATIVA.ToString("dd/MM/yyyy") + " - " + entidad.FECHA_FIN_INICIATIVA.ToString("dd/MM/yyyy") + ", en espera de su evaluación<br/><br/>";
                }
                else
                {
                    iniciativa.ASUNTO = "Envio de acción(es) de mitigación - MRVMinem ";
                    iniciativa.DESCRIPCION = iniciativa.SALUDO + "Se le asignó un grupo de acciones de mitigación para su verificación<br/><br/>";
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
            entidad.SALUDO = "Estimado Sr(a): " + usu.NOMBRES + "<br/></br/>";

            entidad.CABECERA = "Detallamos la siguiente información de su registro:<br/><br/>Código de la acción de mitigación: " + inic.ID_INICIATIVA + "<br/>Nombre de su proyecto: " + inic.NOMBRE_INICIATIVA + "<br/>Medida de Mitigación asociada: " + inic.NOMBRE_MEDMIT + "<br/>Estado: Evaluada y atendida<br/>Fecha " + inic.FECHA + "<br/><br/>";

            //if (entidad.ID_ROL == 1)
            //{
            //    entidad.CABECERA = "Le informamos de su inicativa de mitigación de código " + inic.ID_INICIATIVA + ", con nombre de proyecto (" + inic.NOMBRE_INICIATIVA + ")" + " asociado a la medida de mitigación " + inic.NOMBRE_MEDMIT + ", evaluada y atendida en la fecha "+ inic.FECHA + " :<br/><br/>";
            //}
            //else
            //{
            //    entidad.CABECERA = "La inicativa de mitigación de código " + inic.ID_INICIATIVA + ", con nombre de proyecto (" + inic.NOMBRE_INICIATIVA + ")" + " asociado a la medida de mitigación " + inic.NOMBRE_MEDMIT + ", evaluada y atendida en la fecha " + inic.FECHA + " :<br/><br/>";
            //}
            entidad.DESCRIPCION = entidad.SALUDO + entidad.CABECERA + entidad.DESCRIPCION + "<br/><br/>Enviado por el " + Convert.ToString(Session["nombreRol"]) + ": " + Convert.ToString(Session["nombres"]) + "<br/><br/>";
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
                ini.ASUNTO = "Su acción de mitigación ha sido Evaluada y/o Verificada - MRVMinem ";
                ini.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";
                ini.DESCRIPCION = ini.SALUDO + "Felicitaciones, su acción de mitigación ha sido evaluada y/o verificada por nuestro equipo, asimismo ha contribuido en la reducción de los gases de efecto invernadero (GEI). Por ello, lo invitamos a ingresar a nuestra <a href=\"" + urlSello + "\">Plataforma del Reconocimiento de Energía Eficiente y Sostenible</a><br/><br/>";

                EnvioCorreo hilo_correo = new EnvioCorreo(ini, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
            }
            
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

        public JsonResult ValidarRevisionIniciativa(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = IniciativaLN.ValidarRevisionIniciativa(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = Convert.ToString(entidad.CANTIDAD);
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
                                ws1.Cells["E" + row].Value = "                    - " + dt_fila.CELULAR_USUARIO;
                            }
                            else if (string.IsNullOrEmpty(dt_fila.CELULAR_USUARIO))
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
            foreach (var item in lista)
            {
                if (item.ID_ENFOQUE < menor)
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

        public string concatenarIdEnfoque(List<IndicadorDataBE> lista)
        {
            string id_enfoques = "";
            if (lista.Count > 0)
            {
                foreach (var item in lista)
                {
                    id_enfoques += item.ID_ENFOQUE + ",";
                }
                id_enfoques = id_enfoques.Substring(0, id_enfoques.Length - 1);
            }

            return id_enfoques;
        }

        public string link(string ruta, int etapa, int estado, int id_iniciativa, int id_usuario, int opcion)
        {
            Random rnd = new Random();
            int r1 = rnd.Next(100, 999);
            int r2 = rnd.Next(100, 999);
            int r3 = rnd.Next(100, 999);
            int r4 = rnd.Next(100, 999);
            string r = "<a href=\"" + ruta + "MRV/MINEM/minem-" + r1 + "-" + id_iniciativa + "-" + etapa + "-" + estado + "-" + id_usuario + "-" + opcion + "/reg-minem-" + r3 + "-" + r4 + "\">" + ruta + "MRV/MINEM/minem-" + r1 + "-" + id_iniciativa + "-" + etapa + "-" + estado + "-" + id_usuario + "-" + opcion + "/reg-minem-" + r3 + "-" + r4 + "</a><br/><br/>";
            return r;
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
            //NumberFormatInfo formato = new CultureInfo("es-ES").NumberFormat;
            //formato.CurrencyGroupSeparator = ".";
            //formato.NumberDecimalSeparator = ",";
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
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Tipo de acción de mitigación:</span>&nbsp;<span> " + ini.TIPO_INICIATIVA + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Nombre de la acción de mitigación:</span>&nbsp;<span> " + ini.NOMBRE_INICIATIVA + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Descripción de la acción de mitigación:</span>&nbsp;<span> " + ini.DESC_INICIATIVA + "</span></div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Responsable del registro:</span>&nbsp;<span> " + ini.NOMBRES + "</span></div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Correo electrónico:</span>&nbsp;<span> " + ini.EMAIL_USUARIO + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Nombre de la institución:</span>&nbsp;<span> " + ini.INSTITUCION + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Dirección:</span>&nbsp;<span> " + ini.DIRECCION + "</span></div>";
            html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Datos generales</div>";
            html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Sector de la institución:</span>&nbsp;<span> " + ini.SECTOR + "</span></div>";
            html += "<div style='text-align: justify;font-size: 12px;'><span style='font-weight: bold;'>Ubicación:</span>&nbsp;<span> " + ini.UBICACION + "</span></div>";
            if (ini.MONEDA != null)
            {
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Moneda:</span>&nbsp;<span> " + ini.MONEDA + "</span></div>";
            }
            else
            {
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Moneda:</span>&nbsp;<span>  ------</span></div>";
            }
            //html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Moneda:</span>&nbsp;<span> " + ini.MONEDA + "</span></div>";
            if (ini.INVERSION_INICIATIVA != 0)
            {
                //html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Monto de inversión:</span>&nbsp;<span> " + ini.INVERSION_INICIATIVA.ToString("N", formato) + "</span></div>";
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Monto de inversión:</span>&nbsp;<span> " + ini.INVERSION_INICIATIVA.ToString("N2") + "</span></div>";
            }
            else
            {
                html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Monto de inversión:</span>&nbsp;<span>  ------</span></div>";
            }
            //html += "<div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Monto de inversión:</span>&nbsp;<span> " + ini.INVERSION_INICIATIVA.ToString("N", formato) + "</span></div>";
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

                html += "<br/><div style='text-align: left;font-weight: bold;font-size: 14px;'>Detalle de la acción de mitigación</div>";
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
                            string formateado = itemD.VALOR;
                            double retNum;
                            if (Double.TryParse(Convert.ToString(formateado), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum))
                            {
                                string cad = Convert.ToDouble(formateado).ToString("N2");
                                html += "       <td><span><small>" + cad + "</small></span></td>";
                            }
                            else
                            {
                                html += "       <td><span><small>" + itemD.VALOR + "</small></span></td>";
                            }
                        }
                    }
                    html += "               </tr>";
                }

                html += "       </tbody>";
                html += "   </table>";
                html += "</div>";
                html += "<br/><div style='text-align: left;font-size: 12px;'><span style='font-weight: bold;'>Total reducido de GEI: </span>&nbsp;<span> " + ini.TOTAL_GEI.ToString("N", new CultureInfo("en-US")) + " tCO<sub>2</sub>eq</span></div>";
                html += "</body>";
                html += "</html>";
            }

            return html;
        }


        [HttpPost]
        public ActionResult FileUpload(int IdIniciativa, int IdIndicador, string accion)
        {
            List<IndicadorArchivoBE> MisArchivos = null;
            List<IndicadorArchivoBE> uploadFile = new List<IndicadorArchivoBE>();
            string cargosesion = "0";

            if (accion == "I")
            {
                if (Session["MisArchivos"] != null)
                {
                    MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                    cargosesion = "1";
                }
                else
                {
                    MisArchivos = new List<IndicadorArchivoBE>();
                }
                string sessionId = this.Session.SessionID;
                var gui = Guid.NewGuid();
                String strCarpeta = WebConfigurationManager.AppSettings["Detalle"];
                HttpFileCollectionBase files = Request.Files;

                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFileBase file_Uploader = files[i];

                    if (file_Uploader != null)
                    {
                        IndicadorArchivoBE encontrado = null;
                        if (cargosesion == "1")
                        {
                            //Buscamos si esta en la sesión (si esta cambiando de archivo)
                            encontrado = MisArchivos.Find(A => A.ADJUNTO.Contains(IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-"));
                            if (encontrado != null)
                            {
                                System.IO.File.Delete(strCarpeta + "\\" + encontrado.ADJUNTO);
                            }
                        }

                        string fileName = string.Empty;
                        string destinationPath = string.Empty;
                        string Id_fileName = string.Empty;
                        fileName = Path.GetFileName(file_Uploader.FileName);

                        String[] ext = fileName.Split('.');
                        string extension = ext[(ext.Length - 1)].ToUpper().Trim();
                        string extCompara = ext[(ext.Length - 1)].ToUpper().Trim();
                        Id_fileName = IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-" + gui + "." + extCompara;

                        destinationPath = Path.Combine(strCarpeta, Id_fileName);
                        file_Uploader.SaveAs(destinationPath);

                        if (encontrado != null)
                        {
                            encontrado.ADJUNTO = Id_fileName;
                            encontrado.ADJUNTO_BASE = fileName;
                            encontrado.accion = "1";
                            encontrado.message = "Archivo Cargado";
                            encontrado.buscar = gui.ToString();
                            encontrado.pagina = Convert.ToInt16(Id_fileName.Split('-')[1]);
                            uploadFile.Add(encontrado);

                        }
                        else
                        {
                            IndicadorArchivoBE indicadorArchivo = new IndicadorArchivoBE() { ID_INICIATIVA = IdIniciativa, ID_INDICADOR = IdIndicador, ADJUNTO = Id_fileName, ADJUNTO_BASE = fileName, accion = "1", message = "Archivo Cargado", buscar = gui.ToString(), pagina = Convert.ToInt16(Id_fileName.Split('-')[1]) };
                            MisArchivos.Add(indicadorArchivo);
                            uploadFile.Add(indicadorArchivo);
                        }

                        Session["MisArchivos"] = MisArchivos;

                    }
                }
            }
            return Json(uploadFile);
        }

        public ActionResult FileDownload(int IdIniciativa, int IdIndicador, string accion)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            List<IndicadorArchivoBE> MisArchivos = null;
            string filename = IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-";
            string id_filename = "";
            string file_origen = "";

            if (accion == "I")
            {
                DirectoryInfo di = new DirectoryInfo(WebConfigurationManager.AppSettings["Detalle"]);
                foreach (var fil in di.GetFiles(filename + "*"))
                {
                    id_filename = fil.Name;
                    if (id_filename != "")
                    {
                        //Buscamos en la session
                        if (Session["MisArchivos"] != null)
                        {
                            MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                            IndicadorArchivoBE encontrado = MisArchivos.Find(A => A.ADJUNTO.Equals(id_filename));
                            if (encontrado != null)
                            {
                                file_origen = encontrado.ADJUNTO_BASE;
                            }
                        }
                        else
                        {
                            return null;
                        }

                        if (file_origen != "") {
                            byte[] fileBytes = System.IO.File.ReadAllBytes(WebConfigurationManager.AppSettings["Detalle"] + "\\" + id_filename);
                            string fileName = file_origen;
                            return File(fileBytes, MediaTypeNames.Application.Octet, file_origen);
                        }                        
                    }
                }
                //if (id_filename != "")
                //{
                //    //Buscamos en la session
                //    if (Session["MisArchivos"] != null)
                //    {
                //        MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                //        IndicadorArchivoBE encontrado = MisArchivos.Find(A => A.ADJUNTO.Equals(id_filename));
                //        if (encontrado != null)
                //        {
                //            file_origen = encontrado.ADJUNTO_BASE;
                //        }
                //        else
                //        {
                //            return null;
                //        }
                //    }
                //    else
                //    {
                //        return null;
                //    }

                //    byte[] fileBytes = System.IO.File.ReadAllBytes(WebConfigurationManager.AppSettings["Detalle"] + "\\" + id_filename);
                //    string fileName = file_origen;
                //    return File(fileBytes, MediaTypeNames.Application.Octet, file_origen);
                //}
            }
            else
            {

            }
            return Respuesta(itemRespuesta);

        }

        public ActionResult FileDownloadAllDetalle(int IdIniciativa)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            string rutaCarpeta = WebConfigurationManager.AppSettings["Sustentatorio"];
            int num = 0;
            List<IndicadorArchivoBE> listaArchivo = IndicadorArchivoLN.GetAllArchivoDetalleIndicador(new IndicadorArchivoBE() { ID_INICIATIVA = IdIniciativa, ID_INDICADOR = 0 });

            if (listaArchivo != null)
            {
                using (ZipFile zip = new ZipFile())
                {
                    foreach (IndicadorArchivoBE item in listaArchivo)
                    {
                        num += 1;
                        if (System.IO.File.Exists(rutaCarpeta + "\\" + item.ADJUNTO))
                        {
                            var archivoNombre = rutaCarpeta + "\\" + item.ADJUNTO;
                            var archivoNombreZip = num + "_" + item.ADJUNTO_BASE;
                            var arregloBytes = System.IO.File.ReadAllBytes(archivoNombre);

                            zip.AddEntry(archivoNombreZip, arregloBytes);

                        }
                    }
                    var miGuid = Guid.NewGuid();
                    var nombreArchivoZip = "Sustentos" + miGuid + ".zip";
                    using (MemoryStream output = new MemoryStream())
                    {
                        zip.Save(output);
                        return File(output.ToArray(), MediaTypeNames.Application.Octet, nombreArchivoZip);
                    }
                }
            }

            return Respuesta(itemRespuesta);
        }

        public ActionResult FileDownloadDetalle(int IdIniciativa, int IdIndicador, string accion)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            IndicadorArchivoBE archivo = IndicadorArchivoLN.GetArchivoDetalleIndicador(new IndicadorArchivoBE() { ID_INICIATIVA = IdIniciativa, ID_INDICADOR = IdIndicador });
            if (archivo != null)
            {
                byte[] fileBytes = System.IO.File.ReadAllBytes(WebConfigurationManager.AppSettings["Sustentatorio"] + "\\" + archivo.ADJUNTO);
                string fileName = archivo.ADJUNTO_BASE;
                return File(fileBytes, MediaTypeNames.Application.Octet, fileName);
            }

            else
            {
                //return null;
            }

            return Respuesta(itemRespuesta);

        }

        public ActionResult FileDelete(int IdIniciativa, int IdIndicador)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            List<IndicadorArchivoBE> MisArchivos = null;
            string filename = IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-";
            String strCarpeta = WebConfigurationManager.AppSettings["Detalle"];

            if (Session["MisArchivos"] != null)
            {
                MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
            }
            if (MisArchivos != null)
            {
                DirectoryInfo di = new DirectoryInfo(WebConfigurationManager.AppSettings["Detalle"]);
                foreach (var fil in di.GetFiles(filename + "*"))
                {
                    IndicadorArchivoBE encontrado = MisArchivos.Find(A => A.ADJUNTO.Equals(fil.Name));
                    if (encontrado != null)
                    {
                        MisArchivos.Remove(encontrado);
                    }
                    System.IO.File.Delete(strCarpeta + "\\" + fil.Name);
                }
            }
            itemRespuesta.success = true;

            return Respuesta(itemRespuesta);

        }

        private List<IndicadorArchivoBE> removerArchivosRepetidos(List<IndicadorArchivoBE> archivo, List<IndicadorArchivoBE> lista_remover)
        {
            foreach (var item in lista_remover)
            {
                archivo.Remove(item);
            }
            return archivo;
        }

        public List<SustentoIniciativaBE> limpiarFileSustento(List<SustentoIniciativaBE> sustento)
        {

            List<SustentoIniciativaBE> new_lista = new List<SustentoIniciativaBE>();
            string cod_file = "";
            int cod_ini = 0;

            try
            {
                foreach (var item in sustento)
                {
                    if (item.ADJUNTO != null)
                    {
                        new_lista.Add(item);
                    }
                    else
                    {
                        cod_file += item.ID_INICIATIVA_SUSTENTATORIO + ",";
                        cod_ini = item.ID_INICIATIVA;
                    }
                }

                if (!string.IsNullOrEmpty(cod_file))
                {
                    cod_file = cod_file.Substring(0, cod_file.Length - 1);
                    IndicadorLN.EliminarIndicadoresFile(new IniciativaBE { ID_INICIATIVA = cod_ini, ID_INDICADOR_ELIMINAR = cod_file });
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }   
            
            return new_lista;
        }

        public JsonResult MostrarMensajeObservacion(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.MostrarMensajeObservacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public List<AcumuladoBE> detalleAcumulado(List<IndicadorDataBE> listaE)
        {
            List<AcumuladoBE> listaA = new List<AcumuladoBE>();
            try
            {
                List<IndicadorDataBE> lista = new List<IndicadorDataBE>();
                List<IndicadorDataBE> listaPr = new List<IndicadorDataBE>();
                lista = listaE;            
                int anioP = 0;
                string reducido = "";
                foreach (var item in lista)
                {
                    if (item.ID_PARAMETRO == 17)
                        item.VALOR = "0";
                    else if (item.ID_PARAMETRO == 32)
                    {
                        string fecha = item.VALOR;
                        fecha = fecha.Substring(0, 4);
                        item.VALOR = fecha + "-01-01";
                    }
                    else if (item.ID_PARAMETRO == 6)
                    {
                        anioP = Convert.ToInt32(item.VALOR);
                        item.VALOR = Convert.ToString(anioP + 1);
                    }
                    else if (item.ID_PARAMETRO == 11)
                        reducido = item.VALOR;
                }

                listaA.Add(new AcumuladoBE { anio = anioP, reducido = reducido });
                if (lista[0].ID_MEDMIT != 12 && lista[0].ID_MEDMIT != 4 && lista[0].ID_ENFOQUE != 6 && lista[0].ID_ENFOQUE != 9)
                {
                    anioP += 1;
                    while (DateTime.Now.Year > anioP)
                    {
                        listaPr = IndicadorLN.CalculoIndicador(lista);
                        foreach (var item in listaPr)
                        {
                            if (item.ID_PARAMETRO == 6)
                                item.VALOR = Convert.ToString(anioP + 1);
                            else if (item.ID_PARAMETRO == 11)
                                reducido = item.VALOR;
                        }
                        listaA.Add(new AcumuladoBE { anio = anioP, reducido = reducido });
                        anioP += 1;
                    }
                }                
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return listaA;
        }

        public JsonResult MostrarAcumulado(IniciativaBE entidad)
        {
            entidad.ListaIndicadores = (List<IndicadorBE>)Session["lista_indicador_revision"];
            List<IndicadorDataBE> lista = IniciativaLN.MostrarAcumulado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult MostrarAcumuladoRevision(IniciativaBE entidad)
        {
            List<AcumuladoBE> lista = IniciativaLN.MostrarAcumuladoRevision(entidad);
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

        public JsonResult EliminarIniciativa(IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            IniciativaBE ini = IniciativaLN.EliminarIniciativa(entidad);
            itemRespuesta.success = ini.OK;
            if (ini.OK) {
                ini = IniciativaLN.IniciativaMitigacionDatos(entidad);
                IniciativaBE iniciativa = new IniciativaBE();
                UsuarioBE usu = UsuarioLN.UsuarioAdministrador();
                iniciativa.EMAIL_USUARIO = ini.CORREO;
                iniciativa.VALIDAR_RUTA = 1;
                iniciativa.ASUNTO = "Eliminación de Acción de Mitigación - MRVMinem";
                iniciativa.SALUDO = "Estimado Sr(a): " + ini.NOMBRES + "<br/></br/>";
                iniciativa.DESCRIPCION = iniciativa.SALUDO + "La Acción de Mitigación <strong>" + ini.NOMBRE_INICIATIVA + "</strong> con código <strong>" + ini.ID_INICIATIVA + "</strong> ha sido eliminado, para mayor detalle contactarse con el Administrador: " + usu.EMAIL_USUARIO + "<br/><br/>";
                EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());

            }                
            return Respuesta(itemRespuesta);
        }

        public JsonResult ListarInstitucionAcciones(InstitucionBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListarInstitucionAcciones(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public ActionResult ActualizarFile(int IdIniciativa, int IdIndicador, int idnuevo)
        {
            List<IndicadorArchivoBE> MisArchivos = null;
            List<IndicadorArchivoBE> uploadFile = new List<IndicadorArchivoBE>();
            string cargosesion = "0";

            if (Session["MisArchivos"] != null)
            {
                MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];
                cargosesion = "1";

                string sessionId = this.Session.SessionID;
                String strCarpeta = WebConfigurationManager.AppSettings["Detalle"];

                IndicadorArchivoBE encontrado = null;
                if (cargosesion == "1" && MisArchivos.Count > 0) //add
                {
                    //Buscamos si esta en la sesión (si esta cambiando de archivo)
                    //int i = MisArchivos.FindIndex(A => A.ADJUNTO.Contains(IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-"));
                    int i = -1;
                    for (int l = 0; l < MisArchivos.Count; l++)
                        if (MisArchivos[l].buscar == MisArchivos[l].ADJUNTO.Replace(IdIniciativa + "-" + IdIndicador + "-", "").Split('.')[0])
                            if (MisArchivos[l].pagina == IdIndicador)
                                i = l;

                    //encontrado = MisArchivos.Find(A => A.ADJUNTO.Contains(IdIniciativa.ToString() + "-" + IdIndicador.ToString() + "-"));
                    encontrado = MisArchivos[i];

                    if (encontrado != null)
                    {                        
                        var nuevo_name = encontrado.ADJUNTO.Split('-');
                        //System.IO.File.Create(strCarpeta + "\\" + nuevo_name[0] + '-' + idnuevo + '-' + nuevo_name[2] + '-' + nuevo_name[3] + '-' + nuevo_name[4] + '-' + nuevo_name[5] + '-' + nuevo_name[6]);
                        System.IO.File.Move(strCarpeta + "\\" + encontrado.ADJUNTO, strCarpeta + "\\" + nuevo_name[0] + '-' + idnuevo + '-' + nuevo_name[2] + '-' + nuevo_name[3] + '-' + nuevo_name[4] + '-' + nuevo_name[5] + '-' + nuevo_name[6]);
                        //System.IO.File.Delete(strCarpeta + "\\" + encontrado.ADJUNTO);
                        MisArchivos[i].ID_INDICADOR = idnuevo;
                        MisArchivos[i].ADJUNTO = nuevo_name[0] + '-' + idnuevo + '-' + nuevo_name[2] + '-' + nuevo_name[3] + '-' + nuevo_name[4] + '-' + nuevo_name[5] + '-' + nuevo_name[6];
                    }
                }
                Session["MisArchivos"] = MisArchivos;
            }                
            
        return Json(uploadFile);
        }

        public ActionResult OrdenarFile(int IdIniciativa)
        {
            List<IndicadorArchivoBE> MisArchivos = null;

            if (Session["MisArchivos"] != null)
            {
                MisArchivos = (List<IndicadorArchivoBE>)Session["MisArchivos"];

                foreach (IndicadorArchivoBE f in MisArchivos) {
                    int ind = Convert.ToInt16(f.ADJUNTO.Split('-')[1]);
                    f.pagina = ind;
                }
                Session["MisArchivos"] = MisArchivos;
            }

            return Json(true);
        }

        public ActionResult FiltrarOpcion(ParametroBE entidad)
        {
            entidad = ParametroLN.FiltrarParametro(entidad);
            return Json(entidad);
        }

        public void registrarInversion(List<MontoInversionBE> lista) {
            IniciativaLN.RegistrarInversion(lista);
        }

        public ActionResult ListarMontos(IniciativaBE entidad)
        {
            List<MontoInversionBE> lista = IniciativaLN.ListarMontos(entidad);
            return Json(lista);
        }
        public JsonResult ListarAcciones(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListarAcciones(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult DescripcionTipoAuditoria(IniciativaBE entidad)
        {
            string descripcion = "";
            if (entidad.TIPO_AUDITORIA == "1")
                descripcion = WebConfigurationManager.AppSettings.Get("Tipo1");
            else if (entidad.TIPO_AUDITORIA == "2")
                descripcion = WebConfigurationManager.AppSettings.Get("Tipo2");
            else if (entidad.TIPO_AUDITORIA == "3")
                descripcion = WebConfigurationManager.AppSettings.Get("Tipo3");

            var jsonResult = Json(descripcion, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

    }    
}