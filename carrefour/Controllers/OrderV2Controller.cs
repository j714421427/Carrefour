using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using Carrefour.Models.Order;
using Carrefour.Service;
using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Carrefour.Controllers
{
    public class OrderV2Controller : BaseController
    {
        public OrderV2Controller(Content db) : base(db)
        {
        }

        public IActionResult Main()
        {
            return View();
        }

        public KeyValuePair<long, ProductData> GetProductDetail(string productUrl)
        {
            try
            {
                var regexSrc = new Regex("^[0-9]{1,}$");
                var productSrc = productUrl;
                var productId = default(long);
                if (regexSrc.Match(productUrl).Success)
                {
                    productSrc = $"https://online.carrefour.com.tw/tw/{productUrl}";
                    productId = long.Parse(productUrl);
                }
                var web = new HtmlWeb();
                var doc = web.Load(productSrc);

                var selectScript = @"//*[@type=""application/ld+json""]";
                var productNode = doc.DocumentNode.SelectNodes(selectScript);
                var productDetailNode = doc.DocumentNode.SelectNodes($"{selectScript}/following::script[1]");

                if (productNode != null && productDetailNode != null)
                {
                    var productJson = JsonConvert.DeserializeObject<JObject>(productNode.Select(x => x.InnerHtml).FirstOrDefault());
                    var productName = productJson["name"];
                    var imageUrl = productJson["image"][0];

                    Regex regex = new Regex("pageViariablesProductShow = {.*.}");
                    var productDetailJson = regex.Matches(productDetailNode.Select(x => x.InnerHtml).FirstOrDefault())[0].Value.Replace("pageViariablesProductShow = ", string.Empty);

                    var productDetail = JsonConvert.DeserializeObject<JObject>(productDetailJson)["ecommerce"]["detail"]["products"][0];
                    var product = productDetail.ToObject<Product>();

                    // 1Pack包 x 1
                    // 355ml毫升x 4
                    // 1Box盒 x 1 
                    if (product.Variant.Split("x ").Length > 1)
                    {
                        var variant = product.Variant;
                        product.Variant = variant.Split("x ")[0].Trim();
                        product.Number = short.Parse(variant.Split("x ")[1]);
                    }

                    product.Name = productName.ToString();
                    product.Image = imageUrl.ToString();

                    if (_ProductService.AddProduct(product))
                    {
                        return new KeyValuePair<long, ProductData>(
                            product.Id,
                            new ProductData
                            {
                                Name = product.Name,
                                BasePrice = product.BasePrice,
                                Price = product.Price,
                                Brand = product.Brand,
                                Variant = product.Variant,
                                Number = product.Number,
                                ImgSrc = product.Image,
                                Status = product.Status,
                            });
                    }
                }
                else if (productId > 0)
                {
                    var product = new Product
                    {
                        Id = productId,
                        Status = ItemStatus.Disabled,
                    };

                    _ProductService.AddProduct(product);
                    _OrderService.removerOrdersByProductId(productId);
                }

                return default;
            }
            catch (Exception)
            {
                return default;
            }
        }

        public IList<UserData> GetUserData()
        {
            return this._UserService.GetUserOrderData().Select(c => new UserData
            {
                Id = c.Id,
                Name = c.Name,
                Orders = c.Orders
                    .Select(o => new OrderData
                    {
                        ProductId = o.ProductId,
                        Quantity = o.Quantity,
                        ItemStatus = o.ItemStatus
                    }).ToList()
            }).ToList();
        }

        public Dictionary<long, ProductData> GetProductData()
        {
            return this._ProductService.GetProductDataByOrder()
                .ToDictionary(p => p.Id, p => new ProductData
                {
                    Name = p.Name,
                    BasePrice = p.BasePrice,
                    Price = p.Price,
                    Brand = p.Brand,
                    Variant = p.Variant,
                    Number = p.Number,
                    ImgSrc = p.Image,
                    Status = p.Status,
                });
        }

        public bool AddOrder(int userId, long productId)
        {
            return this._OrderService.AddOrder(new Order
            {
                UserId = userId,
                ProductId = productId,
                Quantity = 1,
                ItemStatus = ItemStatus.Enabled,
            });
        }

        public bool RemoveOrder(int userId, long productId)
        {
            return this._OrderService.AddOrder(new Order
            {
                UserId = userId,
                ProductId = productId,
                Quantity = 1,
                ItemStatus = ItemStatus.Suspend,
            });
        }

        public bool UpdateOrders([FromQuery] int userId, [FromBody] IList<Order> orders)
        {
            orders = orders.Select(o => { o.UserId = userId; return o; }).ToList();

            return this._OrderService.UpdateOrders(orders);
        }
    }
}
