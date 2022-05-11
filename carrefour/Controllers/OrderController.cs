using System;
using System.Linq;
using System.Text;
using Carrefour.Extension;
using Carrefour.Models.Order;
using Carrefour.Service;
using Carrefour.Service.Model;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Carrefour.Controllers
{
    public class OrderController : BaseController
    {
        public OrderController(Content db) : base(db)
        {
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Main()
        {
            var result = new OrderMainViewModel();
            result.Users = _UserService.GetAll().ToList();
            return View(result);
        }

        public IActionResult Order()
        {
            return View();
        }

        public IActionResult Detail(int userId)
        {
            var result = new UserOrderViewModel();

            result.User = _UserService.GetById(userId);

            result.Items = _ItemService.GetItemsByUserId(userId).ToList();

            var outputContent = new StringBuilder();

            foreach (var item in result.Items.Where(q => q.ItemStatus == Service.Model.Enum.ItemStatus.Enabled))
            {
                outputContent.Append($"{item.Quantity} 份 :{item.Name}\n{item.Url}\n\n");
            }

            result.OutputContent = outputContent.ToString();

            return PartialView("_Detail", result);
        }

        public void Save(UserOrderSaveViewModel model)
        {
            try
            {
                if (model.Items.Select(s => s.Quantity).Any(a => a <= 0))
                {
                    throw new ArgumentOutOfRangeException("model.Quantity", "Quantity Negative");
                }

                var newItems = model.Items.Select(s => new Item()
                {
                    Name = s.Name,
                    Url = s.Url,
                    Quantity = s.Quantity,
                    UserId = model.UserId,
                    ItemStatus = s.ItemStatus,
                    ImgSrc = s.ImgSrc,
                }).ToList();

                _ItemService.ResetItems(model.UserId, newItems);
            }
            catch (Exception ex)
            {
                LogHelper.WriteLog(JsonConvert.SerializeObject(model));
                LogHelper.WriteLog(ex.ToString());

                throw;
            }
        }

        public OrderOutputViewModel Output()
        {
            var result = new OrderOutputViewModel();

            result.Items = _ItemService.GetEnabledItems()
                .GroupBy(g => g.Url)
                .Select(s => new Item
                {
                    Name = s.FirstOrDefault().Name,
                    Url = s.Key,
                    Quantity = s.Sum(m => m.Quantity),
                })
                .ToList();

            return result;
        }

        public GetBackViewModel GetBack(string carrefourUrl)
        {
            var result = new GetBackViewModel();

            try
            {
                using (System.Net.WebClient client = new System.Net.WebClient())
                {
                    var ㄐㄌㄈulr = "https://online.carrefour.com.tw";
                    var web = new HtmlWeb();
                    var doc = web.Load(carrefourUrl);

                    var nod = doc.DocumentNode.SelectNodes(@"//div[@id=""photo-ex1""]/img");

                    if (nod != null)
                    {
                        var data = nod.Select(s => s.InnerText).FirstOrDefault().Split("\n").Where(x => !string.IsNullOrEmpty(x)).ToList();
                        result.Name = data[0];
                    }

                    nod = doc.DocumentNode.SelectNodes(@"//div[@id=""photo-ex1""]/img");

                    if (nod != null)
                    {
                        result.Image = ㄐㄌㄈulr + nod[0].Attributes.Where(q => q.Name == "src").Select(s => s.Value).FirstOrDefault();
                    }
                }
            }
            catch
            {
            }

            return result;
        }
    }
}