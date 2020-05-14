using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvReCAPTCHASettings: BaseBE
    {
        public string ReCAPTCHA_Site_Key { get; set; }
        public string ReCAPTCHA_Secret_Key { get; set; }
        public string USUARIO { get; set; }
        public string PASSWORD_USUARIO { get; set; }
        public string TOKEN { get; set; }
    }
}