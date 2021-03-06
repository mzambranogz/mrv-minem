﻿using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Helper;
using MRVMinem.Models;
using MRVMinem.Repositorio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using utilitario.minem.gob.pe;

namespace MRVMinem.Controllers
{

    public class HomeController : Controller
    {

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult login()
        {
            MvReCAPTCHASettings modelo = new MvReCAPTCHASettings()
            {
                ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"],
                ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"],
                OK = true
            };

            return View(modelo);
        }

        [HttpPost]
        public async Task<ActionResult> login(MvReCAPTCHASettings model)
        {
            UsuarioBE entidad = new UsuarioBE() { USUARIO = model.USUARIO, PASSWORD_USUARIO = model.PASSWORD_USUARIO };
            try
            {

                //GoogleResponse _GoogleRecaptcha = await GoogleReCAPTCHAService.VerifyRecaptcha(entidad.Token);
                var isCaptchaValid = await IsCaptchaValid(model.TOKEN);

                if (isCaptchaValid)
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
                    if (entidad.OK)
                    {
                        SessionHelper.AddUserToSession(entidad.ID_USUARIO.ToString());
                        Session["usuario"] = entidad.ID_USUARIO.ToString();
                        Session["socket"] = WebConfigurationManager.AppSettings.Get("Socket");
                        List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(entidad.ID_USUARIO);
                        limpiarSetearSesion(lista);

                        return new RedirectToRouteResult(new RouteValueDictionary(new
                        {
                            controller = "Gestion",
                            action = "AccionMitigacion"
                        }));

                        //return RedirectToAction("Gestion/AccionMitigacion");
                    }
                    else
                    {
                        model.OK = false;
                        model.extra = entidad.extra;
                    }
                }
                else
                {
                    model.OK = false;
                    model.extra = "El Captcha no es válido";
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);

            }

            return View(model);
        }

        private async Task<bool> IsCaptchaValid(string response)
        {
            try
            {
                var secret = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"];
                using (var client = new HttpClient())
                {
                    var values = new Dictionary<string, string>
                    {
                        {"secret", secret},
                        {"response", response},
                        {"remoteip", Request.UserHostAddress}
                    };

                    var content = new FormUrlEncodedContent(values);
                    var verify = await client.PostAsync("https://www.google.com/recaptcha/api/siteverify", content);
                    var captchaResponseJson = await verify.Content.ReadAsStringAsync();
                    var captchaResult = JsonConvert.DeserializeObject<GoogleResponse>(captchaResponseJson);
                    return captchaResult.success
                           && captchaResult.action == "Gestion/AccionMitigacion"
                           && captchaResult.score > 0.5;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                return false;
            }
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

        public ActionResult registro()
        {
            ViewBag.estilo = "^[a-zA-Z0-9.!#$%&amp;’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$";
            ViewBag.caracter = "!@#$&*";
            return View();
        }

        public ActionResult recuperar()
        {
            return View();
        }
    }
}