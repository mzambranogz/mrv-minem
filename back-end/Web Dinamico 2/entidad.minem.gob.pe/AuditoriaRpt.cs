using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class AuditoriaRpt
    {
        public int ID_INICIATIVA { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string INSTITUCION { get; set; }
        public string NOMBRE_INICIATIVA { get; set; }
        public string FECHA_AUDITADA { get; set; }
        public decimal EMISION_AUDITADA { get; set; }
        public string FECHA_IMPLEMENTADA { get; set; }
        public decimal EMISION_IMPLEMENTADA { get; set; }
        public string FECHA_VERIFICADA { get; set; }
        public decimal EMISION_VERIFICADA { get; set; }
        public string FECHA_AUDITADA_FORMATO
        {
            get
            {
                string fecha = FECHA_AUDITADA == "-" ? "" : Convert.ToDateTime(FECHA_AUDITADA).ToString("dd/MM/yyyy");
                return fecha;
            }
        }

        public string FECHA_IMPLEMENTADA_FORMATO
        {
            get
            {
                string fecha = FECHA_IMPLEMENTADA == "-" ? "" : Convert.ToDateTime(FECHA_IMPLEMENTADA).ToString("dd/MM/yyyy");
                return fecha;
            }
        }

        public string FECHA_VERIFICADA_FORMATO
        {
            get
            {
                string fecha = FECHA_VERIFICADA == "-" ? "" : Convert.ToDateTime(FECHA_VERIFICADA).ToString("dd/MM/yyyy");
                return fecha;
            }
        }

    }
}
