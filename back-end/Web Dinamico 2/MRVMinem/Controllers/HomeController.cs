using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Helper;
using MRVMinem.Models;
using MRVMinem.Response;
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
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index()
        {
            Session["contacto"] = WebConfigurationManager.AppSettings["Contacto"];
            ListaObjeto modelo = new ListaObjeto();
            modelo.listaMedidaMitigacion = modelo.listaMedidaMitigacion = MedidaMitigacionLN.ListarMedidaMitigacion(new MedidaMitigacionBE());
            return View(modelo);
        }

        //CAPTCHA V 3.0
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

                    return new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "Home",
                        action = "login"
                    }));
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

        //add
        public async Task<JsonResult> ValidarCaptcha(MvReCAPTCHASettings model)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            UsuarioBE entidad = new UsuarioBE() { USUARIO = model.USUARIO, PASSWORD_USUARIO = model.PASSWORD_USUARIO };
            try
            {
                //GoogleResponse _GoogleRecaptcha = await GoogleReCAPTCHAService.VerifyRecaptcha(entidad.Token);
                var isCaptchaValid = await IsCaptchaValid(model.TOKEN);

                if (isCaptchaValid)
                {
                    entidad = UsuarioLN.ObtenerPassword(entidad);
                    if (entidad.OK)
                    {
                        SessionHelper.AddUserToSession(entidad.ID_USUARIO.ToString());
                        Session["usuario"] = entidad.ID_USUARIO.ToString();
                        Session["socket"] = WebConfigurationManager.AppSettings.Get("Socket");
                        List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(entidad.ID_USUARIO);
                        limpiarSetearSesion(lista);

                        itemRespuesta.success = true;
                    }
                    else
                    {
                        itemRespuesta.extra = entidad.extra;
                        itemRespuesta.success = false;
                    }
                }
                else
                {
                    itemRespuesta.extra = "El Captcha no es válido";
                    itemRespuesta.success = false;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                itemRespuesta.extra = "Usuario y/o Password incorrecto";
                itemRespuesta.success = false;
            }

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
                else if (item.ID_ROL == 7)
                {
                    Session["nombreRol"] = item.ROL;
                    Session["colorRol"] = "01";
                }
                Session["id_sector"] = item.ID_SECTOR_INST; //add
                Session["institucion"] = item.INSTITUCION;
                Session["direccion"] = item.DIRECCION;
                Session["sector"] = item.SECTOR;
                Session["primer_inicio"] = item.PRIMER_INICIO;
            }
        }
        /// <summary>
        /// FIN RECAPTCHA V 3.0
        /// </summary>
        /// <returns></returns>



        public ActionResult registro()
        {
            ViewBag.estilo = "^[a-zA-Z0-9.!#$%&amp;’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$";
            //ViewBag.caracter = "@#.";

            MvReCAPTCHASettings modelo = new MvReCAPTCHASettings()
            {
                ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"],
                ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"],
                OK = true
            };

            return View(modelo);
        }

        public async Task<JsonResult> VerificarCaptcha(MvReCAPTCHASettings model)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            var isCaptchaValid = await IsCaptchaValid(model.TOKEN);
            itemRespuesta.success = isCaptchaValid;
            if (!itemRespuesta.success)
                itemRespuesta.message = "El Captcha no es válido";

            return Respuesta(itemRespuesta);
        }

        public ActionResult recuperar()
        {
            MvReCAPTCHASettings modelo = new MvReCAPTCHASettings()
            {
                ReCAPTCHA_Secret_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Secret_Key"],
                ReCAPTCHA_Site_Key = WebConfigurationManager.AppSettings["ReCAPTCHA_Site_Key"],
                OK = true
            };

            return View(modelo);
        }
    }
}