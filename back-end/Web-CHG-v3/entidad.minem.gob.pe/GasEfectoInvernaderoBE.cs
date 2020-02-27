using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class GasEfectoInvernaderoBE : BaseBE
    {
        public int ID_GEI { get; set; }
        public string DESCRIPCION { get; set; }
        public double AR2 { get; set; }
        public double AR4 { get; set; }
        public double AR5 { get; set; }
        public double AR6 { get; set; }
        public string FLAG_ESTADO { get; set; }
    }         
    
}
