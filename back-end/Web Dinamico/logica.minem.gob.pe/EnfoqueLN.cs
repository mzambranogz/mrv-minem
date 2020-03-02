using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using datos.minem.gob.pe;
using entidad.minem.gob.pe;

namespace logica.minem.gob.pe
{
    public class EnfoqueLN
    {
        public static EnfoqueDA Enfoque = new EnfoqueDA();

        public static List<EnfoqueBE> ListarEnfoquePaginado(EnfoqueBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return Enfoque.ListarEnfoquePaginado(entidad);
        }

        public static List<EnfoqueBE> ListarEnfoqueExcel(EnfoqueBE entidad)
        {
            if (string.IsNullOrEmpty(entidad.buscar)) entidad.buscar = "";
            return Enfoque.ListarEnfoqueExcel(entidad);
        }

        public static EnfoqueBE GetEnfoquePorId(EnfoqueBE entidad)
        {
            return Enfoque.GetEnfoquePorId(entidad);
        }

        public static EnfoqueBE RegistrarEnfoque(EnfoqueBE entidad)
        {
            return Enfoque.RegistrarEnfoque(entidad);
        }

        public static EnfoqueBE ActualizarEnfoque(EnfoqueBE entidad)
        {
            return Enfoque.ActualizarEnfoque(entidad);
        }

        public static EnfoqueBE EliminarEnfoque(EnfoqueBE entidad)
        {
            return Enfoque.EliminarEnfoque(entidad);
        }

        public static List<EnfoqueBE> listarEnfoqueMedida(int medida)
        {
            return Enfoque.listarEnfoqueMedida(medida);
        }

        public static List<EnfoqueBE> listarEnfoqueIniciativa(int iniciativa)
        {
            return Enfoque.listarEnfoqueIniciativa(iniciativa);
        }

        public static EnfoqueBE ValidarMedidaEnfoque(EnfoqueBE entidad)
        {
            return Enfoque.ValidarMedidaEnfoque(entidad);
        }

        ////////////////////////////////////////////
        public static List<EnfoqueBE> ListarEnfoque()
        {
            return Enfoque.ListarEnfoque();
        }
    }

}
