using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class BusquedaSimpleLN
    {
        public static BusquedaSimpleDA energ = new BusquedaSimpleDA();
        public static List<IniciativaBE> BusquedaSimple(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePublic(entidad);
        }

        public static List<IniciativaBE> BusquedaSimplePrivado(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePrivado(entidad);
        }
        public static List<IniciativaBE> BusquedaSimpleEsp(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePrivadoEspe(entidad);
        }

        public static List<IniciativaBE> BusquedaSimplePrivadoMi(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePrivadoMi(entidad);
        }
        public static List<IniciativaBE> BusquedaSimplePrivadoEvaMRV(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePrivadoEvaMRV(entidad);
        }
        public static List<IniciativaBE> BusquedaSimplePrivadoVerVis(BusquedaSimpleBE entidad)
        {
            return energ.ListarBusqSimplePrivadoVerVis(entidad);
        }
    }
}
