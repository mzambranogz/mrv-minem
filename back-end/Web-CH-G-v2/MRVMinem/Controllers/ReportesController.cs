using MRVMinem.Core;
using MRVMinem.Tags;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MRVMinem.Controllers
{
    [Autenticado]
    public class ReportesController : BaseController
    {
        // GET: Reportes
        public ActionResult Reportes()
        {
            return View();
        }
    }
}