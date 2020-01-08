using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using utilitario.minem.gob.pe;

namespace MRVMinem.Areas.Administrado.Repositorio
{
    public class EnvioCorreo
    {

        public bool CreacionUsuario(UsuarioBE entidad)
        {
            string cuerpo = CuerpoCreacionUsuario(entidad);
            string De = "mrv@grupo-zuniga.com";
            string asunto = entidad.NOMBRES_USUARIO + " " + entidad.APELLIDOS_USUARIO + ", " + "Gracias por registrarte en nuestra plataforma MRV del sector energía";
            List<string> Para = new List<string>();
            Para.Add(entidad.EMAIL_USUARIO);
            List<string> Cco = CorreoOculto(WebConfigurationManager.AppSettings.Get("CorreoOculto"));

            bool envioCorreo = Correo.EnviarEmail(De, Para, asunto, cuerpo, true, null, Cco, null);

            return envioCorreo;

        }

        private string CuerpoCreacionUsuario(UsuarioBE entidad)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" <html xmlns=\"http://www.w3.org/1999/xhtml\">");
            sb.Append(" <head>");
            sb.Append(" <title>");
            sb.Append(" </title></head>");
            sb.Append(" <body>");

            sb.Append(" <table style=\"background-color: #ffffff;width: 85%;border: #DADFE6 2px solid\" align=\"center\" cellpadding=\"3\" cellspacing=\"2\"><tr><td><table style=\"background-color: #ffffff;width: 100%;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">");
            sb.Append(" </table>");

            sb.Append(" <table style=\"font-size: 11px;color: #000000;font-family: arial;text-align: justify;width: 100%; border-bottom: 1px\" cellspacing=\"2\" border=\"0\">");
            sb.Append(" <tr><td style=\"height: 16px\"> <img src=\"cid:imagenMEM\" /> </td></tr>");
            //sb.Append("     <td style=\"font-size: 9px;color: #727272;font-family: arial;text-align:right\"></td> ");
            //sb.Append("     <td style=\"font-weight:bold;font-size: 23px;color: #000000;font-family: arial;text-align:center;border: #DADFE6 2px solid;background-color: #dff0d8\"></td> </tr>");
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

            //sb.Append(" <table style=\"border: #DADFE6 1px solid;width: 100%; border-bottom: 1px\" cellspacing=\"0\" cellpadding=\"2\" width=\"55%\">");
            //sb.Append(" <tr style=\"font-weight: bold;font-size: 11px;letter-spacing: 1px;font-family: arial;background-color: #dff0d8;text-align: center;\">");
            //sb.Append(" <td colspan=\"2\" style=\"color: #000000\">DATOS DEL PROYECTO</td></tr>");
            //sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: arial;\">");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 130px\">Nombres</td>");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 75%\">" + entidad.NOMBRE + "</td></tr>");
            //sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: arial;\">");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 130px\">Resolución</td>");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 75%\">" + entidad.RESOLUCION + "</td></tr>");
            //sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: arial;\">");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 130px; height: 20px;\">Prioridad</td>");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 75%; height: 20px;\">" + entidad.TIPO_PRIORIDAD + "</td></tr>");
            //sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: arial;\">");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 130px; height: 20px;\">Rubro</td>");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 75%; height: 20px;\">" + entidad.DESC_TIPO_RUBRO + "</td></tr>");
            //sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: arial;\">");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 130px; height: 20px;\">Fecha de Registro del Proyecto</td>");
            //sb.Append(" <td style=\"border: #DADFE6 1px solid;width: 75%; height: 20px;\">" + entidad.FEC_REGISTRO_PROYECTO.ToString("dd/MM/yyyy") + "</td></tr>");
            //sb.Append(" </table>");

            sb.Append(" <table style=\"border: #DADFE6 1px solid;width: 100%; border-bottom: 1px\" cellspacing=\"0\" cellpadding=\"2\" width=\"55%\">");
            sb.Append(" <tr style=\"font-weight: bold;font-size: 11px;letter-spacing: 1px;font-family: arial;background-color: #dff0d8;text-align: center;\">");

            sb.Append(" <table style=\"vertical-align: baseline;height:20px;width: 100%; border-bottom: 1px solid #DADFE6; border-top: 1px solid #DADFE6\" cellspacing=\"0\" cellpadding=\"5\" >");
            sb.Append(" <tr style=\"font-size: 11px;color: #000000;font-family: Arial\">");
            sb.Append(" <td style=\"text-align: center;font-weight: bold;color:#656565\"> MINEM - Copyright " + DateTime.Now.Year.ToString() + ", Todos los derechos reservados </td></tr>");
            sb.Append(" </table>");
            sb.Append(" </tr>");
            sb.Append(" </table>");
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