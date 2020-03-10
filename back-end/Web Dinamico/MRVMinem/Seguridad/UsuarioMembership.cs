using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace MRVMinem.Seguridad
{
    public class UsuarioMembership : MembershipUser
    {
        public UsuarioBE usuario { get; set; }

        public UsuarioMembership(UsuarioBE us)
        {
            usuario = us;
        }

    }
}