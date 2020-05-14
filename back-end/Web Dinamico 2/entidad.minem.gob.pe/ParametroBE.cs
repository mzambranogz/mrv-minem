using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class ParametroBE : BaseBE
    {
        public int ID_ENFOQUE { get; set; }
        public int ID_ORDEN { get; set; }
        public int ID_PARAMETRO { get; set; }
        public int ID_TIPO_DATO { get; set; }
        public int ID_DETALLE { get; set; }
        public string NOMBRE_PARAMETRO { get; set; }
        public int ID_GRUPO_INDICADOR { get; set; }
        public string COLOR_GRUPO { get; set; }
        public int EDITABLE { get; set; }
        public int VERIFICABLE { get; set; }
        public string LEYENDA_PARAMETRO { get; set; }
        public string DESCRIPCION_METODOLOGIA { get; set; }
        public string PROCEDIMIENTO { get; set; }
        public string CONTROL_CALIDAD { get; set; }
        public string ASEGURAMIENTO_CALIDAD { get; set; }
        public string PROPOSITO { get; set; }
        public string FRECUENCIA { get; set; }
        public List<ParametroDetalleBE> listaDetalle { get; set; }
    }
}
