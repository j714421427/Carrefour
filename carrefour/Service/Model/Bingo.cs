using Carrefour.Service.Model.Enum;
using System;
using System.Collections.Generic;

namespace Carrefour.Service.Model
{
    public class Bingo : BaseEntity
    {
        public string Leader { get; set; }

        public string Player { get; set; }

        public int Level { get; set; }

        public string Number { get; set; }

        public BingoStatus Status { get; set; }

        public DateTime StartAt { get; set; }

        public virtual ICollection<BingoPlayer>  Players { get; set; }
    }
}
