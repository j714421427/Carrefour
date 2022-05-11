using Carrefour.Service.Model;
using System.Collections.Generic;

namespace Carrefour.Models.Order
{
    public class UserOrderSaveViewModel
    {
        public UserOrderSaveViewModel()
        {
            Items = new List<Item>();
        }

        public int UserId { get; set; }

        public List<Item> Items { get; set; }
    }
}
