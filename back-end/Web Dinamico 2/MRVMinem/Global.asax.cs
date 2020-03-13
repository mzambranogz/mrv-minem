using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MRVMinem
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();

            Response.Clear();

            HttpException httpException = exception as HttpException;

            int errorCode = 500;

            if (httpException != null) errorCode = httpException.GetHttpCode();

            Server.ClearError();

            Response.Redirect("~/Error");
        }
    }
}
