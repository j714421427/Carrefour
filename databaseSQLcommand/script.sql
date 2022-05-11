USE [master]
GO
/****** Object:  Database [GeniusCarrefour]    Script Date: 2022/5/11 下午 12:07:12 ******/
CREATE DATABASE [GeniusCarrefour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeniusCarrefour', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeniusCarrefour.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeniusCarrefour_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeniusCarrefour_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GeniusCarrefour] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeniusCarrefour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeniusCarrefour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GeniusCarrefour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeniusCarrefour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeniusCarrefour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeniusCarrefour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeniusCarrefour] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GeniusCarrefour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeniusCarrefour] SET  MULTI_USER 
GO
ALTER DATABASE [GeniusCarrefour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeniusCarrefour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeniusCarrefour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeniusCarrefour] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeniusCarrefour] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GeniusCarrefour] SET QUERY_STORE = OFF
GO
USE [GeniusCarrefour]
GO
/****** Object:  Table [dbo].[BingoPlayers]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
/****** Object:  Table [dbo].[Bingos]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
/****** Object:  Table [dbo].[Items]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2022/5/11 下午 12:07:12 ******/
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
USE [master]
GO
ALTER DATABASE [GeniusCarrefour] SET  READ_WRITE 
GO
