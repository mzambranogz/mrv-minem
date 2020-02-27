using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Core
{
    public class BaseController : Controller
    {
        #region Respuesta
        protected JsonResult Respuesta(JsonResult json)
        {
            json.ContentType = "text/plain";
            json.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            json.MaxJsonLength = int.MaxValue;
            json.ContentEncoding = Encoding.UTF8;
            return json;
        }

        protected JsonResult ResponseImage(List<string> items, bool success = true, string extra = "")
        {
            JsonResult respuesta = Json(new
            {
                success = success,
                message = items,
                extra = extra
            });
            respuesta.ContentType = "text/plain";
            return respuesta;
        }

        protected JsonResult Respuesta(ResponseEntity item)
        {
            JsonResult json = base.Json(item);
            return this.Respuesta(json);
        }

        protected JsonResult Respuesta(string mensaje, bool success, string extra)
        {
            ResponseEntity respuestaJson = new ResponseEntity();
            respuestaJson.message = mensaje;
            respuestaJson.success = success;
            respuestaJson.extra = extra;
            return this.Respuesta(respuestaJson);
        }
        protected JsonResult Respuesta(Exception ex)
        {
            return this.Respuesta(ex.Message, false, string.Empty);
        }

        protected JsonResult Respuesta(List<string> items, bool success, string extra)
        {
            string mensaje = string.Empty;
            foreach (string item in items)
            {
                mensaje = (mensaje + (item + "<br />"));
            }
            return this.Respuesta(mensaje, success, extra);
        }
        #endregion
    }
}