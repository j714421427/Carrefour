using System.Collections.Generic;
using System.Linq;
using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;

namespace Carrefour.Service
{
    public class OrderService
    {
        internal readonly Content _dbContent;

        public OrderService(Content content)
        {
            _dbContent = content;
        }

        public bool AddOrder(Order order)
        {
            if (_dbContent.Orders.Any(o => o.UserId == order.UserId && o.ProductId == order.ProductId))
            {
                _dbContent.Orders.Update(order);
                _dbContent.SaveChanges();
            }
            else
            {
                _dbContent.Orders.Add(order);
                _dbContent.SaveChanges();
            }

            return true;
        }

        public bool UpdateOrders(IList<Order> orders)
        {
            _dbContent.Orders.UpdateRange(orders);
            _dbContent.SaveChanges();

            return true;
        }

        public bool RemoveOrder(Order order)
        {
            if (_dbContent.Orders.Any(o => o.UserId == order.UserId && o.ProductId == order.ProductId))
            {
                _dbContent.Orders.Update(order);
                _dbContent.SaveChanges();
            }

            return true;
        }

        public bool removerOrdersByProductId(long productId)
        {
            var orders = _dbContent.Orders.Where(o => o.ProductId == productId).ToList();
            if (orders.Any())
            {
                orders = orders.Select(o =>
                {
                    o.ItemStatus = ItemStatus.Suspend;
                    return o;
                }).ToList();

                _dbContent.Orders.UpdateRange(orders);
                _dbContent.SaveChanges();
            }

            return true;
        }
    }
}
