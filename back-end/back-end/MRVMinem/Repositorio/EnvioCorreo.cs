using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using utilitario.minem.gob.pe;

namespace MRVMinem.Repositorio
{
    public class EnvioCorreo
    {
        UsuarioBE xEntidad;
        IniciativaBE xEntidadI;
        IndicadorBE xEntidadID;
        int xOpc;
        public EnvioCorreo(UsuarioBE entidad)
        {
            xEntidad = entidad;
        }

        public EnvioCorreo(IniciativaBE entidad, int opc)
        {
            xEntidadI = entidad;
            xOpc = opc;
        }

        public EnvioCorreo(IndicadorBE entidad)
        {
            xEntidadID = entidad;
        }
        //public bool CreacionUsuario(UsuarioBE entidad)
        public void CreacionUsuario()
        {
            string cuerpo = CuerpoCreacionUsuario(xEntidad);
            //string De = "mrv@grupo-zuniga.com";
            string De = WebConfigurationManager.AppSettings.Get("Usermail");
            string asunto = xEntidad.NOMBRES_USUARIO + " " + xEntidad.APELLIDOS_USUARIO + ", " + "Gracias por registrarte en nuestra plataforma MRV del sector energía";
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("registro", De, Para, asunto, cuerpo, true, null, Cco, null);

            //return envioCorreo;
        }

        public void AprobacionUsuario()
        {
            string cuerpo = CuerpoAprobacionUsuario(xEntidad, WebConfigurationManager.AppSettings.Get("Server"));
            //string De = "mrv@grupo-zuniga.com";
            string De = WebConfigurationManager.AppSettings.Get("Usermail");
            string asunto = xEntidad.NOMBRES_USUARIO + " " + xEntidad.APELLIDOS_USUARIO + ", " + "Su cuenta ha sido aprobada";
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);
        }

