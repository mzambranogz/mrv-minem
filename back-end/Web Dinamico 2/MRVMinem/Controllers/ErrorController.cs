using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Index()
        {
            string error = "";
            string ex = "";
            //Request.ContentEncoding = System.Text.Encoding.UTF8;
            //if (Request.Cookies.Get("error") != null) error = Request.Cookies.Get("error").Value;
            //if (Request.Cookies.Get("ex") != null) ex = Request.Cookies.Get("ex").Value;
            string viewError = "Default";
            if (error != null) viewError += error;
            //TempData["ex"] = ex;
            return View(viewError);
        }

        public ActionResult TestError(int valor)
        {
            return View();
        }
    }
}