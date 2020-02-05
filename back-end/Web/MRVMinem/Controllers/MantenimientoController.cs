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
            List<InstitucionBE> lista = InstitucionLN.ListaInstitucionPaginado(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }
    }
}