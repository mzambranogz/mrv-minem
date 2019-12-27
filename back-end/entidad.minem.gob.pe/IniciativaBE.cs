using System;

namespace entidad.minem.gob.pe
{
    public class IniciativaBE : BaseBE
    {
        public int P_GENM_INICIATIVA { get; set; }
        public int F_GENM_MEDIDAMITIGACION { get; set; }
        public int P_MAE_USUARIO { get; set; }
        public string INICIATIVANOMBRE { get; set; }
        public string INICIATIVADESCRIPCION { get; set; }
        public DateTime INICIATIVAFECHACREACION { get; set; }
        public int F_MAE_ESTADO { get; set; }
        public char INICIATIVAPRIVACIDAD { get; set; }
        public double INICIATIVAINVERSION { get; set; }
        public int F_MAE_MONEDA { get; set; }
        public DateTime INICIATIVAFECHAIMPLEMENTACION { get; set; }
        public int F_GEND_METODOLOGIA { get; set; }
        public int F_MAE_ETAPA { get; set; }
    }
}
