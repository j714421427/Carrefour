using System.Collections.Generic;
using System.Linq;
using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;
using Microsoft.EntityFrameworkCore;

namespace Carrefour.Service
{
    public class UserService : BaseService<User>
    {
        public UserService(Content content) : base(content) { }

        public override void Update(User item)
        {
            var entity = _dbContent.Users.Find(item.Id);

            entity.Name = item.Name;

            _dbContent.Users.Update(entity);

            _dbContent.SaveChanges();
        }

        public IList<User> GetUserOrderData()
        {
            var users = _dbContent.Users.Include(i => i.Orders).ToList();

            users.ForEach(user =>
            {
                user.Orders = user.Orders.Where(o => o.ItemStatus == ItemStatus.Enabled || o.ItemStatus == ItemStatus.Disabled).ToList();
            });

            return users;
        }

        public User GetUserOrderDataById(int id)
        {
            var user = _dbContent.Users.Include(i => i.Orders).FirstOrDefault(x => x.Id == id);
            user.Orders = user.Orders.Where(o => o.ItemStatus == ItemStatus.Enabled || o.ItemStatus == ItemStatus.Disabled).ToList();

            return user;
        }
    }
}
