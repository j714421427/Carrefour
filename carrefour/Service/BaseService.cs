using Carrefour.Service.Model;
using System.Collections.Generic;

namespace Carrefour.Service
{
    public class BaseService<T>
        where T : class, IEntity
    {
        internal readonly Content _dbContent;

        public BaseService(Content content)
        {
            _dbContent = content;
        }

        public IEnumerable<T> GetAll()
        {
            return _dbContent.Set<T>();
        }

        public T GetById(int id)
        {
            return _dbContent.Set<T>().Find(id);
        }

        public void Add(T item)
        {
            _dbContent.Set<T>().Add(item);

            _dbContent.SaveChanges();
        }

        public virtual void Update(T item)
        {
            _dbContent.Set<T>().Update(item);

            _dbContent.SaveChanges();
        }

        public void Delete(T item)
        {
            _dbContent.Set<T>().Remove(item);

            _dbContent.SaveChanges();
        }

        public void AddRange(IEnumerable<T> items)
        {
            _dbContent.Set<T>().AddRange(items);

            _dbContent.SaveChanges();
        }

        public void DeleteRange(IEnumerable<T> items)
        {
            _dbContent.Set<T>().RemoveRange(items);

            _dbContent.SaveChanges();
        }
    }
}
