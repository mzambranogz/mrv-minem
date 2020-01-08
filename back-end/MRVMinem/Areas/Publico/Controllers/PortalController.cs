using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MRVMinem.Core;
using MRVMinem.Areas.Administrado.Repositorio;

namespace MRVMinem.Areas.Publico.Controllers
{
    public class PortalController : BaseController
    {
        // GET: Publico/Portal
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Usuario()
        {
            return View();
        }

        public ActionResult Recuperar()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult AccionMitigacion()
        {
            return View();
        }

        public JsonResult ListaIniciativasPublico(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativaPublico(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult VerificarEmail(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.VerificarEmail(entidad);
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

            entidad.ID_INSTITUCION = InstitucionLN.registrarInstitucion(new InstitucionBE(entidad.ID_SECTOR_INST, entidad.RUC, entidad.INSTITUCION, entidad.DIRECCION));
            entidad = UsuarioLN.RegistraUsuario(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                new EnvioCorreo().CreacionUsuario(entidad);

                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }

        //LISTA TODAS LOS SECTORES INSTITUCIONALES HACIA EL SELECT SECTOR DEL FORM REGISTRO USUARIO
        public JsonResult ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult IniciarSesion(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.ObtenerPassword(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.ID_USUARIO.ToString();
            return Respuesta(itemRespuesta);
        }

    }
}