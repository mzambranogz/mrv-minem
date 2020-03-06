using MRVMinem.Helper;
using System.Web.Mvc;
using System.Web.Routing;
using System;
using utilitario.minem.gob.pe;

namespace MRVMinem.Tags
{
    public class AutenticadoAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {     
            try
            {
                base.OnActionExecuting(filterContext);
                if (!SessionHelper.ExistUserInSession())
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "Home",
                        action = "Login"
                    }));
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }
            
        }
    }

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