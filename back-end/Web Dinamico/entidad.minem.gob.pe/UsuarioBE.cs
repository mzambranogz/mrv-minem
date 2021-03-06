﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class UsuarioBE : BaseBE
    {
        public int ID_USUARIO { get; set; }
        public string EMAIL_USUARIO { get; set; }
        public string NOMBRES_USUARIO { get; set; }
        public String APELLIDOS_USUARIO{ get; set; }
        public string PASSWORD_USUARIO { get; set; }
        public string TELEFONO_USUARIO { get; set; }
        public string ANEXO_USUARIO { get; set; }
        public string CELULAR_USUARIO { get; set; }
        public int ID_SECTOR_INST { get; set; }
        public int ID_INSTITUCION { get; set; }
        public int ID_ESTADO_USUARIO { get; set; }
        public int ID_ESTADO_ANTERIOR { get; set; }
        public string ADJUNTO { get; set; }
        public string ADJUNTO_BASE { get; set; }
        public string SECTOR { get; set; }
        public string RUC { get; set; }
        public string USUARIO { get; set; }
        public char TERMINOS { get; set; }
        public string NOMBRES { get; set; }
        public string CORREO { get; set; }
        public string INSTITUCION { get; set; }
        public string DIRECCION { get; set; }
        public int ID_ROL { get; set; }
        public string ROL { get; set; }
        public string ESTADO { get; set; }
        public string NUEVO_PASSWORD_USUARIO { get; set; }
        public string ICONO_ESTADO { get; set; }
        public string PRIMER_INICIO { get; set; }
    }
}
