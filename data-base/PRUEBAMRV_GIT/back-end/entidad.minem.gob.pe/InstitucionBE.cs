using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class InstitucionBE : BaseBE
    {
        public InstitucionBE(string RUC_INSTITUCION, string NOMBRE_INSTITUCION, string DIRECCION_INSTITUCION)
        {
            
            this.RUC_INSTITUCION = RUC_INSTITUCION;
            this.NOMBRE_INSTITUCION = NOMBRE_INSTITUCION;
            this.DIRECCION_INSTITUCION = DIRECCION_INSTITUCION;
        }

        public int ID_INSTITUCION { get; set; }
        public string RUC_INSTITUCION { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
        public string DIRECCION_INSTITUCION { get; set; }

    }
}
