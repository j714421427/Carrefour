using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Carrefour.Models.Users;
using Carrefour.Service;
using Carrefour.Service.Model.Enum;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Carrefour.Controllers
{
    public class BingoController : BaseController
    {
        public BingoController(Content db) : base(db)
        {
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Main()
        {
            var result = new UserMainViewModel();
            result.Users = _UserService.GetAll().ToList();
            return View("Main", result);
        }
        public IActionResult Get(int id)
        {
            var result = new UserDetailViewModel();
            if (id != 0)
            {
                result.User = _UserService.GetById(id);
            }

            return View("_Detail", result);
        }

        public IActionResult Save(UserSaveViewModel model)
        {

            //add or save
            if (model.User.Id > 0)
            {
                _UserService.Update(model.User);
            }
            else
            {
                _UserService.Add(model.User);
            }


            return Main();
        }

        public JsonResult Bingo(string name)
        {
            var bingo = _BingoService.GetBingo();

            return Json(bingo, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });
        }

        public void Ready(string name, List<int> numbers, int level)
        {
            var bingo = _BingoService.GetBingo();

            if (bingo == null)
            {
                bingo = _BingoService.ReadyBingo(name, level);
            }

            if (bingo.Level != level)
            {
                throw new Exception("錯誤啦 bug膩");
            }

            _BingoService.AddPlayer(bingo.Id, name, numbers);
        }

        public void Number(int id, int number)
        {
            _BingoService.SendNumber(id, number);
        }

        public void UpdateStatus(BingoStatus status)
        {
            var bingo = _BingoService.GetBingo();

            if (bingo != null)
            {
                _BingoService.UpdateStatus(bingo.Id, status);
            }
        }
    }
}