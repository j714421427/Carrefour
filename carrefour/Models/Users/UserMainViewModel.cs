using Carrefour.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carrefour.Models.Users
{
    public class UserMainViewModel : ViewModel
    {
        public List<User> Users { get; set; }
    }
}
