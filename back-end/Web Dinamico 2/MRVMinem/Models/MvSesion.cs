using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using entidad.minem.gob.pe;

namespace MRVMinem.Models
{
    public class MvSesion
    {
        public int identificador { get; set; }
        public int iniciativa { get; set; }
        public int revision { get; set; }
        public int detalle { get; set; }
        public List<TipoIniciativaBE> listaTipoIniciativa { get; set; }

        public string ReCAPTCHA_Site_Key { get; set; }
        public string ReCAPTCHA_Secret_Key { get; set; }
        public string TOKEN { get; set; }
    }
}