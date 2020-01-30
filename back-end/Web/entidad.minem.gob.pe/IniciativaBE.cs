using System;

namespace entidad.minem.gob.pe
{
    public partial class IniciativaBE : BaseBE
    {
        public int ID_INICIATIVA { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ID_USUARIO { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public string DESC_INICIATIVA { get; set; }
        public int ID_ESTADO { get; set; }
        public DateTime FECHA_IMPLE_INICIATIVA { get; set; }
        public DateTime FECHA_FIN_INICIATIVA { get; set; }
        public DateTime FECHA_CREA_INICIATIVA { get; set; }
        public char PRIVACIDAD_INICIATIVA { get; set; }
        public char PRIVACIDAD_INVERSION { get; set; }
        public double INVERSION_INICIATIVA { get; set; }
        public int ID_MONEDA { get; set; }
        public int ID_METODOLOGIA { get; set; }
        public int ID_ETAPA { get; set; }
        public string FECHA { get; set; }
        public string FECHA_FIN { get; set; }
        public string ENERGETICO { get; set; }
        public string GEI { get; set; }
        public string UBICACION { get; set; }
    }
}
