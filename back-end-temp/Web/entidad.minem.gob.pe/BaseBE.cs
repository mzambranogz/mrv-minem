using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class BaseBE
    {
        public string USUARIO_REGISTRO { get; set; }
        public string IP_PC { get; set; }
        public DateTime FECHA_REGISTRO { get; set; }
        public string USUARIO_MODIFICA { get; set; }
        public DateTime FECHA_MODIFICA { get; set; }
        public string message { get; set; }
        public string extra { get; set; }
        public string accion { get; set; }
        public bool OK { get; set; }

        public int cantidad_registros { get; set; }
        public int total_paginas { get; set; }
        public int pagina { get; set; }
        public string order_by { get; set; }
        public string order_orden { get; set; }
        public int RowNumber { get; set; }
        public int total_registros { get; set; }
    }
}
