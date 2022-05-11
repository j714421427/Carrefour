using System.ComponentModel.DataAnnotations.Schema;
using Carrefour.Service.Model.Enum;

namespace Carrefour.Service.Model
{
    public class Order
    {
        [ForeignKey("FK_Orders_Users")]
        public int UserId { get; set; }

        public virtual User User { get; set; }

        [ForeignKey("FK_Orders_Products")]
        public long ProductId { get; set; }

        public virtual Product Product { get; set; }

        public short Quantity { get; set; }

        /// <summary>
        /// Product Status
        /// </summary>
        public ItemStatus ItemStatus { get; set; } = ItemStatus.Enabled;
    }
}
