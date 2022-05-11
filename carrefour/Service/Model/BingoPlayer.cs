using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carrefour.Service.Model
{
    public class BingoPlayer : BaseEntity
    {
        public string Name { get; set; }
        public string Number { get; set; }
        public int BingoId { get; set; }
        public int? Bingoed { get; set; }
        public int Order { get; set; }

        public virtual Bingo  Bingo { get; set; }
    }
}
