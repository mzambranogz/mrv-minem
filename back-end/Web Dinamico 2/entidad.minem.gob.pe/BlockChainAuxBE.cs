using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class BlockChainBE
    {
        public int ID_MEDMIT { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public int ID_USUARIO { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public double INVERSION_INICIATIVA { get; set; }
        public int ID_MONEDA { get; set; }
        public DateTime FECHA_CREA_INICIATIVA { get; set; }
        public DateTime FECHA_IMPLE_INICIATIVA { get; set; }
        public DateTime FECHA_FIN_INICIATIVA { get; set; }
        public string RESPONSABLE { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
    }
}
