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
    public class DetalleController : BaseController
    {
        // GET: Detalle
        public ActionResult DetalleIndicadorMasivo(int id, int ini)
        {
            ListaObjeto modelo = new ListaObjeto();
            IniciativaBE inic = new IniciativaBE();
            inic.ID_INICIATIVA = id;
            modelo.iniciativa_mit = inic;
            modelo.iniciativa_mit = IniciativaLN.IniciativaMitigacionDatos(modelo.iniciativa_mit);
            modelo.listaIndicador = IndicadorLN.ListarDetalleIndicadorDatos(modelo.iniciativa_mit);
            modelo.medida = MedidaMitigacionLN.getMedidaMitigacion(modelo.iniciativa_mit.ID_MEDMIT);
            modelo.listaUbicacion = IniciativaLN.ListarUbicacionIniciativa(modelo.iniciativa_mit);
            modelo.listaEnergetico = IniciativaLN.ListarEnergeticoIniciativa(modelo.iniciativa_mit);
            modelo.listaGei = IniciativaLN.ListarGeiIniciativa(modelo.iniciativa_mit);
            modelo.usuario = UsuarioLN.EspecialistaMedida(modelo.iniciativa_mit.ID_MEDMIT);
            Session["correo_destino"] = modelo.usuario.EMAIL_USUARIO;
            return View(modelo);
        }



    }
}