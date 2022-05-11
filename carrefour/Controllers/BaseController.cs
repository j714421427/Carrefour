using Carrefour.Service;
using Microsoft.AspNetCore.Mvc;

namespace Carrefour.Controllers
{
    public class BaseController : Controller
    {
        public readonly Content _dbContent;
        public readonly UserService _UserService;
        public readonly ItemService _ItemService;
        public readonly BingoService _BingoService;
        public readonly ProductService _ProductService;
        public readonly OrderService _OrderService;

        public BaseController(Content db)
        {
            _dbContent = db;
            _UserService = new UserService(_dbContent);
            _ItemService = new ItemService(_dbContent);
            _BingoService = new BingoService(_dbContent);
            _ProductService = new ProductService(_dbContent);
            _OrderService = new OrderService(_dbContent);
        }
    }
}