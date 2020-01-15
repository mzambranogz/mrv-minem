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
    public class PortalController : BaseController
    {
        // GET: Portal
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AccionMitigacion()
        {
            return View();
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

        public JsonResult ListaIniciativasPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaPublico(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
    }
}