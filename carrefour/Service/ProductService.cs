using System.Collections.Generic;
using System.Linq;
using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;
using Microsoft.EntityFrameworkCore;

namespace Carrefour.Service
{
    public class ProductService
    {
        internal readonly Content _dbContent;

        public ProductService(Content content)
        {
            _dbContent = content;
        }

        public IEnumerable<Product> GetProductData()
        {
            return _dbContent.Products.Select(p => p);
        }

        public IEnumerable<Product> GetProductDataByOrder()
        {
            return _dbContent.Products.Include(i => i.Orders)
                .Where(p => p.Status == ItemStatus.Enabled && p.Orders.Any(o => o.ItemStatus == ItemStatus.Enabled || o.ItemStatus == ItemStatus.Disabled));
        }

        public bool AddProduct(Product product)
        {
            if (_dbContent.Products.Any(x => x.Id == product.Id))
            {
                _dbContent.Products.Update(product);
                _dbContent.SaveChanges();
            }
            else
            {
                _dbContent.Products.Add(product);
                _dbContent.SaveChanges();
            }

            return true;
        }
    }
}
