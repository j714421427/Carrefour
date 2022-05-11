using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Carrefour.Service.Model.Enum;
using Newtonsoft.Json;

namespace Carrefour.Service.Model
{
    public class Product
    {
        /// <summary>
        /// Product Name
        /// </summary>
        [Key]
        public long Id { get; set; }

        /// <summary>
        /// Product Name
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Base Price
        /// </summary>
        [JsonProperty(propertyName: "base_price")]
        public decimal BasePrice { get; set; }

        /// <summary>
        /// Product Price
        /// </summary>
        public decimal Price { get; set; }

        /// <summary>
        /// Product Brand
        /// </summary>
        public string Brand { get; set; }

        /// <summary>
        /// Product Variant
        /// </summary>
        public string Variant { get; set; }

        /// <summary>
        /// Product Number
        /// </summary>
        public short Number { get; set; }

        /// <summary>
        /// Product Image url
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// Product Status
        /// </summary>
        public ItemStatus Status { get; set; } = ItemStatus.Enabled;

        public virtual ICollection<Order> Orders { get; set; }
    }
}