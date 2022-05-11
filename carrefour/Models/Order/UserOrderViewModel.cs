using Carrefour.Service.Model;
using System.Collections.Generic;

namespace Carrefour.Models.Order
{
    public class UserOrderViewModel : ViewModel
    {
        public UserOrderViewModel() {
            User = new User();
            Items = new List<Item>();
        }

        public User User { get; set; }

        public List<Item> Items {get;set;}

        public string OutputContent { get; set; }
    }
}
