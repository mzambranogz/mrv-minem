﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class IniciativaBE
    {
        public string NOMBRE_MEDMIT { get; set; }
        public string NOMBRE_INSTITUCION { get; set; }
        public int PROGRESO { get; set; }
        public string NOMBRES { get; set; }
        public string CORREO { get; set; }
        public string INSTITUCION { get; set; }
        public string DIRECCION { get; set; }
        public string SECTOR { get; set; }
        public string MONEDA { get; set; }
        public string DESCRIPCION { get; set; }
        public DateTime FECHA_DERIVACION { get; set; }
        public string USUARIO { get; set; }
        public string EMAIL_USUARIO { get; set; }
        public string FECHA_EDITAR { get; set; }
        public string FECHA_EDITAR_FIN { get; set; }
        public string ASUNTO { get; set; }
        public int ID_ROL { get; set; }
        public string ID_INDICADOR_DELETE { get; set; }
        public string ID_INDICADOR_ELIMINAR { get; set; }
        public List<IndicadorBE> ListaIndicadores { get; set; }
        public List<SustentoIniciativaBE> ListaSustentos { get; set; }
        public int medida_b { get; set; }
        public int anio_b { get; set; }
        public int sector_b { get; set; }
        public int gei_b { get; set; }
        public int energ_b { get; set; }
        public string EMAIL_USUARIO_ORIGEN { get; set; }
        public string CABECERA_EMAIL { get; set; }
    }
}
