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

        public ActionResult IniciativaMitigacion(int id)
        {
            MvSesion modelo = new MvSesion();
            modelo.identificador = id;
            return View(modelo);
        }

        public JsonResult ListaIniciativasEspecialista(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaGeneral(entidad);
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

        /*Session["VARIABLE"] = entidad;

            entidad = (UsuarioBE)Session["VARIABLE"];*/


    }
}