        public void recuperarClave()
        {
            string cuerpo = CuerpoRecuperarClave(xEntidad, WebConfigurationManager.AppSettings.Get("Server"));
            //string De = "mrv@grupo-zuniga.com";
            string De = WebConfigurationManager.AppSettings.Get("Usermail");
            string asunto = xEntidad.NOMBRES + ", " + "reestablecimiento de contraseña";
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);
        }

        public void menajeIniciativa()
        {
            string cuerpo = CuerpoMensajeIniciativa(xEntidadI, WebConfigurationManager.AppSettings.Get("Server"));
            //string De = "mrv@grupo-zuniga.com";
            string De = WebConfigurationManager.AppSettings.Get("Usermail");
            string asunto = xEntidadI.ASUNTO;
            List<string> Para = new List<string>();
            Para.Add(xEntidadI.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);
        }

        public void menajeUsuarioReg()
        {
            string cuerpo = CuerpoMensajeUsuarioReg(xEntidad, WebConfigurationManager.AppSettings.Get("Server"));
            //string De = "mrv@grupo-zuniga.com";
            string De = WebConfigurationManager.AppSettings.Get("Usermail");
            string asunto = xEntidad.ASUNTO;
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);
        }

        public void enviarMensaje()
        {
            string cuerpo = CuerpoEnviarMensaje(xEntidad);
            //string De = "mrv@grupo-zuniga.com";
            string De = xEntidad.EMAIL_USUARIO_ORIGEN;
            string asunto = xEntidad.ASUNTO;
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);

            //return envioCorreo;
        }

        public void enviarMensajeIniciativa()
        {
            string cuerpo = CuerpoEnviarMensajeIniciativa(xEntidadI);
            //string De = "mrv@grupo-zuniga.com";
            string De = xEntidadI.EMAIL_USUARIO_ORIGEN;
            string asunto = xEntidadI.ASUNTO;
            List<string> Para = new List<string>();
            Para.Add(xEntidadI.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail("", De, Para, asunto, cuerpo, true, null, Cco, null);

            //return envioCorreo;
        }

        private string CuerpoCreacionUsuario(UsuarioBE entidad)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><strong> Estimado Usuario: &nbsp;</strong><span> " + entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + ", hemos recibido sus datos:</span><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><strong> Email:&nbsp;</strong><span> " + entidad.EMAIL_USUARIO + " </span></td>");
            sb.Append("                 <td style=\"padding:5px;\"><strong> RUC:&nbsp;</strong><span> " + entidad.RUC + " </span></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                <td style=\"padding:5px;\"><strong> Nombre(s):&nbsp;</strong><span> " + entidad.NOMBRES_USUARIO + " </span></td>");
            sb.Append("                <td style=\"padding:5px;\"><strong> Dirección:&nbsp;</strong><span> " + entidad.DIRECCION + " </span></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding: 5px;\"><strong> Apellido:&nbsp;</strong><span> " + entidad.APELLIDOS_USUARIO + " </span></td>");
            sb.Append("                 <td style=\"padding: 5px;\"><strong> Sector:&nbsp;</strong><span> " + entidad.SECTOR + " </span></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding: 5px;\"><strong> Teléfono:&nbsp;</strong><span> " + entidad.TELEFONO_USUARIO + " </span></td>");
            sb.Append("                 <td style=\"padding: 5px;\"><strong> Celular:&nbsp;</strong><span> " + entidad.CELULAR_USUARIO + " </span></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding: 5px;\"><strong> Anexo:&nbsp;</strong><span> " + entidad.ANEXO_USUARIO + " </span></td>");
            sb.Append("                 <td style=\"padding: 5px;\"></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div><span> Procederemos a validar dicha información, en breve le confirmaremos nuestra respuesta.</span>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            //sb.Append("             <tr>");
            //sb.Append("                 <td><strong> MINISTERIO DE ENERGÏA Y MINAS</strong></td>");
            //sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            //sb.Append("<div><a href=\"10.0.0.102/mrv-minem/Publico/Portal/Login\">Pulse aqui para verificar su cuenta</a></div><br/>");
            //sb.Append("<div><a href=\"10.0.0.103/mrv-minem/Portal/ConfirmarCorreo/10\">Pulse aqui para verificar su cuenta</a></div><br/>");
            sb.Append(" </body>");
            sb.Append(" </html>");

            return sb.ToString();
        }

        private string CuerpoAprobacionUsuario(UsuarioBE entidad, string server)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><strong> Estimado Usuario: &nbsp;</strong><span> " + entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + ", su cuenta ha sido aprobada.</span><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><span>Por favor, pulse <a href=\"" + server + "Home/login\">aquí</a> para iniciar sesión o copie este link en su navegador \""+ server + "Home/login\"</span></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            //sb.Append("     </div><span> Procederemos a valdiar dicha información, en breve le confirmaremos nuestra respuesta.</span>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            //sb.Append("<div><a href=\"10.0.0.102/mrv-minem/Publico/Portal/Login\">Pulse aqui para verificar su cuenta</a></div><br/>");
            //sb.Append("<div><a href=\"10.0.0.103/mrv-minem/Portal/ConfirmarCorreo/10\">Pulse aqui para verificar su cuenta</a></div><br/>");
            sb.Append(" </body>");
            sb.Append(" </html>");

            return sb.ToString();
        }

        private string CuerpoRecuperarClave(UsuarioBE entidad, string server)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><strong> Estimado Usuario: &nbsp;</strong><span>" + entidad.NOMBRES + " , podrá reestablecer su contraseña a través de este link: </span><br/><span><a href=\"" + server + "Portal/ReestablecerClave/" + entidad.ID_USUARIO + "\">" + server + "Portal/ReestablecerClave/" + entidad.ID_USUARIO + "</a></span></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            sb.Append(" </body>");
            sb.Append(" </html>");

            //sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            //sb.Append(" <head>");
            //sb.Append(" <title>");
            //sb.Append(" </title></head>");
            //sb.Append(" <body>");
            //sb.Append("<div style=\"font-family: Roboto;font-size:12px;margin:0 auto;margin-top:50px;width:650px;\">");
            //sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><strong> Estimado Usuario: &nbsp;</strong><span>" + entidad.NOMBRES + " , podrá reestablecer su contraseña a través de este link: </span><br/><span><a href=\"" + server + "Portal/ReestablecerClave?id=" + entidad.ID_USUARIO + "\">Minem/RecuperarClave/HzLoAdpikOlXcdl</a></span><br/><br/>");
            //sb.Append("         <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            //sb.Append("     </div>");
            //sb.Append("</div>");
            //sb.Append(" </body>");
            //sb.Append(" </html>");

            return sb.ToString();
        }

        private string CuerpoMensajeIniciativa(IniciativaBE entidad, string server)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            //sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span><span><a href=\"" + server + "Home/login\">" + server + "Home/login</a></span></td>");
            if (entidad.VALIDAR_RUTA == 1)
            {
                sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span></td>");
            }
            else
            {
                sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span><span><a href=\"" + server + "Home/login\">" + server + "Home/login</a></span></td>");
            }            
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            sb.Append(" </body>");
            sb.Append(" </html>");


            //sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            //sb.Append(" <head>");
            //sb.Append(" <title>");
            //sb.Append(" </title></head>");
            //sb.Append(" <body>");
            //sb.Append("<div style=\"font-family: Roboto;font-size:12px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            //sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><span>" + entidad.DESCRIPCION + "</span><span><a href=\"" + server + "Home/login\">" + server + "Home/login</a></span><br/>");
            //sb.Append("         <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            //sb.Append("     </div>");
            //sb.Append("</div>");
            //sb.Append(" </body>");
            //sb.Append(" </html>");

            return sb.ToString();
        }

        private string CuerpoMensajeUsuarioReg(UsuarioBE entidad, string server)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span><span><a href=\"" + server + "Home/login\">" + server + "Home/login</a></span></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            sb.Append(" </body>");
            sb.Append(" </html>");

            //sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            //sb.Append(" <head>");
            //sb.Append(" <title>");
            //sb.Append(" </title></head>");
            //sb.Append(" <body>");
            //sb.Append("<div style=\"font-family: Roboto;font-size:12px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            //sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><span>" + entidad.DESCRIPCION + "</span><span><a href=\"" + server + "Home/login\">" + server + "Home/login</a></span><br/>");
            //sb.Append("         <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            //sb.Append("     </div>");
            //sb.Append("</div>");
            //sb.Append(" </body>");
            //sb.Append(" </html>");

            return sb.ToString();
        }

        private string CuerpoEnviarMensaje(UsuarioBE entidad)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><strong> Estimado Usuario: &nbsp;</strong><span> " + entidad.NOMBRES + ", "+entidad.CABECERA_EMAIL+"</span><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            sb.Append(" </body>");
            sb.Append(" </html>");
            return sb.ToString();
        }

        private string CuerpoEnviarMensajeIniciativa(IniciativaBE entidad)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");
            sb.Append("<div style=\"font-family: Roboto;font-size:13px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/>" + entidad.CABECERA_EMAIL + "<br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:13px;\">");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"padding:5px;\"><span>" + entidad.DESCRIPCION + "</span></td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:13px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><img src=\"cid:imagenMEM\" height=\"40\" style=\"margin-right:7px;\" /><img src=\"cid:imagenGEF\" height=\"45\" style =\"margin-right:7px;\" /><img src=\"cid:imagenPNUD\" height =\"51\" style=\"margin-right:7px;\" /></td>");
            sb.Append("             </tr>");
            sb.Append("             <tr>");
            sb.Append("                 <td style=\"text-align: justify;\" ><br/>");
            sb.Append("                     <p> AVISO DE CONFIDENCIALIDAD</p>");
            sb.Append("                     <p> Esta Dirección de correo y sus anexos son de propiedad del Ministerio de Energía y Minas y pueden contener información confidencial e información privilegiada.Si no es el destinatario, por favor notifique al remitente inmediatamente retornando el e - mail, eliminar este correo electrónico y destruir todas las copias.Toda difusión o la utilización de esta información por una persona distinta del destinatario no están autorizado y puede ser ilegal.</p><br/>");
            sb.Append("                     <p> CONFIDENTIALITY STATEMENT </p>");
            sb.Append("                     <p> This e-mail and its attachments are owned by the Ministry of Energy and Mines and may contain confidential and privileged information.If you are not the intended recipient, please notify the sender immediately, return e - mail, delete this e - mail and destroy all copies. Any dissemination or use of this information by a person other than the recipient is not authorized and may be unlawful.</p>");
            sb.Append("                 </td>");
            sb.Append("             </tr>");
            sb.Append("         </table>");
            sb.Append("     </div>");
            sb.Append("</div>");
            sb.Append(" </body>");
            sb.Append(" </html>");
            return sb.ToString();
        }

        private List<string> CorreoOculto(string correo)
        {
            List<string> correoCCo = null;
            string[] cco = null;
            if (!String.IsNullOrEmpty(correo))
            {
                correoCCo = new List<string>();
                cco = correo.Split(';');
                foreach (string cc in cco)
                {
                    correoCCo.Add(cc);
                }
            }
            return correoCCo;
        }

    }
}