using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class IniciativaBE
    {
        public string NOMBRE_MEDMIT { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
        public int PROGRESO { get; set; }
        public string NOMBRES { get; set; }
        public string CORREO { get; set; }
        public string INSTITUCION { get; set; }
        public string DIRECCION { get; set; }
        public string SECTOR { get; set; }
        public string MONEDA { get; set; }
        public string DESCRIPCION { get; set; }
        public DateTime FECHA_DERIVACION { get; set; }
        public string USUARIO { get; set; }
        public string EMAIL_USUARIO { get; set; }
        public string FECHA_EDITAR { get; set; }
        public string ASUNTO { get; set; }
        public List<IndicadorBE> ListaIndicadores { get; set; }
        public List<SustentoIniciativaBE> ListaSustentos { get; set; }
    }
}
