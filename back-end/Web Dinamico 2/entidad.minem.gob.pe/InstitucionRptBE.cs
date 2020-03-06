using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class InstitucionRptBE
    {
        public int ID_INICIATIVA { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string DESCRIPCION { get; set; }
        public double GEI_TOTAL { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ID_SECTOR_INST { get; set; }

    }
}
