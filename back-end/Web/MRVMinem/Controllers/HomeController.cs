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
            return View();
        }

        public ActionResult recuperar()
        {
            return View();
        }
    }
}