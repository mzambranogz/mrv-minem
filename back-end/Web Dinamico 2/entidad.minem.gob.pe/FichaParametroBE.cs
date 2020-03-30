using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class FichaParametroBE
    {
        public int ID_MEDMIT { get; set; }
        public int ID_ENFOQUE { get; set; }
        public int ID_PARAMETRO { get; set; }
        public string NOMBRE_PARAMETRO { get; set; }
        public int DESCRIPCION_UNIDAD { get; set; }
        public string COMBINACION_UNIDAD { get; set; }
        public string DESCRIPCION_PARAMETRO { get; set; }
        public string LEYENDA_PARAMETRO { get; set; }
        public string DESCRIPCION_METODOLOGIA { get; set; }
        public string PROCEDIMIENTO { get; set; }
        public string CONTROL_CALIDAD { get; set; }
        public string ASEGURAMIENTO_CALIDAD { get; set; }
        public string PROPOSITO { get; set; }
        public string FRECUENCIA { get; set; }
        public string COMPORTAMIENTO { get; set; }
        public string VALOR { get; set; }
        public string FORMULA { get; set; }
        public string FORMULA_ARMADO { get; set; }

    }
}
