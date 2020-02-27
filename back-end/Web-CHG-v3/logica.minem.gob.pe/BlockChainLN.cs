using entidad.minem.gob.pe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace logica.minem.gob.pe
{
    public class BlockChainLN
    {

        private readonly int _proofOfWorkDifficulty;
        private readonly double _miningReward;
        private List<IniciativaBE> _pendingTransactions;
        public List<BlockBE> Chain { get; set; }

        public BlockChainLN(int proofOfWorkDifficulty, int miningReward)
        {
            _proofOfWorkDifficulty = proofOfWorkDifficulty;
            _miningReward = miningReward;
            _pendingTransactions = new List<IniciativaBE>();
            Chain = new List<BlockBE> { CreateGenesisBlock() };
        }

        public void CreateTransaction(IniciativaBE transaction)
        {
            _pendingTransactions.Add(transaction);
        }

        public void MineBlock(string minerAddress)
        {
            IniciativaBE minerRewardTransaction = new IniciativaBE() { };
            _pendingTransactions.Add(minerRewardTransaction);
            BlockBE block = new BlockBE(DateTime.Now, _pendingTransactions);
            block.MineBlock(_proofOfWorkDifficulty);
            block.PreviousHash = Chain.Last().Hash;
            Chain.Add(block);
            _pendingTransactions = new List<IniciativaBE>();
        }

        public bool IsValidChain()
        {
            for (int i = 1; i < Chain.Count; i++)
            {
                BlockBE previousBlock = Chain[i - 1];
                BlockBE currentBlock = Chain[i];
                if (currentBlock.Hash != currentBlock.CreateHash())
                    return false;
                if (currentBlock.PreviousHash != previousBlock.Hash)
                    return false;
            }
            return true;
        }

        private BlockBE CreateGenesisBlock()
        {
            List <IniciativaBE> transactions  = new List<IniciativaBE>() { new IniciativaBE() { ID_INICIATIVA = 0 } };
            return new BlockBE(DateTime.Now, transactions, "0");
        }

    }
}
