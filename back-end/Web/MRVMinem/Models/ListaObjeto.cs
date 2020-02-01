using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using entidad.minem.gob.pe;

namespace MRVMinem.Models
{
    public class ListaObjeto
    {
        public int revision { get; set; }
        public IniciativaBE iniciativa_mit { get; set; }
        public List<IniciativaBE> listaIni { get; set; }
        public MedidaMitigacionBE medida { get; set; }
        public UsuarioBE usuario { get; set; }
        public List<IndicadorBE> listaIndicador { get; set; }
        public List<UbicacionBE> listaUbicacion { get; set; }
        public List<EnergeticoBE> listaEnergetico { get; set; }
        public List<GasEfectoInvernaderoBE> listaGei { get; set; }
    }
}