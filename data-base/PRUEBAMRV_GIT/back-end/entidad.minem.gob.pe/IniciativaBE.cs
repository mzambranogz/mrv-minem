using System;
/*PROBANDO SI GUARD TODOD ESTO DE ACA CON FE*/
namespace entidad.minem.gob.pe
{
    public class IniciativaBE : BaseBE
    {
        public int ID_INICIATIVA { get; set; }
        public int F_GENM_MEDIDAMITIGACION { get; set; }
        public int P_MAE_USUARIO { get; set; }
        public string INICIATIVA_NOMBRE { get; set; }
        public string INICIATIVADESCRIPCION { get; set; }
        public DateTime INICIATIVA_FECHA { get; set; }
        public int F_MAE_ESTADO { get; set; }
        public char INICIATIVAPRIVACIDAD { get; set; }
        public double INICIATIVAINVERSION { get; set; }
        public int F_MAE_MONEDA { get; set; }
        public DateTime INICIATIVAFECHAIMPLEMENTACION { get; set; }
        public int F_GEND_METODOLOGIA { get; set; }
        public int F_MAE_ETAPA { get; set; }
        //===========================================
        public int PROGRESO { get; set; }
        public string MEDIDA_MITIGACION { get; set; }
        public string ENTIDAD { get; set; }
        public string FECHA { get; set; }
    }
}
