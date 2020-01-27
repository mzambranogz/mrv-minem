using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class BusquedaAvanzaLN
    {
        public static BusquedaAvanzadaDA energ = new BusquedaAvanzadaDA();
        public static List<IniciativaBE> BusquedaAvanzada(BusquedaAvanzadaBE entidad)
        {

            return energ.ListarBusqAvanzaPublic(entidad);
        }

        public static List<IniciativaBE> BusquedaAvanzadaPrivado(BusquedaAvanzadaBE entidad)
        {

            return energ.ListarBusqAvanzaPrivadoUsuario(entidad);
        }

        public static List<IniciativaBE> BusquedaAvanzadaPrivadoEspecialista(BusquedaAvanzadaBE entidad)
        {

            return energ.ListarBusqAvanzaPrivadoEspecialista(entidad);
        }

        public static List<IniciativaBE> BusquedaAvanzadaAdmMi(BusquedaAvanzadaBE entidad)
        {
            return energ.ListarBusqAvanzaPrivadoAdmMi(entidad);
        }
        public static List<IniciativaBE> BusquedaAvanzadaEvaMRV(BusquedaAvanzadaBE entidad)
        {
            return energ.ListarBusqAvanzaPrivadoEvaMRV(entidad);
        }


        public static List<IniciativaBE> BusquedaAvanzadaVerVis(BusquedaAvanzadaBE entidad)
        {

            return energ.ListarBusqAvanzaPrivadoVerVis(entidad);
        }

    }

}