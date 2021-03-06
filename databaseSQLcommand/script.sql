USE [GeniusCarrefour]
GO
/****** Object:  Table [dbo].[BingoPlayers]    Script Date: 2022/5/11 下午 12:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BingoPlayers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Number] [nvarchar](max) NULL,
	[BingoId] [int] NOT NULL,
	[Bingoed] [int] NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_BingoPlayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bingos]    Script Date: 2022/5/11 下午 12:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bingos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Leader] [nvarchar](max) NULL,
	[Player] [nvarchar](max) NULL,
	[Level] [int] NOT NULL,
	[Number] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[StartAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Bingos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 2022/5/11 下午 12:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Url] [nvarchar](200) NULL,
	[ImgSrc] [nvarchar](200) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[UserId] [int] NOT NULL,
	[ItemStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2022/5/11 下午 12:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[UserId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[ItemStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2022/5/11 下午 12:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BasePrice] [money] NULL,
	[Price] [money] NULL,
	[Brand] [nvarchar](50) NULL,
	[Variant] [nvarchar](50) NULL,
	[Number] [smallint] NULL,
	[Image] [varchar](250) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2022/5/11 下午 12:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BingoPlayers] ON 

INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (1, N'Sunny', N'[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]', 1, NULL, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (3, N'Timmy', N'[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]', 1, NULL, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (4, N'Sunny', N'[10,21,15,4,8,14,3,25,9,5,22,24,19,18,17,2,7,16,12,11,13,6,1,20,23]', 2, 1, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (5, N'电爆你', N'[12,6,17,14,15,5,8,13,10,25,19,23,9,1,4,22,21,11,20,7,2,16,18,3,24]', 3, 1, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (6, N'Sunny', N'[12,13,17,3,16,5,9,10,7,25,2,20,23,15,4,14,11,21,22,8,24,6,18,1,19]', 3, NULL, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (7, N'电爆你', N'[16,22,21,14,19,15,18,13,23,25,7,8,6,3,9,5,17,2,4,1,24,12,11,20,10]', 4, NULL, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (8, N'Test', N'[20,3,5,13,23,11,25,19,9,15,21,4,8,7,10,14,24,16,6,22,2,12,1,18,17]', 4, 1, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (9, N'Sunny', N'[1,19,17,25,23,14,24,9,10,22,16,2,18,13,7,11,20,21,4,12,15,3,8,6,5]', 4, NULL, 0)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (10, N'tttt', N'[17,2,16,25,9,18,20,13,7,23,21,6,5,10,14,1,24,12,4,11,19,8,22,15,3]', 5, 1, 1)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (11, N'1412', N'[2,14,22,1,18,24,25,3,16,10,11,13,17,15,12,21,9,4,8,6,20,7,5,19,23]', 6, NULL, 1)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (12, N'nitama', N'[3,16,19,8,5,12,9,18,22,24,11,15,4,20,14,6,23,21,25,7,1,17,2,10,13]', 6, 1, 2)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (13, N'danny', N'[10,7,21,11,17,19,9,22,2,3,1,20,4,25,18,13,14,24,16,12,23,5,6,8,15]', 7, NULL, 1)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (14, N'dfgdfg', N'[19,9,24,6,13,1,22,14,12,7,23,4,15,17,10,20,16,2,11,8,18,5,21,3,25]', 8, NULL, 1)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (15, N'ghjkghkghk', N'[13,17,6,9,25,10,23,20,14,12,2,4,5,8,18,15,7,22,3,16,1,19,21,11,24]', 8, NULL, 2)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (16, N'timmy', N'[7,17,11,10,19,5,4,16,9,24,20,12,22,6,14,13,8,25,21,15,3,23,18,1,2]', 9, 1, 1)
INSERT [dbo].[BingoPlayers] ([Id], [Name], [Number], [BingoId], [Bingoed], [Order]) VALUES (17, N'Sunny', N'[25,12,23,7,13,21,2,5,8,4,24,15,18,16,1,9,11,17,22,3,10,14,20,6,19]', 9, NULL, 2)
SET IDENTITY_INSERT [dbo].[BingoPlayers] OFF
SET IDENTITY_INSERT [dbo].[Bingos] ON 

INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (1, N'Sunny', N'Sunny', 5, N'[1,25,3,23,22]', 1, CAST(N'1991-01-01T10:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (2, N'Sunny', N'Sunny', 5, N'[13,6,16,1,20,23,19,25,15,10,21,4,8,14,3,25,25,9,5]', 3, CAST(N'2020-12-11T17:27:17.0100000' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (3, N'电爆你', N'电爆你', 5, N'[1,1,23,9,9,22,19,12,4,11,5,24,2,7,20,16,8,8,15,21]', 3, CAST(N'2020-12-11T17:58:41.2535152' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (4, N'电爆你', N'Test', 5, N'[17,8,6,7,25,3,20,9,18,16,13,10,5,4,23,15,22]', 3, CAST(N'2020-12-11T18:02:20.5719867' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (5, N'tttt', N'tttt', 5, N'[5,7,10,6,21,14,19,24,9,23,3,11,11,3,18,21,1,17]', 3, CAST(N'2020-12-14T10:25:18.0376008' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (6, N'1412', N'nitama', 5, N'[17,21,11,4,13,18,15,2,12,19,24,20,9,14,16,23,8,22]', 3, CAST(N'2020-12-14T10:28:52.6583213' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (7, N'danny', N'danny', 5, N'[2]', 2, CAST(N'2020-12-17T14:32:30.2857892' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (8, N'dfgdfg', N'dfgdfg', 5, N'[4,20,12,18,23,1]', 2, CAST(N'2021-09-14T12:52:57.5585501' AS DateTime2))
INSERT [dbo].[Bingos] ([Id], [Leader], [Player], [Level], [Number], [Status], [StartAt]) VALUES (9, N'timmy', N'timmy', 5, N'[22,13,7,18,4,2,21,25,16,19,11,23,3,10,1,12,17,17]', 3, CAST(N'2022-05-11T11:53:37.8403525' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Bingos] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (3981, N'樂事 Lays 美國經典原味-97g / 1入', N'https://online.carrefour.com.tw/tw/1402001500101', N'https://image.azureedge.net/0004465_lay-s-.jpeg', 3, 0.0000, 9, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6544, N'家樂福芥末風味朝鮮海苔50g / 1入', N'https://online.carrefour.com.tw/tw/1420408600101', N'https://image.azureedge.net/0004750_50g.jpeg', 8, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6545, N'元本山芥末對切海苔 / 1入', N'https://online.carrefour.com.tw/tw/1420402500101', N'https://image.azureedge.net/0015717.jpeg', 8, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6546, N'BF薄荷岩鹽檸檬糖138g / 1入', N'https://online.carrefour.com.tw/tw/1422014100101', N'https://image.azureedge.net/0214042_bf138g.jpeg', 6, 0.0000, 2, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6547, N'泰山Cheers Bee奇兒思蜂蜜氣泡水-590mlx24 / 24入', N'https://online.carrefour.com.tw/tw/1004105700124', N'https://image.azureedge.net/0167083_taisu-cheers-bee-et590ml.jpeg', 4, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6548, N'良澔嚴選海苔-芥末風味', N'https://online.carrefour.com.tw/zh/%E8%89%AF%E6%BE%94/1420403200101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw57d6356b/images/large/0182463_-.jpeg', 6, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6549, N'元本山味付對切海苔', N'https://online.carrefour.com.tw/zh/%E5%85%83%E6%9C%AC%E5%B1%B1/1420405400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3405793d/images/large/1420405400101-20211014.png', 4, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6550, N'多力多滋美式辣起士', N'https://online.carrefour.com.tw/zh/%E5%A4%9A%E5%8A%9B%E5%A4%9A%E6%BB%8B/1401192900101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwee19fa53/images/large/0216532.jpeg', 4, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6551, N'多力多滋火爆蒜辣108g', N'https://online.carrefour.com.tw/zh/%E5%A4%9A%E5%8A%9B%E5%A4%9A%E6%BB%8B/1401107700101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8fdb2b6f/images/large/0277668.png', 4, 0.0000, 2, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6661, N'多力多滋爆蒜鮮蝦108g / 1入', N'https://online.carrefour.com.tw/tw/1401106500101', N'https://image.azureedge.net/0261551.png', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6662, N'義美薄鹽堅果-綜合六果 / 1入', N'https://online.carrefour.com.tw/tw/1424494500101', N'https://image.azureedge.net/0120242.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6663, N'黑松茶尋味台灣青茶-590mlx24 / 24入', N'https://online.carrefour.com.tw/tw/1003305400124', N'https://image.azureedge.net/0243803_-590ml.jpeg', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6664, N'統一阿Q桶麵生猛海鮮(碗)98gx3 / 3入', N'https://online.carrefour.com.tw/tw/1450301900103', N'https://image.azureedge.net/0171489_q-98g.jpeg', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6665, N'統一阿Q排骨雞汁(碗) 107g*3入/組 / 3入', N'https://online.carrefour.com.tw/tw/1450001000103', N'https://image.azureedge.net/0202562_q-107g.jpeg', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6666, N'泰山八寶粥 375g6入/組 / 6入', N'https://online.carrefour.com.tw/tw/1480400700106', N'https://image.azureedge.net/0005289_-375g.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6667, N'原萃錫蘭無糖紅茶580ml / 24入', N'https://online.carrefour.com.tw/tw/1003103300124', N'https://image.azureedge.net/0207521_580ml.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6668, N'原萃冷萃金萱烏龍-450mlx24 / 24入', N'https://online.carrefour.com.tw/tw/1003000800124', N'https://image.azureedge.net/0241197_-450ml.png', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6669, N'芝司樂原味高鈣起司768g / 1入', N'https://online.carrefour.com.tw/tw/1504000400101', N'https://image.azureedge.net/0226154_768g.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6670, N'快車肉乾無核黑橄欖超值分享包 / 1入', N'https://online.carrefour.com.tw/tw/2003501800101', N'https://image.azureedge.net/0277203_-.png', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6671, N'多力多滋火爆蒜辣108g / 1入', N'https://online.carrefour.com.tw/tw/1401107700101', N'https://image.azureedge.net/0277668.png', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6672, N'白蘭氏旭沛蜆精60ml*12 / 1入', N'https://online.carrefour.com.tw/tw/1002303100101', N'https://image.azureedge.net/0120559_60ml12.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6673, N'台灣美食全紀錄--北港蠶豆 / 1入', N'https://online.carrefour.com.tw/tw/1424204400101', N'https://image.azureedge.net/0188883_-.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6674, N'可口可樂Zero 600ml', N'https://online.carrefour.com.tw/zh/%E5%8F%AF%E5%8F%A3%E5%8F%AF%E6%A8%82zero/1000000100124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwade7ad7b/images/large/1000000100101_1.jpg', 4, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6675, N'可口可樂纖維+ Pet 600ml / 24入', N'https://online.carrefour.com.tw/tw/1000002700124', N'https://image.azureedge.net/0207373_-et-600ml.jpeg', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6676, N'77新貴派18片盒裝-花生 / 1入', N'https://online.carrefour.com.tw/tw/1413104700101', N'https://image.azureedge.net/0004674_7718-.jpeg', 1, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6677, N'茶裏王日式綠茶無糖600ml / 24入', N'https://online.carrefour.com.tw/tw/1003301500124', N'https://image.azureedge.net/0099021_600ml.jpeg', 2, 0.0000, 1, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6678, N'品客洋蔥口味洋芋片 / 1入', N'https://online.carrefour.com.tw/tw/1402100500101', N'https://image.azureedge.net/0015714.jpeg', 2, 0.0000, 1, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6679, N'奇多隨口脆-家常起司-28gx10 / 1入', N'https://online.carrefour.com.tw/tw/1401100300101', N'https://image.azureedge.net/0249548_-.png', 1, 0.0000, 1, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6680, N'每朝健康無糖紅茶 650ml', N'https://online.carrefour.com.tw/zh/%E6%AF%8F%E6%9C%9D%E5%81%A5%E5%BA%B7/1003191700124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf19eeac0/images/large/1003191700104.jpg', 4, 0.0000, 1, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6681, N'KIRIN生茶 525ml / 24入', N'https://online.carrefour.com.tw/tw/1003302300124', N'https://image.azureedge.net/0069713_kiri-525ml.jpeg', 2, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6682, N'TOMMI-雙起司鮭魚米漢堡(160g*3入)-冷凍', N'https://online.carrefour.com.tw/zh/%E8%80%81%E5%8D%94%E7%8F%8D/2010454000101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc1d386f6/images/large/0259695_tommi-160g3-.png', 4, 0.0000, 1, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6701, N'橘之屋8號夾鏈袋-100入 / 1入', N'https://online.carrefour.com.tw/tw/3142104600101', N'https://image.azureedge.net/0192170_8-100.jpeg', 2, 0.0000, 3, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6702, N'台酒花雕酸菜牛肉麵(碗)200g短效期,最長期限至2021-07-23 / 1入', N'https://online.carrefour.com.tw/tw/1450103100101', N'https://image.azureedge.net/0265232_200g.jpeg', 3, 0.0000, 3, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6703, N'3M 細滑牙線棒超值量販包(散裝)-50支x3 / 1入', N'https://online.carrefour.com.tw/tw/1210604400101', N'https://image.azureedge.net/0232757_3m-.jpeg', 1, 0.0000, 3, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6704, N'滿漢大餐蔥燒牛肉(碗) 192g*2入/組 / 2入', N'https://online.carrefour.com.tw/tw/1450101200102', N'https://image.azureedge.net/0175608_-192g.jpeg', 4, 0.0000, 3, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6705, N'泰國小老板厚片海苔-原味 / 1入', N'https://online.carrefour.com.tw/tw/1420407100101', N'https://image.azureedge.net/0213990_-.jpeg', 10, 0.0000, 3, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6706, N'泰山Cheers Bee奇兒思蜂蜜氣泡水-590mlx24 / 24入', N'https://online.carrefour.com.tw/tw/1004105700124', N'https://image.azureedge.net/0167083_taisu-cheers-bee-et590ml.jpeg', 1, 0.0000, 3, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6707, N'愛之味健康油切分解茶無糖 590ml / 24入', N'https://online.carrefour.com.tw/tw/1003304100124', NULL, 1, 0.0000, 3, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6708, N'泰國小老板超大海苔-經典味', N'https://online.carrefour.com.tw/zh/%E6%B3%B0%E5%9C%8B%E5%B0%8F%E8%80%81%E6%9D%BF/1420407800101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw032d94d0/images/large/0213997_-.jpeg', 10, 0.0000, 3, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6745, N'77新貴派18片盒裝-花生 - 1入', N'https://online.carrefour.com.tw/zh/77/1413104700101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw14d44dba/images/large/1413104700101_.jpg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6746, N'ㄋㄟㄋㄟ補給站牛奶餅 - 1入', N'https://online.carrefour.com.tw/zh/1410412900101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwef834280/images/large/0004528.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6747, N'樂事神戶厚切牛排-97g', N'https://online.carrefour.com.tw/zh/%E6%A8%82%E4%BA%8B/1402210800101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwb2cef795/images/large/0258370.jpeg', 3, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6748, N'樂事 Lays 九州岩燒海苔-97g', N'https://online.carrefour.com.tw/zh/1402101500101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8283e6ed/images/large/0013464.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6749, N'義美錫蘭紅茶TP250ml - 24入', N'https://online.carrefour.com.tw/zh/%E7%BE%A9%E7%BE%8E/1003103100124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwde4ac065/images/large/0093335_t250ml.jpeg', 1, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6750, N'義美錫蘭奶茶 250ML - 24入', N'https://online.carrefour.com.tw/zh/%E7%BE%A9%E7%BE%8E/1003204900124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw66ec2f67/images/large/0177497_-250ml.jpeg', 1, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6751, N'義美紅麴養生薄餅 - 1入', N'https://online.carrefour.com.tw/zh/%E7%BE%A9%E7%BE%8E/1410406700101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc75c7955/images/large/0013477.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6752, N'義美巧克力夾心酥經濟包 - 1入', N'https://online.carrefour.com.tw/zh/%E7%BE%A9%E7%BE%8E/1413104100101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwfc577e0a/images/large/0006943.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6753, N'Red Bull 紅牛能量飲料355ml x4 - 1入', N'https://online.carrefour.com.tw/zh/red-bull/1002200900101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw82595537/images/large/1002200900101.jpeg', 4, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6754, N'品客原味洋芋片110g', N'https://online.carrefour.com.tw/zh/%E5%93%81%E5%AE%A2/1402005300101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw42244d14/images/large/0267065.jpeg', 3, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6755, N'立頓奶茶-250ml - 24入', N'	https://online.carrefour.com.tw/zh/%E7%AB%8B%E9%A0%93/1003200600124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw770227ef/images/large/0003006_t250ml.jpeg', 1, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6756, N'卡迪那洋芋片牛排口味175g - 1入', N'https://online.carrefour.com.tw/zh/%E5%8D%A1%E8%BF%AA%E9%82%A3/1402211800101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf4a39c59/images/large/0264685_175g.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6757, N'卡迪那全天然洋芋片鹽味175G - 1入', N'https://online.carrefour.com.tw/zh/%E5%8D%A1%E8%BF%AA%E9%82%A3/1402096100101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc2bbaffe/images/large/0247828_175g.jpeg', 2, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6758, N'天仁茉香綠茶 - 1入', N'https://online.carrefour.com.tw/zh/%E5%A4%A9%E4%BB%81/1430202400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwe72f512a/images/large/0035672.jpeg', 1, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6759, N'TOMMI-雙起司鮭魚米漢堡(160g*3入) - 1入', N'https://online.carrefour.com.tw/zh/%E8%80%81%E5%8D%94%E7%8F%8D/2010454000101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc1d386f6/images/large/0259695_tommi-160g3-.png', 3, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6760, N'御茶園特上紅茶250ml', N'https://online.carrefour.com.tw/zh/%E5%BE%A1%E8%8C%B6%E5%9C%92/1003100500124.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd33c0e29/images/large/0222756_250ml.jpeg', 2, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6761, N'義美杏仁巧克力酥片(黑可可)280g - 1入', N'https://online.carrefour.com.tw/zh/%E7%BE%A9%E7%BE%8E/1410224900101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd5b2a720/images/large/0241135.jpeg', 1, 0.0000, 11, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6762, N'家樂福日月紅茶立體袋茶2.5gx40', N'https://online.carrefour.com.tw/zh/%E5%AE%B6%E6%A8%82%E7%A6%8F/1430000400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd93a1fe0/images/large/0017093_25gx40.jpeg', 1, 0.0000, 11, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6785, N'Airwaves 超涼無糖口香糖暢涼可樂 44粒 / 1入', N'https://online.carrefour.com.tw/tw/1422616600101', N'https://image.azureedge.net/0214554_airwaves-44.jpeg', 5, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6786, N'泰國小老板厚片海苔-原味', N'https://online.carrefour.com.tw/zh/%E6%B3%B0%E5%9C%8B%E5%B0%8F%E8%80%81%E6%9D%BF/1420407100101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw93a000a6/images/large/0213990_-.jpeg', 1, 0.0000, 12, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6787, N'萬歲牌濃起司堅果120G / 1入', N'https://online.carrefour.com.tw/tw/1424407100101', N'https://image.azureedge.net/0264269_120g.jpeg', 3, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6788, N'泰山Cheers奇兒思強氣泡水-500ml', N'https://online.carrefour.com.tw/zh/%E6%B3%B0%E5%B1%B1/1004108500104.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw445b5cd7/images/large/0213127_-cheers-ex-500ml.jpeg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6789, N'舒味思氣泡水萊姆口味Pet500ml', N'https://online.carrefour.com.tw/zh/%E8%88%92%E5%91%B3%E6%80%9D%C2%AE/1004103300104.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf5cb28bc/images/large/1004103300101.jpg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6790, N'桂格美味三合一麥片 經典麥香', N'https://online.carrefour.com.tw/zh/%E6%A1%82%E6%A0%BC/1436292400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf2a76075/images/large/1436292400101-20211115.jpg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6791, N'Airwaves超涼無糖口香糖-冷萃咖啡口味62g', N'https://online.carrefour.com.tw/zh/airwaves/1422620500101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf6e23902/images/large/1422620500101.jpg', 3, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6792, N'桂格美味三合一麥片 麥香減糖', N'https://online.carrefour.com.tw/zh/%E6%A1%82%E6%A0%BC/1436292500101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3993fb96/images/large/1436292500101-20211115.jpg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6793, N'UCC法式深焙濾掛式咖啡', N'https://online.carrefour.com.tw/zh/ucc/1431100400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd11b2340/images/large/0229988_ucc.jpeg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6794, N'好麗友蛋黃派', N'https://online.carrefour.com.tw/zh/1411002400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw1c1ec4f6/images/large/0169675.jpeg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6795, N'白蘭氏葉黃素精華凍15Gx21入', N'https://online.carrefour.com.tw/zh/%E7%99%BD%E8%98%AD%E6%B0%8F/1002301100101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw616a1049/images/large/0264683_15gx21.jpeg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6796, N'自然主意 拇指煎餅-海苔濃140g', N'https://online.carrefour.com.tw/zh/1410413600101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw68b80fed/images/large/0180020_-140g.jpeg', 3, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6797, N'桂格北海道鮮奶麥片-特濃鮮奶 28克*12入/包 / 1入', N'https://online.carrefour.com.tw/tw/1436201900101', N'https://image.azureedge.net/0005007_-.jpeg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6798, N'萬歲牌夏威夷果 / 1入', N'https://online.carrefour.com.tw/tw/1424304000101', N'https://image.azureedge.net/0202402.jpeg', 3, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6799, N'萬歲牌沛力堅果枸杞20gx7', N'https://online.carrefour.com.tw/zh/%E8%90%AC%E6%AD%B2%E7%89%8C/1424411400101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwdc4ac3f9/images/large/0273727.jpeg', 1, 0.0000, 12, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6800, N'米森-玫瑰鹽烤有機綜合堅果35g隨手包', N'https://online.carrefour.com.tw/zh/%E7%B1%B3%E6%A3%AE/1424401000101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw788e0bdf/images/large/1424401000101.jpg', 5, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6801, N'Airwaves口香糖超值包-蜂蜜檸檬62g', N'https://online.carrefour.com.tw/zh/airwaves/1422606300101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw4b0d8b79/images/large/0267455_airwaves.jpeg', 2, 0.0000, 12, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6802, N'張君雅小妹妹五香海苔休閒丸子-80g', N'https://online.carrefour.com.tw/zh/%E7%B6%AD%E5%8A%9B/1401005000115.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw5e9a8826/images/large/0246542.jpeg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6803, N'【限量】Sunny Ranch 每日堅果35gx20', N'https://online.carrefour.com.tw/zh/sunny-ranch/1424409200101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf0f280ef/images/large/0269281_suy-rach-35g20.jpeg', 2, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6804, N'白蘭氏黑醋栗+金盞花葉黃素精華飲60mlx18 / 1入', N'https://online.carrefour.com.tw/tw/1002300800101', N'https://image.azureedge.net/0133551_60mlx18.jpeg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6805, N'多喝水More+維他命100氣泡水-百香果風味560ml', N'https://online.carrefour.com.tw/zh/%E5%91%B3%E4%B8%B9/1004105800104.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw646ffcda/images/large/0267030_more100.jpeg', 1, 0.0000, 12, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6806, N'桂格雙認證高鈣脫脂奶粉750g', N'https://online.carrefour.com.tw/zh/%E6%A1%82%E6%A0%BC/1433102900101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw07bf8a76/images/large/0072680_750g.jpeg', 1, 0.0000, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6807, N'萬歲牌沛力堅果種子-20gx7', N'https://online.carrefour.com.tw/zh/%E8%90%AC%E6%AD%B2%E7%89%8C/1424404200101.html', N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw2c32be07/images/large/0251909.png', 1, 0.0000, 12, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6808, N'紅牛能量飲料4入Can355ml / 1入', N'https://online.carrefour.com.tw/tw/1002200900101 ', N'https://image.azureedge.net/0193277_4ca355ml.jpeg', 6, 0.0000, 10, 1)
INSERT [dbo].[Items] ([Id], [Name], [Url], [ImgSrc], [Quantity], [Price], [UserId], [ItemStatus]) VALUES (6809, N'萬歲牌和風堅果綜合果-156g / 1入', N'https://online.carrefour.com.tw/tw/1424401400101', N'https://image.azureedge.net/0250850.jpeg', 1, 0.0000, 10, 0)
SET IDENTITY_INSERT [dbo].[Items] OFF
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1000000100124, 4, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1000002700124, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1002303100101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003000800124, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003103300124, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003191700124, 4, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003301500124, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003302300124, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1003305400124, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1401100300101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1401106500101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1401107700101, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1402100500101, 2, 255)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1413104700101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1424204400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1424494500101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1450001000103, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1450301900103, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1480400700106, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 1504000400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 2003501800101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (1, 2010454000101, 4, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1004105700124, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1401107700101, 4, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1401192900101, 4, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1420402500101, 8, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1420403200101, 8, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1420405400101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1420408600101, 8, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (2, 1422014100101, 6, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1003304100124, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1004105700124, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1210604400101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1420407100101, 10, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1420407800101, 10, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1450101200102, 4, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 1450103100101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (3, 3142104600101, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (9, 1402001500101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (10, 1002200900101, 6, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (10, 1424401400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1002200900101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1003100500124, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1003103100124, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1003200600124, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1003204900124, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1402005300101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1402096100101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1402101500101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1402210800101, 3, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1402211800101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1410224900101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1410406700101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1410412900101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1413104100101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1413104700101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1430000400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 1430202400101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (11, 2010454000101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1002300800101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1002301100101, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1004103300104, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1004105800104, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1004108500104, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1401005000115, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1410413600101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1411002400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1420407100101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1422606300101, 2, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1422616600101, 5, 255)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1422620500101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424304000101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424401000101, 5, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424404200101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424407100101, 3, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424409200101, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1424411400101, 1, 1)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1431100400101, 2, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1433102900101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1436201900101, 2, 255)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1436292400101, 1, 0)
INSERT [dbo].[Orders] ([UserId], [ProductId], [Quantity], [ItemStatus]) VALUES (12, 1436292500101, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1000000100124, N'可口可樂Zero 600ml', 600.0000, 600.0000, N'可口可樂zero', N'600ml毫升', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwade7ad7b/images/large/1000000100101_1.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1000002700124, N'可口可樂纖維+ Pet-600mlx24', 580.0000, 580.0000, N'可口可樂纖維+', N'600ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwea49a084/images/large/0279583_-et-600ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1002200900101, N'Red Bull 紅牛能量飲料355ml x4', 269.0000, 269.0000, N'紅牛', N'355ml毫升', 4, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw82595537/images/large/1002200900101.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1002300800101, N'白蘭氏黑醋栗+金盞花葉黃素精華飲60mlx18', 999.0000, 999.0000, N'白蘭氏', N'60ml毫升', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw12390a6e/images/large/0133551_60mlx18.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1002301100101, N'白蘭氏葉黃素精華凍15Gx21入', 970.0000, 970.0000, N'白蘭氏', N'15g克', 21, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw17ac8ae8/images/large/1002301100101.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1002303100101, N'白蘭氏旭沛蜆精60ml*12', 598.0000, 598.0000, N'白蘭氏', N'60ml毫升', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw6cde60f3/images/large/0120559_60ml12.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003000800124, N'原萃冷萃金萱烏龍 450ml', 534.0000, 534.0000, N'原萃®', N'450ml毫升', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw705fb5b4/images/large/0241197_-450ml.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003100500124, N'御茶園特上紅茶250ml', 174.0000, 174.0000, N'御茶園', N'250ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd33c0e29/images/large/0222756_250ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003103100124, N'義美錫蘭紅茶TP250ml', 234.0000, 234.0000, N'義美', N'250ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwde4ac065/images/large/0093335_t250ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003103300124, N'原萃錫蘭無糖紅茶580ml', 408.0000, 408.0000, N'原萃®', N'580ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw4de112f6/images/large/0207521_580ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003191700124, N'每朝健康無糖紅茶 650ml', 594.0000, 594.0000, N'每朝健康', N'650ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf19eeac0/images/large/1003191700104.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003200600124, N'立頓奶茶-250ml', 154.0000, 154.0000, N'立頓', N'250ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw770227ef/images/large/0003006_t250ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003204900124, N'義美錫蘭奶茶 250ML', 234.0000, 234.0000, N'義美', N'250ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw66ec2f67/images/large/0177497_-250ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003301500124, N'茶裏王日式綠茶無糖600ml', 432.0000, 432.0000, N'茶裏王', N'600ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw7fef036c/images/large/0099021_600ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003302300124, N'KIRIN生茶-525ml', 932.0000, 932.0000, N'KIRIN', N'525ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw1365d6f2/images/large/0252436_kiri-525ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003304100124, N'愛之味健康油切分解茶無糖 590ml', 496.0000, 496.0000, N'愛之味', N'590ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw90b4af07/images/large/0003026_-590ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1003305400124, N'黑松茶尋味台灣青茶-590ml', 432.0000, 432.0000, N'黑松', N'590ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwb06ca423/images/large/1003305400104.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1004103300104, N'舒味思氣泡水萊姆口味Pet500ml', 98.0000, 98.0000, N'舒味思®', N'500ml毫升', 4, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf5cb28bc/images/large/1004103300101.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1004105700124, N'泰山Cheers Bee奇兒思蜂蜜氣泡水-590ml', 672.0000, 672.0000, N'泰山', N'590ml毫升', 24, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwdde37909/images/large/0167083_taisu-cheers-bee-et590ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1004105800104, N'多喝水More+維他命100氣泡水-百香果風味560ml', 107.0000, 107.0000, N'味丹', N'560ml毫升', 4, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw646ffcda/images/large/0267030_more100.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1004108500104, N'泰山Cheers奇兒思強氣泡水-500ml', 72.0000, 72.0000, N'泰山', N'500ml毫升', 4, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw445b5cd7/images/large/0213127_-cheers-ex-500ml.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1201003600106, N'麗仕持久香氛皂-媚惑幽香-80g', 79.0000, 79.0000, N'麗仕', N'80g克', 6, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dweaeb180a/images/large/0258311_-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1210604400101, N'3M 細滑牙線棒超值量販包(散裝)-50支x3', 149.0000, 149.0000, N'3M', N'1PC包', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw69695d9c/images/large/0232757_3m-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1232721500101, N'三多好入睡高鈣機能奶粉', 229.0000, 229.0000, N'三多', N'5PC包', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd6b4104f/images/large/1232721500101.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1401005000115, N'張君雅小妹妹五香海苔休閒丸子-80g', 284.0000, 284.0000, N'維力', N'80g克', 15, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw5e9a8826/images/large/0246542.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1401100300101, N'奇多隨口脆-家常起司-28gx10', 79.0000, 79.0000, N'奇多', N'280g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwbe714375/images/large/0249548_-.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1401106500101, N'多力多滋爆蒜鮮蝦108g', 36.0000, 36.0000, N'多力多滋', N'108g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw2b4ac24d/images/large/0261551.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1401107700101, N'多力多滋火爆蒜辣108g', 36.0000, 36.0000, N'多力多滋', N'108g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8fdb2b6f/images/large/0277668.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1401192900101, N'多力多滋美式辣起士', 36.0000, 36.0000, N'多力多滋', N'108g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwee19fa53/images/large/0216532.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402001500101, N'樂事 Lays 美國經典原味-97g', 36.0000, 36.0000, N'樂事', N'97g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3c171043/images/large/0004465_lay-s-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402005300101, N'品客原味洋芋片110g', 49.0000, 49.0000, N'品客', N'110g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw42244d14/images/large/0267065.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402096100101, N'卡迪那全天然洋芋片鹽味175G', 69.0000, 69.0000, N'卡迪那', N'175g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc2bbaffe/images/large/0247828_175g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402100500101, NULL, 0.0000, 0.0000, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402101500101, N'樂事 Lays 九州岩燒海苔-97g', 36.0000, 36.0000, N'', N'97g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8283e6ed/images/large/0013464.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402210800101, N'樂事神戶厚切牛排-97g', 36.0000, 36.0000, N'樂事', N'97g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwb2cef795/images/large/0258370.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1402211800101, N'卡迪那洋芋片牛排口味175g', 69.0000, 69.0000, N'卡迪那', N'175g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf4a39c59/images/large/0264685_175g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1410224900101, N'義美杏仁巧克力酥片(黑可可)280g', 113.0000, 113.0000, N'義美', N'280g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd5b2a720/images/large/0241135.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1410406700101, N'義美紅麴養生薄餅', 64.0000, 64.0000, N'義美', N'240g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc75c7955/images/large/0013477.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1410412900101, N'ㄋㄟㄋㄟ補給站牛奶餅', 99.0000, 99.0000, N'', N'400g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwef834280/images/large/0004528.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1410413600101, N'自然主意 拇指煎餅-海苔濃140g', 120.0000, 120.0000, N'', N'140g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw68b80fed/images/large/0180020_-140g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1411002400101, N'好麗友蛋黃派', 124.0000, 124.0000, N'', N'276g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw1c1ec4f6/images/large/0169675.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1413104100101, N'義美巧克力夾心酥經濟包', 78.0000, 78.0000, N'義美', N'400g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwfc577e0a/images/large/0006943.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1413104700101, N'77新貴派18片盒裝-花生', 89.0000, 89.0000, N'77', N'288g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw14d44dba/images/large/1413104700101_.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420402500101, N'元本山芥末對切海苔', 89.0000, 89.0000, N'元本山', N'31.2g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw564a01d4/images/large/0015717.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420403200101, N'良澔嚴選海苔-芥末風味', 105.0000, 105.0000, N'良澔', N'28.6g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw57d6356b/images/large/0182463_-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420405400101, N'元本山味付對切海苔', 89.0000, 89.0000, N'元本山', N'33.8g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3405793d/images/large/1420405400101-20211014.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420407100101, N'泰國小老板厚片海苔-原味', 60.0000, 60.0000, N'泰國小老板', N'32g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw93a000a6/images/large/0213990_-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420407800101, N'泰國小老板超大海苔-經典味', 120.0000, 120.0000, N'泰國小老板', N'6g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw032d94d0/images/large/0213997_-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1420408600101, N'家樂福芥末風味朝鮮海苔50g', 79.0000, 79.0000, N'家樂福', N'50g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwe0091534/images/large/0004750_50g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1422014100101, N'BF薄荷岩鹽檸檬糖138g', 48.0000, 48.0000, N'', N'138g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwcea40435/images/large/0214042_bf138g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1422606300101, N'Airwaves口香糖超值包-蜂蜜檸檬62g', 62.0000, 62.0000, N'Airwaves', N'62g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw4b0d8b79/images/large/0267455_airwaves.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1422616600101, NULL, 0.0000, 0.0000, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1422620500101, N'Airwaves超涼無糖口香糖-冷萃咖啡口味62g', 69.0000, 69.0000, N'Airwaves', N'62g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf6e23902/images/large/1422620500101.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424204400101, N'台灣美食全紀錄--北港蠶豆', 60.0000, 60.0000, N'', N'300g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw563f02b6/images/large/0188883_-.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424304000101, N'萬歲牌夏威夷果', 115.0000, 115.0000, N'萬歲牌', N'70g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8ec6b20d/images/large/0202402.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424400300101, N'盛香珍小魚干花生', 55.0000, 55.0000, N'盛香珍', N'80g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw7ccefe3f/images/large/0004892.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424401000101, N'米森-玫瑰鹽烤有機綜合堅果35g隨手包', 66.0000, 66.0000, N'米森', N'35g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw788e0bdf/images/large/1424401000101.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424401400101, N'萬歲牌和風堅果綜合果-156g', 129.0000, 129.0000, N'萬歲牌', N'156g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3b3ea1c5/images/large/0250850.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424404200101, N'萬歲牌沛力堅果種子-20gx7', 180.0000, 180.0000, N'萬歲牌', N'140g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw2c32be07/images/large/0251909.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424407100101, N'萬歲牌濃起司堅果120G', 127.0000, 127.0000, N'萬歲牌', N'120g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf28fcfb2/images/large/0264269_120g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424409200101, N'【限量】Sunny Ranch 每日堅果35gx20', 395.0000, 395.0000, N'Sunny Ranch', N'35g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf0f280ef/images/large/0269281_suy-rach-35g20.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424411400101, N'萬歲牌沛力堅果枸杞20gx7', 180.0000, 180.0000, N'萬歲牌', N'140g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwdc4ac3f9/images/large/0273727.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1424494500101, N'義美薄鹽堅果-綜合六果', 303.0000, 303.0000, N'義美', N'360g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw7646b19c/images/large/0120242.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1430000400101, N'家樂福日月紅茶立體袋茶2.5gx40', 199.0000, 199.0000, N'家樂福', N'100g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwd93a1fe0/images/large/0017093_25gx40.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1430202400101, N'天仁茉香綠茶', 145.0000, 145.0000, N'天仁', N'2g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwe72f512a/images/large/0035672.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1431100400101, N'UCC法式深焙濾掛式咖啡', 368.0000, 368.0000, N'UCC', N'8g克x24', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw15f5a592/images/large/1431100400101.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1433102900101, N'桂格雙認證高鈣脫脂奶粉750g', 325.0000, 325.0000, N'桂格', N'750g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw07bf8a76/images/large/0072680_750g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1436201900101, NULL, 0.0000, 0.0000, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1436292400101, N'桂格美味三合一麥片 經典麥香', 138.0000, 138.0000, N'桂格', N'330g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwf2a76075/images/large/1436292400101-20211115.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1436292500101, N'桂格美味三合一麥片 麥香減糖', 138.0000, 138.0000, N'桂格', N'325g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3993fb96/images/large/1436292500101-20211115.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1450001000103, N'統一阿Q排骨雞汁(碗)107g', 90.0000, 90.0000, N'統一', N'107g克', 3, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwe0062e76/images/large/0202562_q-107g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1450101200102, N'滿漢大餐蔥燒牛肉(碗) 192g', 110.0000, 110.0000, N'滿漢大餐', N'192g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw0c22e11c/images/large/0175608_-192g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1450103100101, N'台酒花雕酸菜牛肉麵(碗)200g', 44.0000, 44.0000, N'台酒', N'200g克', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw8bfedd9a/images/large/0265232_200g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1450301900103, N'統一阿Q桶麵生猛海鮮(碗)98gx3', 90.0000, 90.0000, N'統一', N'98g克', 3, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwbf02aaee/images/large/0171489_q-98g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1480400700106, N'泰山八寶粥-375g', 138.0000, 138.0000, N'泰山', N'375g克', 6, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw3a92a596/images/large/0253877_-375g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (1504000400101, N'芝司樂原味高鈣起司768g', 345.0000, 345.0000, N'芝司樂', N'768g克', 0, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwea070ec9/images/large/0226154_768g.jpeg', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (2003501800101, N'快車肉乾無核黑橄欖超值分享包', 120.0000, 120.0000, N'快車肉乾', N'1Pack包', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw0760f740/images/large/0277203_-.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (2010454000101, N'TOMMI-雙起司鮭魚米漢堡(160g*3入)', 140.0000, 140.0000, N'老協珍', N'1Box盒', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dwc1d386f6/images/large/0259695_tommi-160g3-.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [BasePrice], [Price], [Brand], [Variant], [Number], [Image], [Status]) VALUES (3142104600101, N'橘之屋8號夾鏈袋-100入', 98.0000, 98.0000, N'', N'1Set組', 1, N'https://online.carrefour.com.tw/on/demandware.static/-/Sites-carrefour-tw-m-inner/default/dw12a1deab/images/large/0192170_8-100.jpeg', 1)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name]) VALUES (1, N'通靈王')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (2, N'[東南亞]農夫Timmy（航空王 我當定了）')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (3, N'嫩)Sunny-bug製造者(嫩')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (4, N'代碼下的亡靈-Ad')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (9, N'H大大')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (10, N'Danny')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (11, N'Grape')
INSERT [dbo].[Users] ([Id], [Name]) VALUES (12, N'Patrick')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_Satus]  DEFAULT ((0)) FOR [ItemStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ItemStatus]  DEFAULT ((1)) FOR [ItemStatus]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BingoPlayers]  WITH CHECK ADD  CONSTRAINT [FK_BingoPlayers_Bingos_BingoId] FOREIGN KEY([BingoId])
REFERENCES [dbo].[Bingos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BingoPlayers] CHECK CONSTRAINT [FK_BingoPlayers_Bingos_BingoId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
