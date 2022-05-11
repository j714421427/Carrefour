using System.ComponentModel.DataAnnotations;
using Carrefour.Service.Model.Enum;

namespace Carrefour.Service.Model
{
    public class Item : BaseEntity
    {
        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(200)]
        public string Url { get; set; }

        [StringLength(200)]
        public string ImgSrc { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }

        public int UserId { get; set; }

        public ItemStatus ItemStatus { get; set; }


    }
}
