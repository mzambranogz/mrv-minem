using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Controllers
{
    public class MantenimientoController : BaseController
    {
        // GET: Mantenimiento
        public JsonResult ListarMedidaMitigacion(MedidaMitigacionBE entidad)
        {
            List<MedidaMitigacionBE> lista = MedidaMitigacionLN.ListarMedidaMitigacionAsociado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public ActionResult Instituciones(InstitucionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new InstitucionBE() { cantidad_registros = 10, order_by = "NOMBRE_INSTITUCION", order_orden = "ASC", pagina = 1 };
            }
            MvInstitucion modelo = new MvInstitucion();
            modelo.ListaInstitucion = InstitucionLN.ListaInstitucionPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarInstitucion(InstitucionBE entidad)
        {
            InstitucionBE lista = InstitucionLN.GetInstitucionPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaInstitucion(InstitucionBE entidad)
        {
            List<InstitucionBE> lista = InstitucionLN.ListaInstitucionPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarInstitucion(InstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad.INSNOMBRE = entidad.NOMBRE_INSTITUCION;
                entidad.INSDIRECCION = entidad.DIRECCION_INSTITUCION;
                entidad.INSTIPO = entidad.ID_SECTOR_INSTITUCION;
                entidad.INSRUC = entidad.RUC_INSTITUCION;
                entidad = InstitucionLN.registrarInstitucion(entidad);
            }
            else
            {
                entidad = InstitucionLN.ActualizarInstitucion(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarInstitucion(InstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = InstitucionLN.EliminarInstitucion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }


        public ActionResult Ubicaciones(UbicacionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new UbicacionBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1 };
            }
            MvUbicacion modelo = new MvUbicacion();
            modelo.ListaUbicacion = UbicacionLN.ListarUbicacionPaginado(entidad);
            return View(modelo);
        }

        public JsonResult BuscarUbicacion(UbicacionBE entidad)
        {
            UbicacionBE lista = UbicacionLN.GetUbicacionPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaUbicacion(UbicacionBE entidad)
        {
            List<UbicacionBE> lista = UbicacionLN.ListarUbicacionPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLG_ESTADO == "1")
            {
                entidad = UbicacionLN.RegistrarUbicacion(entidad);
            }
            else
            {
                entidad = UbicacionLN.ActualizarUbicacion(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarUbicacion(UbicacionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = UbicacionLN.EliminarUbicacion(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        ///

        public ActionResult Sectores(SectorInstitucionBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new SectorInstitucionBE() { cantidad_registros = 10, order_by = "DESCRIPCION", order_orden = "ASC", pagina = 1 };
            }
            MvSector modelo = new MvSector();
            modelo.ListaSectores = SectorInstitucionLN.ListarSectorPaginado(entidad);
            return View(modelo);
        }

        public JsonResult Buscarsector(SectorInstitucionBE entidad)
        {
            SectorInstitucionBE lista = SectorInstitucionLN.GetSectorPorId(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult ListaSectores(SectorInstitucionBE entidad)
        {
            List<SectorInstitucionBE> lista = SectorInstitucionLN.ListarSectorPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistrarSector(SectorInstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            if (entidad.FLAG_ESTADO == "1")
            {
                entidad = SectorInstitucionLN.RegistrarSector(entidad);
            }
            else
            {
                entidad = SectorInstitucionLN.ActualizarSector(entidad);
            }
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        public JsonResult EliminarSector(SectorInstitucionBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = SectorInstitucionLN.EliminarSector(entidad);
            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.extra;
            return Respuesta(itemRespuesta);
        }

        //////

        public ActionResult Escenarios(EscenarioBE entidad)
        {
            if (entidad.pagina == 0)
            {
                entidad = new EscenarioBE() { cantidad_registros = 10, order_by = "NOMBRE_MEDMIT", order_orden = "ASC", pagina = 1 };
            }
            MvEscenario modelo = new MvEscenario();
            modelo.ListaEscenarios = EscenarioLN.ListaEscenariosPaginado(entidad);
            return View(modelo);
        }

        public JsonResult ListaEscenarios(EscenarioBE entidad)
        {
            List<EscenarioBE> lista = EscenarioLN.ListaEscenariosPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

    }
}