using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class InstitucionBE : BaseBE
    {
        public InstitucionBE() { }

        public int ID_INSTITUCION { get; set; }
        public int ID_SECTOR_INSTITUCION { get; set; }
        public string RUC_INSTITUCION { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
        public string DIRECCION_INSTITUCION { get; set; }
        public string FLAG_ESTADO { get; set; }
    }
}
