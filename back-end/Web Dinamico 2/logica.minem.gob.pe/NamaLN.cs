using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using entidad.minem.gob.pe;
using datos.minem.gob.pe;
using utilitario.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public static class NamaLN
    {
        public static NamaDA nama = new NamaDA();

        public static List<NamaBE> ListaNamaControl(NamaBE entidad)
        {
            return nama.ListaNamaControl(entidad);
        }

        public static List<NamaBE> ListarNamaPaginado(NamaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return nama.ListarNamaPaginado(entidad);
        }

        public static List<NamaBE> ListarNamaExcel(NamaBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return nama.ListarNamaExcel(entidad);
        }

        public static NamaBE GetNamaPorId(NamaBE entidad)
        {
            return nama.GetNamaPorId(entidad);
        }

        public static NamaBE RegistrarNama(NamaBE entidad)
        {
            return nama.RegistrarNama(entidad);
        }

        public static NamaBE ActualizarNama(NamaBE entidad)
        {
            return nama.ActualizarNama(entidad);
        }

        public static NamaBE EliminarNama(NamaBE entidad)
        {
            return nama.EliminarNama(entidad);
        }
    }
}
