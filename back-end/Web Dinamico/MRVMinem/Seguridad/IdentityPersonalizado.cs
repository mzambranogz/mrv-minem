using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

namespace MRVMinem.Seguridad
{
    public class IdentityPersonalizado : IIdentity
    {
        public string AuthenticationType
        {
            get
            {
                return Identity.AuthenticationType;
                //throw new NotImplementedException();
            }
        }

        public bool IsAuthenticated
        {
            get
            {
                return Identity.IsAuthenticated;
                //throw new NotImplementedException();
            }
        }

        public string Name
        {
            get
            {
                return usuario.NOMBRES_USUARIO;
                //throw new NotImplementedException();
            }
        }

        public UsuarioBE usuario { get; set; }

        public IIdentity Identity { get; set; }

        public IdentityPersonalizado(IIdentity identity)
        {
            this.Identity = identity;
            var us = Membership.GetUser(identity.Name) as UsuarioMembership;

            usuario = us.usuario;
        }
    }
}