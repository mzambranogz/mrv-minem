using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using entidad.minem.gob.pe;

namespace MRVMinem.Models
{
    public class MvUsuario
    {
        List<UsuarioBE> ListaUsuario { get; set; }
        UsuarioBE usuario { get; set; }
    }
}