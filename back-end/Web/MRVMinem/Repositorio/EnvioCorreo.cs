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
        public EnvioCorreo(UsuarioBE entidad)
        {
            xEntidad = entidad;
        }

        //public bool CreacionUsuario(UsuarioBE entidad)
        public void CreacionUsuario()
        {
            string cuerpo = CuerpoCreacionUsuario(xEntidad);
            string De = "mrv@grupo-zuniga.com";
            string asunto = xEntidad.NOMBRES_USUARIO + " " + xEntidad.APELLIDOS_USUARIO + ", " + "Gracias por registrarte en nuestra plataforma MRV del sector energía";
            List<string> Para = new List<string>();
            Para.Add(xEntidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail(De, Para, asunto, cuerpo, true, null, Cco, null);

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


            sb.Append("<div style=\"font-family: Roboto;font-size:12px;margin:0 auto;margin-top:50px;width:650px;\" ><img src=\"cid:imagenBanner\" width=\"150\" />");
            sb.Append("     <div style=\"border-bottom: 1px solid #ededed;\"></div><br/><br/><strong> Estimado Usuario: &nbsp;</strong><span> " + entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + ", hemos recibido sus datos:</span><br/><br/>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin:10px;padding:10px;\">");
            sb.Append("         <table style=\"font-family: Roboto;font-size:12px;\">");
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
            sb.Append("     </div><span> Procederemos a valdiar dicha información, en breve le confirmaremos nuestra respuesta.</span>");
            sb.Append("     <div style=\"border-left:1px solid #ededed;margin-top:50px;\">");
            sb.Append("         <table style=\"font-family: Roboto; font-size:12px;\" >");
            sb.Append("             <tr>");
            sb.Append("                 <td><strong> MINISTERIO DE ENERGÏA Y MINAS</strong></td>");
            sb.Append("             </tr>");
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
            sb.Append("<div><a href=\"10.0.0.102/mrv-minem/Publico/Portal/Login\">Pulse aqui para verificar su cuenta</a></div><br/>");
            sb.Append("<div><a href=\"10.0.0.102/mrv-minem\">Pulse aqui para verificar su cuenta</a></div><br/>");





            /*
            sb.Append(" <table style=\"background-color: #ffffff;width: 85%;border: #DADFE6 2px solid\" align=\"center\" cellpadding=\"3\" cellspacing=\"2\"><tr><td><table style=\"background-color: #ffffff;width: 100%;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">");
            sb.Append(" </table>");

            sb.Append(" <table style=\"font-size: 11px;color: #000000;font-family: arial;text-align: justify;width: 100%; border-bottom: 1px\" cellspacing=\"2\" border=\"0\">");
            sb.Append(" <tr><td style=\"height: 16px\"> <img src=\"cid:imagenMEM\" /> </td></tr>");

            sb.Append(" <tr><td></td></tr>");
            sb.Append(" </table>");

            sb.Append(" <table style=\"font-size: 11px;color: #000000;font-family: arial;text-align: justify;width: 100%; border-bottom: 1px\" cellspacing=\"2\" border=\"0\">");
            sb.Append(" <tr><td style=\"height: 250px\"> <img src=\"cid:imagenBanner\" /> </td></tr>");
            sb.Append(" </table>");

            sb.Append(" <table style=\"font-size: 11px;color: #000000;font-family: arial;text-align: justify;width: 100%; border-bottom: 1px\" cellspacing=\"2\" border=\"0\">");
            sb.Append(" <tr><td style=\"height: 16px\"></td></tr>");
            sb.Append(" <tr><td style=\"height: 14px;font-size: 12px;font-weight: bold\"></td></tr><tr><td>&nbsp;</td></tr>");
            sb.Append(" <tr><td>Gracias por registrate en nuestro sistema <b>MRV</b>, tu registro fue satisfactorio, en estos momentos nuestro especialista esta verificandotu registro para poder brindarte el acceso al sistema</td></tr><tr><td>&nbsp;</td></tr>");
            sb.Append(" </table>");

            sb.Append(" <table style=\"border: #DADFE6 1px solid;width: 100%; border-bottom: 1px\" cellspacing=\"0\" cellpadding=\"2\" width=\"55%\">");
            sb.Append(" <tr style=\"font-weight: bold;font-size: 11px;letter-spacing: 1px;font-family: arial;background-color: #dff0d8;text-align: center;\">");

            sb.Append(" <table style=\"vertical-align: baseline;height:20px;width: 100%; border-bottom: 1px solid #DADFE6; border-top: 1px solid #DADFE6\" cellspacing=\"0\" cellpadding=\"5\" >");
            sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: Arial\">");
            sb.Append(" <td style=\"text-align: center;font-weight: bold;color:#656565\"> MINEM - Copyright " + DateTime.Now.Year.ToString() + ", Todos los derechos reservados </td></tr>");
            sb.Append(" </table>");
            sb.Append(" </tr>");
            sb.Append(" </table>");*/
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