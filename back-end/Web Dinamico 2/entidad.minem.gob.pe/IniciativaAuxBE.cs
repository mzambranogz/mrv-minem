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
        public string DESCRIPCION_ROL { get; set; }
        public DateTime FECHA_DERIVACION { get; set; }
        public string USUARIO { get; set; }
        public string EMAIL_USUARIO { get; set; }
        public string FECHA_EDITAR { get; set; }
        public string FECHA_EDITAR_FIN { get; set; }
        public string ASUNTO { get; set; }
        public int ID_ROL { get; set; }
        public string ID_INDICADOR_DELETE { get; set; }
        public string ID_INDICADOR_ELIMINAR { get; set; }
        public List<IndicadorBE> ListaIndicadores { get; set; }
        public List<IndicadorDataBE>ListaIndicadoresData { get; set; }
        public List<SustentoIniciativaBE> ListaSustentos { get; set; }
        public int medida_b { get; set; }
        public int anio_b { get; set; }
        public int sector_b { get; set; }
        public int gei_b { get; set; }
        public int energ_b { get; set; }
        public string EMAIL_USUARIO_ORIGEN { get; set; }
        public string CABECERA_EMAIL { get; set; }
        public int ID_ENFOQUE { get; set; }
        public string DATA { get; set; }
        public int ID_SECTOR_INST { get; set; }
        public decimal TOTAL_GEI { get; set; }
        public int ANNO { get; set; }
        public int CANTIDAD { get; set; }
        public int TOTAL_INSTITUCION { get; set; }
        public int TOTAL_REGION { get; set; }
        public string CONDICION { get; set; }
        public string ESTADO_BANDEJA { get; set; }
        public string NUMERO_MEDMIT { get; set; }
        public int ID_INDICADOR { get; set; }
        public string TIPO_INICIATIVA { get; set; }
        public string ID_INICIATIVA_MASIVO { get; set; }
        public string DIAS { get; set; }
        public int PLAZO { get; set; }
        public int DIAS_RESTANTES { get; set; }
        public int ID_ASIGNADO { get; set; }
        public string SALUDO { get; set; }
        public string CABECERA { get; set; }
        public int VALIDAR_RUTA { get; set; }
        public int ID_USUARIO_ADMIN { get; set; }
        public string OBSERVACIONES { get; set; }
        public string FECHA_OPERACIONES { get; set; }
        public string DESCRIPCION_GEI { get; set; }
        public string DESCRIPCION_ENERG { get; set; }
        public string BLOCKCHAIN { get; set; }
        public int ID_BLOCKCHAIN { get; set; }
        public int GENERADO_PDF { get; set; }
        public string NOMBRE_PDF { get; set; }
        public List<IniciativaBE> listaGeiAnno { get; set; }
    }
}
