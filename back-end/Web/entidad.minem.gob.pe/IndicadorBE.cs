using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class IndicadorBE : BaseBE
    {
        public int ID_INDICADOR { get; set; }
        public int ID_ENFOQUE { get; set; }
        public int ID_VARIABLE { get; set; }
        public int ID_VARIANTE { get; set; }
        public int ID_FACTOR { get; set; }
        public string DESCRIPCION { get; set; }
        public int ID { get; set; }
        public string TIPO { get; set; }
        public int ORDEN { get; set; }
        public string SIGLA { get; set; }
        public int ID_MEDMIT { get; set; }
        public char ESTADO_ACTOR { get; set; }
        public int ID_ADMINISTRADOR { get; set; }
        public int ID_EVALUADOR { get; set; }
        public int ID_USUARIO_DESTINO { get; set; }
        //=======================================
        public int ID_INICIATIVA { get; set; }
        public int ANNOB { get; set; }
        public int ID_TIPO_VEHICULOB { get; set; }
        public int ID_TIPO_COMBUSTIBLEB { get; set; }
        public int KRVB { get; set; }
        public int CANTIDADB { get; set; }
        public int TOTALB { get; set; }
        public int ANNOI { get; set; }
        public int ID_TIPO_VEHICULOI { get; set; }
        public int ID_TIPO_FUENTEI { get; set; }
        public int KRVI { get; set; }
        public int CANTIDADI { get; set; }
        public int TOTALI { get; set; }
        public int TOTALR { get; set; }
        public decimal TOTAL_GEI_INIMIT { get; set; }
        public decimal TOTAL_GEI_REDUCIDO { get; set; }
        public decimal TOTAL_GEI_BASE { get; set; }
        public string ADJUNTO { get; set; }
        public string ADJUNTO_BASE { get; set; }


        public int ANNO_BASE { get; set; }
        public int ID_TIPO_VEHICULO_BASE { get; set; }
        public int ID_TIPO_COMBUSTIBLE_BASE { get; set; }
        public int KRV_BASE { get; set; }
        public int CANT_BASE { get; set; }

        public int ANNO_INIMIT { get; set; }
        public int ID_TIPO_VEHICULO_INIMIT { get; set; }
        public int ID_TIPO_FUENTE_INIMIT { get; set; }
        public int KRV_INIMIT { get; set; }
        public int CANT_INIMIT { get; set; }
        public double FACTOR_RENDIMIENTO { get; set; }
        public double F_RENDIMIENTO { get; set; }
        public int ID_USUARIO { get; set; }
        public int ID_ESTADO { get; set; }
        public string TIPO_VEHICULO { get; set; }
        public string TIPO_COMBUSTIBLE { get; set; }
        public double RENDIMIENTO { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public string EMAIL_USUARIO { get; set; }
    }
}
