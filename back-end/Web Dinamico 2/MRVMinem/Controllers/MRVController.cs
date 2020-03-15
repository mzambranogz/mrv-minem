using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Tags;
using MRVMinem.Helper;
using System.Web.Configuration;

namespace MRVMinem.Controllers
{
    public class MRVController : Controller
    {
        // GET: MRV
        public ActionResult MINEM(string id, string ini)
        {
            var arr = id.Split('-');
            var cod = Convert.ToInt32(arr[2]);
            var etapa = Convert.ToInt32(arr[3]);
            var estado = Convert.ToInt32(arr[4]);
            var usuario = Convert.ToInt32(arr[5]);
            var opcion = Convert.ToInt32(arr[6]);

            int validar = DireccionamientoLN.ValidarRuta(new DireccionamientoBE { ID_INICIATIVA = cod, ID_ETAPA = etapa, ID_ESTADO = estado });

            if (validar == 1)
            {

                SessionHelper.AddUserToSession(usuario.ToString());
                Session["usuario"] = usuario.ToString();
                Session["socket"] = WebConfigurationManager.AppSettings.Get("Socket");
                List<RolOpcionesBE> lista = RolOpcionesLN.ListarOpciones(usuario);
                limpiarSetearSesion(lista);
                Random rnd = new Random();
                int r1 = rnd.Next(100, 999);

                if ((etapa == 1 && estado == 1) || (etapa == 1 && estado == 5))
                {
                    return RedirectToAction("RevisarIniciativa", "Gestion", new { id = r1, ini = cod });
                }else if (etapa == 1 && estado == 2)
                {
                    return RedirectToAction("CorregirIniciativa", "Gestion", new { id = r1, ini = cod });
                }
                else if (etapa == 2 && estado == 3)
                {
                    if (opcion == 1)
                    {
                        return RedirectToAction("DetalleIndicador", "Gestion", new { id = cod, ini = r1 });
                    }
                    else if (opcion == 2)
                    {
                        return RedirectToAction("DetalleIndicadorMasivo", "Detalle", new { id = cod, ini = r1 });
                    }
                    
                }
                else if ((etapa == 3 && estado == 1) || (etapa == 3 && estado == 5) || (etapa == 4 && estado == 2))
                {
                    return RedirectToAction("RevisarDetalleIndicador", "Gestion", new { id = cod, ini = r1 });
                }
                else if (etapa == 3 && estado == 2)
                {
                    if (opcion == 1)
                    {
                        return RedirectToAction("CorregirDetalleIndicador", "Gestion", new { id = cod, ini = r1 });
                    }
                    else if (opcion == 2)
                    {
                        return RedirectToAction("CorregirDetalleIndicadorMasivo", "Detalle", new { id = cod, ini = r1 });
                    }                        
                }
                else if ((etapa == 4 && estado == 3) || (etapa == 5 && estado == 2) || (etapa == 8 && estado == 2))
                {
                    return RedirectToAction("RevisarAdminDetalleIndicador", "Gestion", new { id = cod, ini = r1 });
                }
            }
            else
            {
                return RedirectToAction("Default","Error");
            }

            return View();
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
                    Session["nombreRol"] = "Administrado";
                    Session["colorRol"] = "02";
                }
                else if (item.ID_ROL == 2)
                {
                    Session["nombreRol"] = "Especialista";
                    Session["colorRol"] = "03";
                }
                else if (item.ID_ROL == 3)
                {
                    Session["nombreRol"] = "Administrador MINEM";
                    Session["colorRol"] = "06";
                }
                else if (item.ID_ROL == 4)
                {
                    Session["nombreRol"] = "Evaluador MINAM";
                    Session["colorRol"] = "04";
                }
                else if (item.ID_ROL == 5)
                {
                    Session["nombreRol"] = "Verificador Externo";
                    Session["colorRol"] = "05";
                }
                Session["institucion"] = item.INSTITUCION;
                Session["direccion"] = item.DIRECCION;
                Session["sector"] = item.SECTOR;
                Session["primer_inicio"] = item.PRIMER_INICIO;
            }
        }

    }
}