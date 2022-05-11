using Carrefour.Service.Model;

namespace Carrefour.Models.Users
{
    public class UserDetailViewModel :ViewModel
    {
        public UserDetailViewModel()
        {
            User = new User();
        }

        public User User { get; set; }
    }
}
