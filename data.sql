USE [master]
GO
/****** Object:  Database [ProjectWeb]    Script Date: 8/11/2021 8:31:59 PM ******/
CREATE DATABASE [ProjectWeb] ON  PRIMARY 
( NAME = N'ProjectWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectWeb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectWeb_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectWeb] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectWeb] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectWeb', N'ON'
GO
USE [ProjectWeb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(10,1) NOT NULL,
	[name] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[cid] [int] IDENTITY(1,2) NOT NULL,
	[pid] [int] NULL,
	[content] [varchar](500) NULL,
	[date] [varchar](50) NULL,
	[accId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[history]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[history](
	[ProductName] [varchar](50) NULL,
	[Images] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Date] [varchar](100) NULL,
	[User] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [varchar](100) NULL,
	[Account_id] [int] NULL,
	[totalmoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[Order_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [pk_orderline] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC,
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](500) NULL,
	[date] [varchar](50) NULL,
	[accId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/11/2021 8:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1000,1) NOT NULL,
	[images] [varchar](20) NULL,
	[gender] [varchar](6) NULL,
	[brand] [varchar](100) NULL,
	[category] [varchar](100) NULL,
	[material] [varchar](100) NULL,
	[size] [varchar](20) NULL,
	[color] [varchar](20) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (10, N'admin', N'admin1')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (12, N'duy1', N'duy1')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (13, N'duy2', N'duy2')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (14, N'duy3', N'a')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (15, N'duy4', N'duy4')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (16, N'duy5', N'5')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (17, N'duy6', N'6')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (18, N'duy7', N'7')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (19, N'duy8', N'8')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (20, N'duy9', N'9')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (21, N'duy10', N'10')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (22, N'duy11', N'11')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (23, N'duy12', N'duy12')
INSERT [dbo].[Account] ([account_id], [name], [pass]) VALUES (24, N'duy13', N'13')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([cid], [pid], [content], [date], [accId]) VALUES (1, 1, N' Cam on ban nha', N'2021-03-21 , 22:12:11.617', 10)
INSERT [dbo].[comment] ([cid], [pid], [content], [date], [accId]) VALUES (3, 1, N'nhung ma ship hoi cham nha', N'2021-03-21 , 22:15:32.572', 23)
INSERT [dbo].[comment] ([cid], [pid], [content], [date], [accId]) VALUES (5, 2, N' thank u ban nhe ', N'2021-03-21 , 22:29:22.196', 10)
INSERT [dbo].[comment] ([cid], [pid], [content], [date], [accId]) VALUES (7, 1, N' ok', N'2021-03-23 , 10:32:18.706', 22)
SET IDENTITY_INSERT [dbo].[comment] OFF
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Seiko 1001', N'productImg/1001.png', 1, 16000000, N'2021-03-20 , 23:27:56.451', N'duy10')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Calvin Klein 1002', N'productImg/1003.png', 1, 6750000, N'2021-03-20 , 23:27:56.451', N'duy10')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Century  1005', N'productImg/1006.png', 1, 30080000, N'2021-03-20 , 23:29:32.029', N'duy11')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Seiko 1001', N'productImg/1001.png', 1, 16000000, N'2021-03-21 , 00:03:22.481', N'duy11')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Calvin Klein 1002', N'productImg/1003.png', 1, 6750000, N'2021-03-21 , 00:03:22.481', N'duy11')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Seiko 1000', N'productImg/1000.png', 3, 10000000, N'2021-03-23 , 11:18:11.010', N'admin')
INSERT [dbo].[history] ([ProductName], [Images], [Quantity], [Price], [Date], [User]) VALUES (N'Seiko 1000', N'productImg/1000.png', 1, 4100000, N'2021-03-21 , 00:03:22.481', N'duy11')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [Account_id], [totalmoney]) VALUES (1, N'2021-03-20 , 23:27:56.451', 21, 22750000)
INSERT [dbo].[Order] ([id], [date], [Account_id], [totalmoney]) VALUES (2, N'2021-03-20 , 23:29:32.029', 22, 30080000)
INSERT [dbo].[Order] ([id], [date], [Account_id], [totalmoney]) VALUES (3, N'2021-03-21 , 00:03:22.481', 22, 26850000)
INSERT [dbo].[Order] ([id], [date], [Account_id], [totalmoney]) VALUES (4, N'2021-03-23 , 11:18:11.010', 10, 30000000)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (1, 1001, 1, 16000000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (1, 1002, 1, 6750000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (2, 1005, 1, 30080000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (3, 1000, 1, 4100000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (3, 1001, 1, 16000000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (3, 1002, 1, 6750000)
INSERT [dbo].[OrderLine] ([Order_id], [Product_id], [Quantity], [Price]) VALUES (4, 1000, 3, 10000000)
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([pid], [content], [date], [accId]) VALUES (1, N' tot', N'2021-03-21 , 22:11:19.737', 21)
INSERT [dbo].[post] ([pid], [content], [date], [accId]) VALUES (2, N' hang dep waaaa:))', N'2021-03-21 , 22:20:16.141', 23)
INSERT [dbo].[post] ([pid], [content], [date], [accId]) VALUES (3, N'hello', N'2021-03-23 , 11:14:56.950', 21)
INSERT [dbo].[post] ([pid], [content], [date], [accId]) VALUES (4, N'hang thatla dep1', N'2021-03-28 , 00:00:28.528', 10)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1000, N'productImg/1000.png', N'Male', N'Seiko', N'Electronic Clock', N'Stainless Steel ', N'42mm x 9mm', N'Silver Gray', 10000000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1001, N'productImg/1001.png', N'Female', N'Seiko', N'Solar', N'Leather', N'33mm x 8mm', N'Red and White', 16000000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1002, N'productImg/1003.png', N'Male', N'Calvin Klein', N'Electronic Clock', N'Leather', N'42mm x 7mm', N'Golden and Brown', 6750000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1003, N'productImg/1004.png', N'Female', N'Calvin Klein', N'Mechanical Clock', N'Leather', N'38mm x 7mm', N'White', 4300000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1004, N'productImg/1005.png', N'Male', N'Century', N'Mechanical Clock', N'Crocodile Leather', N'38.5mm x 6mm', N'Black,Gray and White', 77000000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1005, N'productImg/1006.png', N'Female', N'Century ', N'Electronic Clock', N'Stainless Steel', N'26.2mm x 5mm', N'Silver and Blue', 30080000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1008, N'productImg/1007.png', N'Female', N'Citizen ', N'Electronic Clock', N'Steel,Gilding', N'29mm x 6mm', N'Black and Gold', 1999000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1009, N'productImg/1008.png', N'Male', N'Citizen ', N'Mechanical Clock', N'Stainless Steel', N'40mm x 8mm', N'Black and Silver', 3700000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1010, N'productImg/1009.png', N'Male', N'Alpina ', N'Sport', N'Elastic', N'45mm x 14.45mm', N'Black,Blue,Orange', 16562000)
INSERT [dbo].[product] ([product_id], [images], [gender], [brand], [category], [material], [size], [color], [price]) VALUES (1011, N'productImg/1010.png', N'Male', N'Frederique ', N'Mechanical Clock', N'Crocodile Leather', N'42mm x 15mm', N'Black,White,Gray', 73000000)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[product]  WITH CHECK ADD CHECK  (([gender]='Male' OR [gender]='Female' OR [gender]='All'))
GO
USE [master]
GO
ALTER DATABASE [ProjectWeb] SET  READ_WRITE 
GO
