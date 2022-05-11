using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Carrefour.Models.Users;
using Carrefour.Service;
using Microsoft.AspNetCore.Mvc;

namespace Carrefour.Controllers
{
    public class UserController : BaseController
    {
        public UserController(Content db) : base(db)
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
            if(id != 0)
            {
                result.User = _UserService.GetById(id);
            }

            return View("_Detail",result);
        }

        public IActionResult Save(UserSaveViewModel model)
        {

            //add or save
            if(model.User.Id > 0)
            {
                _UserService.Update(model.User);
            }
            else
            {
                _UserService.Add(model.User);
            }


            return Main();
        }
    }
}