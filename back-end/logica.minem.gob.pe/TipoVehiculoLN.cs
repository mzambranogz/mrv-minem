using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class TipoVehiculoLN
    {
        public static TipoVehiculoDA tipoVehiculo = new TipoVehiculoDA();

        public static List<TipoVehiculoBE> ListarTipoVehiculo(TipoVehiculoBE entidad)
        {
            return tipoVehiculo.ListarTipoVehiculo(entidad);
        }
    }
}
