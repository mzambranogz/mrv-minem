using datos.minem.gob.pe;
using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public static class BlockChainLN
    {
        private static BlockChainDA blochainDA = new BlockChainDA();

        public static BlockChainBE GeneraBlockChain(BlockChainBE entidad)
        {
            return blochainDA.GeneraBlockChain(entidad);
        }

        public static List<BlockChainBE> ListaBlockChain(BlockChainBE entidad)
        {
            return blochainDA.ListaBlockChain(entidad);
        }
    }
}
