using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class IndicadorLN
    {
        public static IndicadorDA indicador = new IndicadorDA();

        public static List<IndicadorBE> ListarTablaIndicador(IndicadorBE entidad)
        {
            return indicador.ListarTablaIndicador(entidad);
        }

        public static List<IndicadorBE> CalcularIndicador(IndicadorBE entidad)
        {
            return indicador.CalcularIndicador(entidad);
        }

        public static IndicadorBE EliminarIndicador(IndicadorBE entidad)
        {
            return indicador.EliminarIndicador(entidad);
        }

        public static List<IndicadorBE> ListarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ListarDetalleIndicador(entidad);
        }

        public static IndicadorBE EvaluarIndicador(IndicadorBE entidad)
        {
            return indicador.EvaluarIndicador(entidad);
        }

        public static IndicadorBE RegistrarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.RegistrarDetalleIndicador(entidad);
        }

        public static IndicadorBE AvanceDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AvanceDetalleIndicador(entidad);
        }

        public static IniciativaBE RegistrarAvanceDetalleIndicador(IniciativaBE entidad) //add 30-01-20
        {
            return indicador.RegistrarAvanceDetalleIndicador(entidad);
        }

        public static IndicadorBE AprobarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AprobarDetalleIndicador(entidad);
        }

        public static List<IndicadorBE> ListarDetalleIndicadorRevision(IndicadorBE entidad)
        {
            return indicador.ListarDetalleIndicadorRevision(entidad);
        }

        public static IndicadorBE ObservacionDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionDetalleIndicador(entidad);
        }

        public static IndicadorBE CorregirDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.CorregirDetalleIndicador(entidad);
        }

        public static IndicadorBE CorregirAvanceDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.CorregirAvanceDetalleIndicador(entidad);
        }

        public static IndicadorBE AprobarAdminIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.AprobarAdminIniciativaDetalleIndicador(entidad);
        }

        public static IndicadorBE EvaluarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.EvaluarIniciativaDetalleIndicador(entidad);
        }

        public static IndicadorBE VerificarIniciativaDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.VerificarIniciativaDetalleIndicador(entidad);
        }

        /*==== add==========*/
        public static IndicadorBE RegistraTodosIndicadores(List<IndicadorBE> ListaIndicadores)
        {
            IndicadorBE entidad = null;
            foreach (IndicadorBE item in ListaIndicadores)
            {
                entidad = indicador.RegistrarDetalleIndicador(item);
                if (!entidad.OK)
                {
                    break;
                }
            }
            return entidad;
        }

        public static SustentoIniciativaBE RegistraTodosSustentoIniciativa(List<SustentoIniciativaBE> ListaSustentos)
        {
            SustentoIniciativaBE entidad = null;
            foreach (SustentoIniciativaBE item in ListaSustentos)
            {
                entidad = indicador.RegistrarSustentoIniciativa(item);
                if (!entidad.OK)
                {
                    break;
                }
            }
            return entidad;
        }

        public static IniciativaBE RegistrarEnvioDetalle(IniciativaBE entidad)
        {
            return indicador.RegistrarEnvioDetalle(entidad);
        }

        public static IndicadorBE GetDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.GetDetalleIndicador(entidad);

        }

        public static IniciativaBE EliminarIndicadores(IniciativaBE entidad)
        {
            return indicador.EliminarIndicadores(entidad);

        }

        public static IniciativaBE EliminarIndicadoresFile(IniciativaBE entidad) //add 12-02-2020
        {
            return indicador.EliminarIndicadoresFile(entidad);

        }

        public static IniciativaBE CorregirDetalleIndicador2(IniciativaBE entidad)
        {
            return indicador.CorregirDetalleIndicador2(entidad);
        }

        ///////////////////////////////////////
        public static List<IndicadorBE> ListarDetalleIndicadorDatos(IniciativaBE entidad)
        {
            return indicador.ListarDetalleIndicadorDatos(entidad);
        }

        public static IndicadorBE ObservacionAdminDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionAdminDetalleIndicador(entidad);
        }

        public static IndicadorBE ObservacionEvaluarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionEvaluarDetalleIndicador(entidad);
        }

        public static IndicadorBE ObservacionVerificarDetalleIndicador(IndicadorBE entidad)
        {
            return indicador.ObservacionVerificarDetalleIndicador(entidad);
        }

        public static int DetalleIndicadorEnfoque(int iniciativa)
        {
            return indicador.DetalleIndicadorEnfoque(iniciativa);
        }
    }
    
}
