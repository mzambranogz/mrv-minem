using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class IndicadorDataBE
    {
        public int ID_TIPO_CONTROL { get; set; }
        public int ID_TIPO_DATO { get; set; }
        public int ID_COLOR_INDICADOR { get; set; }
        public int VERIFICABLE { get; set; }
        public string DESCRIPCION { get; set; }
        public string FORMULA { get; set; }
        public string VISIBLE { get; set; }
        public string ENERGIA_TOTAL { get; set; }
        public string VALIDAR_IMPLEMENTADO { get; set; }
        public string VALIDAR_FECHA_IMPLEM { get; set; }
        public string VALIDAR_VERIFICACION { get; set; }
        public string VALIDAR_FECHA_VERIFI { get; set; }
        public List<IndicadorDataBE> listaInd { get; set; }
        public List<ParametroBE> listaParam { get; set; }
        public List<FactorBE> listaFactor { get; set; }
        public List<int> id_factores { get; set; }
        public IndicadorArchivoBE ArchivoSustento { get; set; }
        public List<AcumuladoBE> listaAcumulado { get; set; }
    }
}
