using entidad.minem.gob.pe;
using logica.minem.gob.pe;
using MRVMinem.Core;
using MRVMinem.Models;
using MRVMinem.Repositorio;
using MRVMinem.Tags;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using utilitario.minem.gob.pe;

namespace MRVMinem.Controllers
{
    [Autenticado]
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

        public JsonResult ProcesarExcel(HttpPostedFileBase fledeclaracion, IndicadorBE entidad)
        {
            List<IndicadorBE> listaIndicadores = new List<IndicadorBE>();
            ResponseEntity itemRespuesta = new ResponseEntity();
            List<string> excelData = new List<string>();
            int pagina = 0;
            if (fledeclaracion != null)
            {
                //load the uploaded file into the memorystream
                byte[] archivo = new byte[fledeclaracion.ContentLength];
                fledeclaracion.InputStream.Read(archivo, 0, fledeclaracion.ContentLength - 1);
                using (MemoryStream stream = new MemoryStream(archivo))
                using (ExcelPackage excelPackage = new ExcelPackage(stream))
                {
                    //loop all worksheets
                    foreach (ExcelWorksheet worksheet in excelPackage.Workbook.Worksheets)
                    {
                        pagina++;
                        //loop all rows
                        if (pagina < 2)
                        {
                            for (int i = worksheet.Dimension.Start.Row; i <= worksheet.Dimension.End.Row; i++)
                            {
                                IndicadorBE item = new IndicadorBE();
                                if (i > 1)
                                {
                                    //loop all columns in a row
                                    if (worksheet.Cells[i, 1].Value != null && worksheet.Cells[i, 2].Value != null && worksheet.Cells[i, 3].Value != null && worksheet.Cells[i, 4].Value != null && worksheet.Cells[i, 5].Value != null && worksheet.Cells[i, 6].Value != null && worksheet.Cells[i, 7].Value != null && worksheet.Cells[i, 8].Value != null)
                                    {
                                        for (int j = worksheet.Dimension.Start.Column; j <= worksheet.Dimension.End.Column; j++)
                                        {
                                            //add the cell data to the List
                                            if (worksheet.Cells[i, j].Value != null)
                                            {
                                                excelData.Add(worksheet.Cells[i, j].Value.ToString());
                                                switch (j)
                                                {
                                                    case 1:
                                                        item.ANNOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ANNO_BASE = item.ANNOB;
                                                        break;
                                                    case 2:
                                                        item.INICIO_OPERACIONES = DateTime.FromOADate(long.Parse(worksheet.Cells[i, j].Value.ToString()));
                                                        break;
                                                    case 3:
                                                        item.ID_TIPO_VEHICULOB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ID_TIPO_VEHICULO_BASE = item.ID_TIPO_VEHICULOB;
                                                        break;
                                                    case 4:
                                                        break;
                                                    case 5:
                                                        item.ID_TIPO_COMBUSTIBLEB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.ID_TIPO_COMBUSTIBLE_BASE = item.ID_TIPO_COMBUSTIBLEB;
                                                        break;
                                                    case 6:
                                                        break;
                                                    case 7:
                                                        item.KRVB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.KRV_BASE = item.KRVB;
                                                        break;
                                                    case 8:
                                                        item.CANTIDADB = int.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.CANT_BASE = item.CANTIDADB;
                                                        break;
                                                    case 9:
                                                        item.FACTOR_RENDIMIENTO = double.Parse(worksheet.Cells[i, j].Value.ToString());
                                                        item.F_RENDIMIENTO = item.FACTOR_RENDIMIENTO;
                                                        break;
                                                }
                                            }
                                        }
                                        item.ID_TIPO_FUENTEI = entidad.ID_TIPO_FUENTEI;
                                        IndicadorBE Calculado = IndicadorLN.CalcularIndicador(item)[0];
                                        item.TOTAL_GEI_INIMIT = Calculado.TOTAL_GEI_INIMIT;
                                        item.TOTAL_GEI_REDUCIDO = Calculado.TOTAL_GEI_REDUCIDO;
                                        item.TOTAL_GEI_BASE = Calculado.TOTAL_GEI_BASE;
                                        item.F_RENDIMIENTO = Calculado.FACTOR_RENDIMIENTO;
                                        listaIndicadores.Add(item);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            var jsonResult = Json(listaIndicadores, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;

            //return Respuesta(itemRespuesta);
        }

        public JsonResult RegistrarDetalleIndicador(HttpPostedFileBase[] fledoc, HttpPostedFileBase[] fledocumentos, IniciativaBE entidad)
        {
            ResponseEntity itemRespuesta = new ResponseEntity();
            entidad.ID_USUARIO = Convert.ToInt32(Session["usuario"]);
            try
            {
                if (fledoc != null)
                {
                    foreach (var f in fledoc)
                    {
                        if (f != null)
                        {
                            string archivoOriginal = f.FileName;
                            string nomArchivoSave = "";
                            nomArchivoSave = Guid.NewGuid() + Path.GetExtension(f.FileName).ToString();
                            var carpeta = WebConfigurationManager.AppSettings.Get("Sustentatorio");
                            var ruta = Path.Combine(carpeta, nomArchivoSave);
                            f.SaveAs(ruta);


                            if (entidad.ListaIndicadores != null)
                            {
                                foreach (IndicadorBE item in entidad.ListaIndicadores)
                                {
                                    if (item.ADJUNTO_BASE != null)
                                    {
                                        if (item.ADJUNTO_BASE.Contains(archivoOriginal))
                                        {
                                            item.ADJUNTO = nomArchivoSave;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                if (fledocumentos != null)
                {
                    foreach (var f in fledocumentos)
                    {
                        if (f != null)
                        {
                            string archivoOriginal = f.FileName;
                            string nomArchivoSave = "";

                            if (entidad.extra.Contains(archivoOriginal))
                            {
                                nomArchivoSave = Guid.NewGuid() + Path.GetExtension(f.FileName).ToString();
                                var carpeta = WebConfigurationManager.AppSettings.Get("Sustentatorio");
                                var ruta = Path.Combine(carpeta, nomArchivoSave);
                                f.SaveAs(ruta);


                                if (entidad.ListaSustentos != null)
                                {
                                    foreach (SustentoIniciativaBE item in entidad.ListaSustentos)
                                    {
                                        if (item.ADJUNTO_BASE != null)
                                        {
                                            if (item.ADJUNTO_BASE.Contains(archivoOriginal))
                                            {
                                                item.ADJUNTO = nomArchivoSave;
                                                break;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                IndicadorBE indicador = null;
                if (entidad.ListaIndicadores != null)
                {
                    indicador = IndicadorLN.RegistraTodosIndicadores(entidad.ListaIndicadores);
                    if (!indicador.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro de indicadores.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                IniciativaBE iniciativaM = null;
                if (!string.IsNullOrEmpty(entidad.ID_INDICADOR_DELETE))
                    iniciativaM = IndicadorLN.EliminarIndicadores(entidad);

                SustentoIniciativaBE sustento = null;
                if (entidad.ListaSustentos != null)
                {
                    sustento = IndicadorLN.RegistraTodosSustentoIniciativa(entidad.ListaSustentos);
                    if (!sustento.OK)
                    {
                        itemRespuesta.success = false;
                        itemRespuesta.message = "Ocurrio un problema durante el registro del sustento.";
                        itemRespuesta.extra = indicador.extra;
                        return Respuesta(itemRespuesta);
                    }
                }

                if (entidad.ID_ESTADO == 1) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarEnvioDetalle(entidad);
                }
                else if (entidad.ID_ESTADO == 5) //add 30-01-20
                {
                    entidad = IndicadorLN.CorregirDetalleIndicador2(entidad);
                }
                else if (entidad.ID_ESTADO == 0 || entidad.ID_ESTADO == 6) //add 30-01-20
                {
                    entidad = IndicadorLN.RegistrarAvanceDetalleIndicador(entidad);
                }


                if (entidad.ID_ESTADO == 1)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Registro Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha registrado el/los detalle(s) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 2);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                else if (entidad.ID_ESTADO == 5)
                {
                    var usuario = UsuarioLN.obtenerUsuarioId(entidad.ID_USUARIO);
                    IniciativaBE iniciativa = new IniciativaBE();
                    iniciativa.EMAIL_USUARIO = Convert.ToString(Session["correo_destino"]);
                    iniciativa.ASUNTO = "Observación subsanada de Detalle Indicador - Entidad " + usuario.INSTITUCION;
                    iniciativa.DESCRIPCION = "El usuario de la entidad " + usuario.INSTITUCION + " ha subsanado la(s) observación(es) de el/los detalle(s) de indicador(es) de la Iniciativa (" + entidad.NOMBRE_INICIATIVA + "), en espera de su revisión.<br/><br/>";
                    EnvioCorreo hilo_correo = new EnvioCorreo(iniciativa, 1);
                    Task tarea = Task.Factory.StartNew(() => hilo_correo.menajeIniciativa());
                }
                Session["correo_destino"] = "";
                itemRespuesta.success = entidad.OK;
                itemRespuesta.extra = entidad.ID_ESTADO.ToString();
            }
            catch (Exception ex)
            {
                itemRespuesta.success = false;
                itemRespuesta.message = "Ocurrio un problema durante el registro.";
                itemRespuesta.extra = ex.Message;
                Log.Error(ex);
            }

            return Respuesta(itemRespuesta);
        }


        public JsonResult CalcularIndicador(IndicadorBE entidad)
        {
            List<IndicadorBE> lista = IndicadorLN.CalcularIndicador(entidad);
            var jsonResult = Json(lista, JsonRequestBehavior.AllowGet);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }



    }
}