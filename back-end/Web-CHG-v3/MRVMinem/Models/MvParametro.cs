using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using entidad.minem.gob.pe;

namespace MRVMinem.Models
{
    public class MvParametro
    {
       public List<ParametroBE> listaParametro { get; set; }
        public List<TipoControlBE> listaControl { get; set; }
        public List<GrupoIndicadorBE> listaGrupo { get; set; }
        public List<MedidaMitigacionBE> listaMedida { get; set; }
        public List<FactorBE> listaFactor { get; set; }
        public List<ParametroIndicadorBE> listaParametroInd { get; set; }
        public List<FactorBE> listaMedidaFactor { get; set; }
        public List<VariableBE> listaVariable { get; set; }
        public int menor { get; set; }

    }
}