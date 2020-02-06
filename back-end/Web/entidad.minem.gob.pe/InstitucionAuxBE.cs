using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class InstitucionBE
    {

        public InstitucionBE(int INSTIPO, string INSRUC, string INSNOMBRE, string INSDIRECCION)
        {
            this.INSTIPO = INSTIPO;
            this.INSRUC = INSRUC;
            this.INSNOMBRE = INSNOMBRE;
            this.INSDIRECCION = INSDIRECCION;
        }

        public int INSTIPO { get; set; }
        public string INSRUC { get; set; }
        public string INSNOMBRE { get; set; }
        public string INSDIRECCION { get; set; }
        public string SECTOR_INSTITUCION { get; set; }
    }

}
