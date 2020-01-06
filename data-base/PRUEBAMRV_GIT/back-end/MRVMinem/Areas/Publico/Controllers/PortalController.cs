using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MRVMinem.Core;

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

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult AccionMitigacion()
        {
            return View();
        }

        public ActionResult Nama()
        {
            return View();
        }

        public ActionResult Ubicacion()
        {
            return View();
        }

        public ActionResult SectorInstitucion()
        {
            return View();
        }

        public ActionResult Rol()
        {
            return View();
        }

        public ActionResult MedidaMitigacion()
        {
            return View();
        }

        public JsonResult ListaIniciativas(IniciativaBE entidad)
        {
            List<IniciativaBE> lista = IniciativaLN.ListaIniciativa(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListarNama(NamaBE entidad)
        {
            List<NamaBE> lista = NamaLN.ListarNama(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObtenerNama(NamaBE entidad)
        {
            List<NamaBE> lista = NamaLN.ObtenerNama(entidad);
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

        public JsonResult ObtenerUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> lista = UbicacionLN.ObtenerUbicacion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }



        public JsonResult ListarSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListarSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObtenerSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ObtenerSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }



        public JsonResult EditarSectorInstitucion(SectorInstitucionBE entidad)   /*heyyy*/
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = SectorInstitucionLN.editarSectorInstitucion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult EliminarSectorInstitucion(SectorInstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = SectorInstitucionLN.eliminarSectorInstitucion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }





        public JsonResult ListarRol(RolBE entidad)
        {
            List<RolBE> lista = RolLN.ListarRol(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ObtenerRol(RolBE entidad)
        {
            List<RolBE> lista = RolLN.ObtenerRol(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }



        public JsonResult EditarRol(RolBE entidad)   /*heyyy*/
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = RolLN.editarRol(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult EliminarRol(RolBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = RolLN.eliminarRol(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }



        public JsonResult ListarMedidaMitigacion (MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacion(entidad);
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


        public JsonResult EditarMedidaMitigacion(MedidaMitigacionBE entidad)   /*heyyy*/
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = MedidaMitigacionLN.editarMedidaMitigacion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult EliminarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = MedidaMitigacionLN.eliminarMedidaMitigacion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }






        [HttpPost]
        public JsonResult RegistrarUsuario(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();  /*revisaa*/

            //entidad.ID_INSTITUCION = InstitucionLN.registrarInstitucion(new InstitucionBE(entidad.ID_INSTITUCION, entidad.RUC, entidad.INSTITUCION, entidad.DIRECCION));
            entidad = UsuarioLN.RegistraUsuario(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }

        public JsonResult EditarNama(NamaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

         
          entidad = NamaLN.editarNama(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult EliminarNama(NamaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = NamaLN.eliminarNama(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }




        public JsonResult EditarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = UbicacionLN.editarUbicacion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }


        public JsonResult EliminarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();


            entidad = UbicacionLN.eliminarUbicacion(entidad);

            if (!entidad.OK)
            {
                itemRespuesta.success = false;
                itemRespuesta.extra = entidad.extra;
            }
            else
            {
                itemRespuesta.success = true;
            }
            return Respuesta(itemRespuesta);
        }




        //LISTA TODAS LOS SECTORES INSTITUCIONALES HACIA EL SELECT SECTOR DEL FORM REGISTRO USUARIO


       /* public JsonResult ListaSectorInstitucion(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListaSectorInstitucion(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }*/

        public JsonResult IniciarSesion(UsuarioBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UsuarioLN.ObtenerPassword(entidad);
            itemRespuesta.success = entidad.OK;
            return Respuesta(itemRespuesta);
        }

    }
}