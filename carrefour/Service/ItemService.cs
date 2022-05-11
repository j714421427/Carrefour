using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;
using System.Collections.Generic;
using System.Linq;

namespace Carrefour.Service
{
    public class ItemService : BaseService<Item>
    {
        public ItemService(Content content) : base(content) { }

        public IEnumerable<Item> GetItemsByUserId(int userId)
        {
            return _dbContent.Items.Where(q => q.UserId == userId).ToList();
        }

        public void ResetItems(int userId, List<Item> newItmes)
        {
            var oldItems = GetItemsByUserId(userId);
            _dbContent.Items.RemoveRange(oldItems);
            _dbContent.Items.AddRange(newItmes);
            _dbContent.SaveChanges();
        }

        public IEnumerable<Item> GetEnabledItems()
        {
            return _dbContent.Items.Where(q => new List<ItemStatus> { ItemStatus.Enabled }.Contains(q.ItemStatus));
        }
    }
}
