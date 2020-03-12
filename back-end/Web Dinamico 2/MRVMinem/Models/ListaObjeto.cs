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
        public int menor { get; set; }
        public IniciativaBE iniciativa_mit { get; set; }
        public List<IniciativaBE> listaIni { get; set; }
        public MedidaMitigacionBE medida { get; set; }
        public UsuarioBE usuario { get; set; }
        public int detalle { get; set; }
        public string id_enfoques { get; set; }
        public string id_factores { get; set; }
        public int identificador { get; set; }
        public List<IndicadorBE> listaIndicador { get; set; }
        public List<UbicacionBE> listaUbicacion { get; set; }
        public List<EnergeticoBE> listaEnergetico { get; set; }
        public List<GasEfectoInvernaderoBE> listaGei { get; set; }
        public List<UsuarioBE> listaUsuario { get; set; }
        public List<EnfoqueBE> listaEnfoque { get; set; }
        public List<ParametroBE> listaParametro { get; set; }
        public List<IndicadorDataBE> listaIndData { get; set; }
        public List<TipoIniciativaBE> listaTipoIniciativa { get; set; }
    }
}