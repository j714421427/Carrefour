using System.Collections.Generic;

namespace Carrefour.Service.Model
{
    public class User : BaseEntity
    {
        public string Name { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
