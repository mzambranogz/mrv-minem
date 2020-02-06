using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MRVMinem.Models
{
    public class MvUbicacion
    {
        public int IdUbicacion { get; set; }
        public List<UbicacionBE> ListaUbicacion{ get; set; }
    }
}