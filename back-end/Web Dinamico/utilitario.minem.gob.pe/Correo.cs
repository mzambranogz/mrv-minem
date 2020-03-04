using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace utilitario.minem.gob.pe
{
    public static class Correo
    {

        public static bool EnviarEmail(string proceso, string asDe, List<string> asPara, string asAsunto, string asCuerpo, bool asesHtml, List<string> asCC = null, List<string> asCO = null, List<Attachment> listaAdjunto = null)
        {
            MailMessage correo = new MailMessage();
            SmtpClient smpt = new SmtpClient();

            try
            {
                correo.From = new MailAddress(asDe);
                //Correo de Destino
                foreach (var item in asPara)
                {
                    correo.To.Add(item);
                }
                //Correo de Copia
                if (asCC != null)
                {
                    if (asCC.Count > 0)
                    {
                        foreach (var item in asCC)
                        {
                            correo.CC.Add(item);
                        }
                    }
                }
                ////Correo de Copia Oculta
                if (asCO != null)
                {
                    if (asCO.Count > 0)
                    {
                        foreach (var item in asCO)
                        {
                            correo.Bcc.Add(item);
                        }
                    }
                }

                ServicePointManager.ServerCertificateValidationCallback = delegate (object s
                       , X509Certificate certificate
                       , X509Chain chain
                       , SslPolicyErrors sslPolicyErrors)

                { return true; };
                correo.Subject = asAsunto;

                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(asCuerpo, Encoding.UTF8, MediaTypeNames.Text.Html);
                //htmlView = mostrarImagen(htmlView, proceso);
                LinkedResource imgLogo = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenMem"), MediaTypeNames.Image.Jpeg);
                imgLogo.ContentId = "imagenMEM";
                htmlView.LinkedResources.Add(imgLogo);

                LinkedResource imgBanner = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenBanner"), MediaTypeNames.Image.Jpeg);
                imgBanner.ContentId = "imagenBanner";
                htmlView.LinkedResources.Add(imgBanner);

                LinkedResource imgGef = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenGef"), MediaTypeNames.Image.Jpeg);
                imgGef.ContentId = "imagenGEF";
                htmlView.LinkedResources.Add(imgGef);

                LinkedResource imgPnud = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenPnud"), MediaTypeNames.Image.Jpeg);
                imgPnud.ContentId = "imagenPNUD";
                htmlView.LinkedResources.Add(imgPnud);

                correo.AlternateViews.Add(htmlView);
                correo.IsBodyHtml = asesHtml;
                correo.Priority = MailPriority.Normal;
                smpt.Host = WebConfigurationManager.AppSettings.Get("IpMail");
                string UserMail, ClaveMail;
                UserMail = WebConfigurationManager.AppSettings.Get("UserMail");
                ClaveMail = WebConfigurationManager.AppSettings.Get("ClaveMail");
                smpt.Credentials = new NetworkCredential(UserMail, ClaveMail);
                int puerto = int.Parse(WebConfigurationManager.AppSettings.Get("Puerto").ToString());
                smpt.Port = puerto;
                smpt.EnableSsl = true;
                if (listaAdjunto != null)
                {
                    if (listaAdjunto.Count > 0)
                    {
                        foreach (var item in listaAdjunto)
                        {
                            correo.Attachments.Add(item);
                        }
                    }
                }

                // ENCARGO DE ENVIAR EL CORREO 
                smpt.Send(correo);
                return true;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                return false;
            }
        }

        private static AlternateView mostrarImagen(AlternateView htmlView, string proceso)
        {
            if (proceso == "registro")
            {
                LinkedResource imgLogo = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenMem"), MediaTypeNames.Image.Jpeg);
                imgLogo.ContentId = "imagenMEM";
                htmlView.LinkedResources.Add(imgLogo);

                LinkedResource imgBanner = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenBanner"), MediaTypeNames.Image.Jpeg);
                imgBanner.ContentId = "imagenBanner";
                htmlView.LinkedResources.Add(imgBanner);

                LinkedResource imgGef = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenGef"), MediaTypeNames.Image.Jpeg);
                imgGef.ContentId = "imagenGEF";
                htmlView.LinkedResources.Add(imgGef);

                LinkedResource imgPnud = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenPnud"), MediaTypeNames.Image.Jpeg);
                imgPnud.ContentId = "imagenPNUD";
                htmlView.LinkedResources.Add(imgPnud);
            }
            else if (proceso == "aprobar")
            {
                LinkedResource imgBanner = new LinkedResource(@WebConfigurationManager.AppSettings.Get("ImagenBanner"), MediaTypeNames.Image.Jpeg);
                imgBanner.ContentId = "imagenBanner";
                htmlView.LinkedResources.Add(imgBanner);
            }

            return htmlView;
        }
    }
}
