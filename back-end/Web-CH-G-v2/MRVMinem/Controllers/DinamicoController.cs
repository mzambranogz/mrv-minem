
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;
using MRVMinem.Tags;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Controllers
{
    [Autenticado]
    public class DinamicoController : BaseController
    {
        // GET: Dinamico
        public ActionResult MantenimientoFactores()
        {
            MvFactor Modelo = new MvFactor();
            FactorBE entidad = new FactorBE() { ID_FACTOR = 0 };

            Modelo.ListaFactores = FactorLN.ListaFactor(entidad);
            Modelo.ListaControl = TipoControlLN.listarTipoControl();
            Modelo.ListaParametro = ParametroLN.ListarParametroControl();
            return View(Modelo);
        }

        public JsonResult GetFactorParametro(FactorBE entidad)
        {
            List<FactorBE> lista = FactorLN.ListaFactor(entidad);
            if(lista  != null)
            {
                foreach(var item in lista)
                {
                    item.ListaFactorParametro = FactorLN.ListaFactorParametro(item);
                }
            }

            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        public JsonResult RegistraParametrosFactor(FactorBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();

            entidad = FactorLN.RegistraFactor(entidad);

            itemRespuesta.success = entidad.OK;
            itemRespuesta.extra = entidad.message;
            return Respuesta(itemRespuesta);
        }
    }
}