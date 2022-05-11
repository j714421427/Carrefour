using Carrefour.Service.Model.Enum;

namespace Carrefour.Models.Order
{
    public class ProductData
    {
        public string Name { get; set; }

        public decimal BasePrice { get; set; }

        public decimal Price { get; set; }

        public string Brand { get; set; }

        public string Variant { get; set; }

        public short Number { get; set; }

        public string ImgSrc { get; set; }

        public ItemStatus Status { get; set; }
    }
}

