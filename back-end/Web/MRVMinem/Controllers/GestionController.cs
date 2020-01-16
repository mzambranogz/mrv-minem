using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;

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

        /*Session["VARIABLE"] = entidad;

            entidad = (UsuarioBE)Session["VARIABLE"];*/


    }
}