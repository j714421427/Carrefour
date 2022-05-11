using System.Collections.Generic;
using Carrefour.Service.Model.Enum;

namespace Carrefour.Models.Order
{
    public class UserData
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public IList<OrderData> Orders { get; set; }
    }

    public class OrderData
    {
        public long ProductId { get; set; }

        public int Quantity { get; set; }

        public ItemStatus ItemStatus { get; set; }
    }
}


