using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public partial class BlockChainBE: BaseBE
    {
        public int ID_BLOCKCHAIN { get; set; }
        public int ID_INICIATIVA { get; set; }
        public string HASH { get; set; }

    }
}
