using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace entidad.minem.gob.pe
{
    public class BlockBE
    {
        private readonly DateTime _timeStamp;
        private long _nonce;

        public string PreviousHash { get; set; }
        public string Hash { get; private set; }

        public List<IniciativaBE> Transactions { get; set; }

        public BlockBE(DateTime timeStamp, List<IniciativaBE> transactions, string previousHash = "")
        {
            _timeStamp = timeStamp;
            _nonce = 0;
            Transactions = transactions;
            PreviousHash = previousHash;
            Hash = CreateHash();
        }


        public string CreateHash()
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                string rawData = PreviousHash + _timeStamp + Transactions + _nonce;
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                return Encoding.Default.GetString(bytes);
            }
        }

        public void MineBlock(int proofOfWorkDifficulty)
        {
            string hashValidationTemplate = new String('0', proofOfWorkDifficulty);

            while (Hash.Substring(0, proofOfWorkDifficulty) != hashValidationTemplate)
            {
                _nonce++;
                Hash = CreateHash();
            }
        }

    }
}
