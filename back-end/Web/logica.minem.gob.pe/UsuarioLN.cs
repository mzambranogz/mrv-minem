using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using utilitario.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class UsuarioLN
    {
        private static UsuarioDA usuarioDA = new UsuarioDA();

        public static UsuarioBE VerificarEmail(UsuarioBE entidad)
        {
            if (usuarioDA.VerificarEmail(entidad) == 0)
            {
                entidad.OK = true;
            }
            else
            {
                entidad.OK = false;
            }
            return entidad;
        }
        public static UsuarioBE RegistraUsuario(UsuarioBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.ANEXO_USUARIO)) entidad.ANEXO_USUARIO = "";
            entidad.PASSWORD_USUARIO = Seguridad.hashSal(entidad.PASSWORD_USUARIO);
            return usuarioDA.RegistraUsuario(entidad);
        }
        public static UsuarioBE EditarUsuario(UsuarioBE entidad)
        {
            return usuarioDA.EditarUsuario(entidad);
        }
        public static UsuarioBE ObtenerPassword(UsuarioBE entidad)
        {
            var ent = usuarioDA.ObtenerPassword(entidad);
            if (string.IsNullOrEmpty(ent.PASSWORD_USUARIO))
            {
                entidad.OK = false;
            }
            else
            {
                entidad.OK = Seguridad.CompararHashSal(entidad.PASSWORD_USUARIO, ent.PASSWORD_USUARIO);
                entidad.ID_USUARIO = ent.ID_USUARIO;
            }

            if (entidad.OK)
            {
                entidad.OK = usuarioDA.VerificarEstadoUsuario(entidad);
                if (!entidad.OK)
                {
                    entidad.extra = "El usuario aún no ha sido aprobado";
                }
            }
            else
            {
                entidad.extra = "Usuario y/o Password incorrecto";
            }

            return entidad;
        }
        public static List<UsuarioBE> ObtenerInformacionUsuario(UsuarioBE entidad)
        {
            return usuarioDA.ObtenerInformacionUsuario(entidad);
        }
        public static List<UsuarioBE> ListaMantenimientoUsuario(UsuarioBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = ""; 
            return usuarioDA.ListaMantenimientoUsuario(entidad);
        }
        public static List<UsuarioBE> SeleccionarMantenimientoUsuario(UsuarioBE entidad)
        {
            return usuarioDA.SeleccionarMantenimientoUsuario(entidad);
        }

        public static List<UsuarioMedMitBE> ListaUsuarioMedidaMitigacion(UsuarioMedMitBE entidad)
        {
            return usuarioDA.ListaUsuarioMedidaMitigacion(entidad);
        }
        public static UsuarioBE validarConfirmarCorreo(UsuarioBE entidad)
        {
            return usuarioDA.validarConfirmarCorreo(entidad);
        }

        public static UsuarioBE VerificarClave(UsuarioBE entidad)
        {
            var ent = usuarioDA.VerificarClave(entidad);
            if (string.IsNullOrEmpty(ent.PASSWORD_USUARIO))
            {
                entidad.OK = false;
            }
            else
            {
                entidad.OK = Seguridad.CompararHashSal(entidad.PASSWORD_USUARIO, ent.PASSWORD_USUARIO);
            }

            if (!entidad.OK)
            {
                entidad.OK = false;
                entidad.extra = "La contraseña actual no es la correcta.";
            }

            return entidad;
        }

        public static UsuarioBE CambiarClave(UsuarioBE entidad)
        {
            entidad.NUEVO_PASSWORD_USUARIO = Seguridad.hashSal(entidad.NUEVO_PASSWORD_USUARIO);
            return usuarioDA.CambiarClave(entidad);
        }

        public static UsuarioBE obtenerUsuario(UsuarioBE entidad)
        {
            return usuarioDA.obtenerUsuario(entidad);
        }

        public static UsuarioBE obtenerUsuarioId(int cod)
        {
            return usuarioDA.obtenerUsuarioId(cod);
        }

        /////////////
        public static UsuarioBE EspecialistaMedida(int medida)
        {
            return usuarioDA.EspecialistaMedida(medida);
        }

        public static UsuarioBE UsuarioAdministrador()
        {
            return usuarioDA.UsuarioAdministrador();
        }

        public static UsuarioBE UsuarioEvaluador()
        {
            return usuarioDA.UsuarioEvaluador();
        }

        public static UsuarioBE UsuarioIniciativa(int id)
        {
            return usuarioDA.UsuarioIniciativa(id);
        }

        public static List<UsuarioBE> BuscarMantenimientoUsuario(UsuarioBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return usuarioDA.BuscarMantenimientoUsuario(entidad);
        }

        public static UsuarioBE ActualizarPrimeraVisita(UsuarioBE entidad)
        {
            return usuarioDA.ActualizarPrimeraVisita(entidad);
        }
    }
}
