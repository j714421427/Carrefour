using Carrefour.Service.Model;
using Carrefour.Service.Model.Enum;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Carrefour.Service
{
    public class BingoService : BaseService<Bingo>
    {
        public BingoService(Content content) : base(content) { }

        public Bingo GetBingo()
        {
            var now = DateTime.Now.AddMinutes(-3).AddSeconds(-30);
            return _dbContent.Bingos.Include(i => i.Players).Where(q => q.StartAt > now).OrderByDescending(d => d.Id).FirstOrDefault();
        }

        public Bingo ReadyBingo(string leader, int level)
        {
            var result = new Bingo()
            {
                Leader = leader,
                Player = leader,
                Level = level,
                StartAt = DateTime.Now,
                Status = BingoStatus.Prepare,
                Number = "[]",
            };

            _dbContent.Bingos.Add(result);
            _dbContent.SaveChanges();

            return result;
        }

        public void AddPlayer(int bingoId, string name, List<int> numbers)
        {
            var entity = _dbContent.Bingos.Include(i => i.Players).Where(q => q.Id == bingoId).FirstOrDefault();

            if (entity.Players.Any(a => a.Name == name))
            {
                throw new Exception("已經報名了啦 傻B");
            }
            else
            {
                var order = entity.Players.Count() + 1;

                var result = new BingoPlayer()
                {
                    Name = name,
                    Number = JsonConvert.SerializeObject(numbers.ToArray()),
                    Order = order,
                };

                entity.Players.Add(result);

                _dbContent.Bingos.Update(entity);

                _dbContent.SaveChanges();
            }
        }

        public BingoPlayer GetPlayer(int id)
        {
            return _dbContent.BingoPlayers.Where(q => q.Id == id).Include(i => i.Bingo).FirstOrDefault();
        }

        public void SendNumber(int playerId, int number)
        {
            var bingoId = _dbContent.BingoPlayers.Include(i => i.Bingo).Where(q => q.Id == playerId).Select(s => s.Bingo.Id).FirstOrDefault();

            var entity = _dbContent.Bingos.Where(q => q.Id == bingoId).Include(i => i.Players).FirstOrDefault();

            var num = JsonConvert.DeserializeObject<int[]>(entity.Number).ToList();

            num.Add(number);

            entity.Number = JsonConvert.SerializeObject(num.ToArray());

            var sendPlayer = entity.Players.Where(q => q.Id == playerId).FirstOrDefault();

            var firstBingo = CheckBingo(entity.Level, JsonConvert.DeserializeObject<int[]>(sendPlayer.Number).ToList(), num);

            if (firstBingo)
            {
                sendPlayer.Bingoed = 1;
                entity.Status = BingoStatus.Close;
            }

            foreach (var item in entity.Players.Where(q => q.Id != playerId))
            {
                if (CheckBingo(entity.Level, JsonConvert.DeserializeObject<int[]>(item.Number).ToList(), num))
                {
                    item.Bingoed = firstBingo ? 2 : 1;
                    entity.Status = BingoStatus.Close;
                }
            }

            if (entity.Status == BingoStatus.Close)
            {
                entity.Player = string.Join(",", entity.Players.Where(q => q.Bingoed.HasValue).Select(s => s.Name).ToList());
            }
            else
            {
                var playerName = entity.Players.Where(q => q.Order == sendPlayer.Order + 1).Select(s => s.Name).FirstOrDefault();

                entity.Player = playerName ?? entity.Leader;
            }

            _dbContent.Bingos.Update(entity);

            _dbContent.SaveChanges();
        }

        private bool CheckBingo(int level, List<int> playerNumbers, List<int> sendedNumbers)
        {
            //SetBingoLine

            var bingoSetCount = level * 2 + 2;
            var bingoSet = new List<List<int>>();

            for (int i = 0; i < bingoSetCount; i++)
            {
                bingoSet.Add(new List<int>());
            }

            for (int i = 0; i < level; i++)
            {
                for (int j = 0; j < level; j++)
                {
                    var no = playerNumbers[i * level + j];
                    bingoSet[i].Add(no);//橫
                    bingoSet[(j % level) + level].Add(no);//直
                    if (i == j)//斜
                    {
                        bingoSet[bingoSetCount - 2].Add(no);
                    }
                    if (i + j + 1 == level)
                    {
                        bingoSet[bingoSetCount - 1].Add(no);
                    }
                }
            }

            //CheckBingo

            int count = 0;

            foreach (var item in bingoSet)
            {
                if (item.Intersect(sendedNumbers).Count() == level)
                {
                    count++;
                }
            }

            return count > 3 ? true : false;
        }

        public void UpdateStatus(int bingoId, BingoStatus status)
        {
            var entity = _dbContent.Bingos.Find(bingoId);

            entity.Status = status;

            _dbContent.Bingos.Update(entity);

            _dbContent.SaveChanges();
        }
    }
}
