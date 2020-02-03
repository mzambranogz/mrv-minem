using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult login()
        {
            return View();
        }

        public ActionResult registro()
        {
            ViewBag.estilo = "^[a-zA-Z0-9.!#$%&amp;’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$";
            return View();
        }

        public ActionResult recuperar()
        {
            return View();
        }
    }
}