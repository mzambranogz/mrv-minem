using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class FichaMinamBE
    {
        public int ID_MEDMIT { get; set; }
        public int ID_ENFOQUE { get; set; }
        //public int ID_INDICADOR { get; set; }
        public int ANNO { get; set; }
        public decimal BAU { get; set; }
        public decimal INI { get; set; }
        public decimal REDUCIDO { get; set; }
        public string TITULO_MEDIDA_MITIGACION { get; set; }
        public string SECTOR { get; set; }
        public string OBJETIVO { get; set; }
        public string DESCRIPCION { get; set; }
        public string UBICACION { get; set; }
        public string METODOLOGIA { get; set; }
        public string NOMBRE_ENFOQUE { get; set; }
        //===================================
        public int ID_REPORTE { get; set; }
        public string PERIODO { get; set; }
        public string MEDIDA_REDUCCION { get; set; }
        public string FECHAS_RELEVANTES { get; set; }
        public string EMISIONES_REDUCIDAS { get; set; }
        public string METODOLOGIA_APLICADA { get; set; }
        public string SISTEMA_MONITOREO { get; set; }
        public string ROL_RESPONSABILIDAD { get; set; }
        public string CALIBRACION_EQUIPO { get; set; }
        public string CALCULO_BAU { get; set; }
        public string CALCULO_MEDIDA { get; set; }
        public string CAMBIOS_GEI { get; set; }
        public decimal EMISIONES_TOTAL { get; set; }
        public string CO_BENEFICIO { get; set; }
        public string NOMBRE_MEDMIT { get; set; }
        public string DESCRIPCION_MEDMIT { get; set; }
        public string OBJETIVO_MEDMIT { get; set; }
        public string IPCC { get; set; }
    }
}
