using MRVMinem.Helper;
using System.Web.Mvc;
using System.Web.Routing;
using System;
using utilitario.minem.gob.pe;

namespace MRVMinem.Tags
{
    public class AutenticadoAttribute : ActionFilterAttribute
    {
        // Si no estamos logeado, regresamos al login
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {     
            try
            {
                base.OnActionExecuting(filterContext);
                if (!SessionHelper.ExistUserInSession())
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "Error",
                        action = "SinSesion"
                    }));
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
            
        }
    }

    // Si estamos logeado ya no podemos acceder a la página de Login
    public class NoLoginAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                base.OnActionExecuting(filterContext);

                if (SessionHelper.ExistUserInSession())
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "Gestion",
                        action = "AccionMitigacion"
                    }));
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }            
        }
    }

}