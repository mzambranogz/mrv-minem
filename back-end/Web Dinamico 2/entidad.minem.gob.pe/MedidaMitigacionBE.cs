using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class MedidaMitigacionBE : BaseBE
    {
        public int ID_MEDMIT { get; set; }
        public string NUMERO_MEDMIT { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string DESCRIPCION_MEDMIT { get; set; }
        public int ID_NAMA { get; set; }
        public string OBJETIVO_MEDMIT { get; set; }
        public int ID_IPCC { get; set; }        
        public int ID_USUARIO { get; set; }
        public string IMAGEN_MEDMIT { get; set; }
        public string ADJUNTO { get; set; }
        public string ADJUNTO_BASE { get; set; }
        public string METODOLOGIA_MEDMIT { get; set; } //add

        //actualizado 23-04-2020
    }
}
