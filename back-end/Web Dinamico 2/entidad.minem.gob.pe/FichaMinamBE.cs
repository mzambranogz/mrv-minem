using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class FichaMinamBE
    {
        public int ID_MEDMIT { get; set; }
        public int ID_ENFOQUE { get; set; }
        //public int ID_INDICADOR { get; set; }
        public int ANNO { get; set; }
        public decimal BAU { get; set; }
        public decimal INI { get; set; }
        public decimal REDUCIDO { get; set; }
        public string TITULO_MEDIDA_MITIGACION { get; set; }
        public string SECTOR { get; set; }
        public string OBJETIVO { get; set; }
        public string DESCRIPCION { get; set; }
        public string UBICACION { get; set; }
        public string METODOLOGIA { get; set; }
        public string NOMBRE_ENFOQUE { get; set; }
    }
}
