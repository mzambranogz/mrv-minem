﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class IndicadorMetaDataBE : BaseBE
    {
        public int ID_ENFOQUE { get; set; }
        public int ID_MEDMIT { get; set; }
        public int ID_PARAMETRO { get; set; }
        public int ORDEN { get; set; }
        public int ID_GRUPO_INDICADOR { get; set; }

    }
}
