USE [pet_database]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[CustomerID] [int] NULL,
	[FoodID] [int] NULL,
	[PetID] [int] NULL,
	[ItemID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[LoginUserID] [int] NOT NULL,
	[Biography] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Donate] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Donate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[FoodName] [nvarchar](50) NULL,
	[FoodType] [nvarchar](50) NULL,
	[FoodWeight] [nvarchar](50) NULL,
	[FoodAmount] [int] NULL,
	[FoodDescription] [nvarchar](50) NULL,
	[FoodBrand] [nvarchar](50) NULL,
	[FoodPrice] [money] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemBrand] [nvarchar](50) NULL,
	[ItemColor] [nvarchar](50) NULL,
	[ItemType] [nvarchar](50) NULL,
	[ItemSize] [nvarchar](50) NULL,
	[ItemDescription] [varchar](max) NULL,
	[ItemAmount] [int] NULL,
	[ItemPrice] [money] NULL,
	[IsStock] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginUser]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[RoleID] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[IsOwnership] [bit] NOT NULL,
	[IsPurchase] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastAddedDate] [datetime] NULL,
 CONSTRAINT [PK_LoginUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[PetID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[PetType] [nvarchar](100) NULL,
	[PetGenus] [nvarchar](50) NULL,
	[PetName] [nvarchar](50) NULL,
	[PetAge] [nvarchar](50) NULL,
	[IsPetSick] [bit] NULL,
	[PetColor] [nvarchar](50) NULL,
	[PetStatusID] [int] NOT NULL,
	[PetSeller] [nvarchar](50) NULL,
	[PetPrice] [money] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetStatus]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusType] [nvarchar](50) NULL,
 CONSTRAINT [PK_PetStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Support]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Support](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[SupportType] [nvarchar](50) NULL,
	[FoodID] [int] NULL,
	[PetID] [int] NULL,
	[ItemID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Age] [nvarchar](50) NULL,
	[Job] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Message] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Support] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veterinary]    Script Date: 13.08.2023 22:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veterinary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Age] [nchar](10) NOT NULL,
	[Education] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Veterinary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([ID], [Amount], [Price], [CustomerID], [FoodID], [PetID], [ItemID], [IsDeleted]) VALUES (3, 2, 89.9000, 2, NULL, NULL, 1, 0)
INSERT [dbo].[Basket] ([ID], [Amount], [Price], [CustomerID], [FoodID], [PetID], [ItemID], [IsDeleted]) VALUES (4, 4, 110.0000, 2, NULL, NULL, 1, 0)
INSERT [dbo].[Basket] ([ID], [Amount], [Price], [CustomerID], [FoodID], [PetID], [ItemID], [IsDeleted]) VALUES (6, 1, 325.5000, 2, NULL, NULL, 1, 1)
INSERT [dbo].[Basket] ([ID], [Amount], [Price], [CustomerID], [FoodID], [PetID], [ItemID], [IsDeleted]) VALUES (1007, 10, 40.0000, 2, 2, 2, 2, 1)
INSERT [dbo].[Basket] ([ID], [Amount], [Price], [CustomerID], [FoodID], [PetID], [ItemID], [IsDeleted]) VALUES (1008, 440, 440.0000, 2, 2, 2, 2, 0)
SET IDENTITY_INSERT [dbo].[Basket] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [CategoryType]) VALUES (1, N'Hayvan')
INSERT [dbo].[Categories] ([ID], [CategoryType]) VALUES (2, N'Mama')
INSERT [dbo].[Categories] ([ID], [CategoryType]) VALUES (3, N'Eğlence')
INSERT [dbo].[Categories] ([ID], [CategoryType]) VALUES (4, N'Kıyafet')
INSERT [dbo].[Categories] ([ID], [CategoryType]) VALUES (5, N'Eşya')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (2, N'Caner', N'Kuyucu', N'cehapemah. 34 sok', N'İstanbul', N'05555555555', 2, N'kednini sev insan ol', 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (3, N'Müfit', N'Şakır', N'kemalist mah. aleyna sok. no:12', N'İstanbul', N'05343443434', 2, N'Hayat güzeldir', 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (4, N'string', NULL, N'string', NULL, N'string', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (5, N'caner', NULL, N'merkezimsi mahalle', NULL, N'0555555555', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (6, N'caner', NULL, N'merkezimsi mahalle', NULL, N'0555555555', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (7, N'asdfa', NULL, N'sdfas', NULL, N'dfasd', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (8, N'string', NULL, N'string', NULL, N'string', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (9, N'caner', NULL, N'canerli mah', NULL, N'41243123413', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (10, N'caner', NULL, N'caner', NULL, N'caner', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (11, N'caner', NULL, N'asdf', NULL, N'asdfasdf', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (12, N'ASD', NULL, N'asd', NULL, N'ASD', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (13, N'asdfasdf', NULL, N'asdfasdf', NULL, N'asdfasd', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (14, N'sdfasdf', NULL, N'asdfasd', NULL, N'fasdf', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (15, N'asdfasd', NULL, N'fasdfasd', NULL, N'asdfasdf', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (16, N'ccc', NULL, N'cc', NULL, N'cc', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (17, N'ccc', NULL, N'ccc', NULL, N'cc', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (18, N'caner', NULL, N'asdfads', NULL, N'askdfka', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (19, N'müfit', NULL, N'müfitli', NULL, N'müfitel', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (20, N'müfit', NULL, N'müfitli', NULL, N'müfitlii', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (21, NULL, NULL, NULL, NULL, NULL, 32, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (22, NULL, NULL, NULL, NULL, NULL, 33, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (23, N'TEST', N'TEST', N'TEST', N'TEST', N'TEST', 34, N'TEST', 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (24, N'TEST', N'TEST', N'TEST', N'TEST', N'TEST', 35, N'TEST', 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (25, N'caner', NULL, N'caner', NULL, N'caner', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (26, N'caner', NULL, N'caner', NULL, N'caner', 2, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (27, N'TEST', N'TEST', N'TEST', N'TEST', N'TEST', 36, N'TEST', 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (28, N'ikili', N'ikili', N'ikili', N'ikili', N'ikili', 37, NULL, 0)
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName], [Address], [City], [PhoneNumber], [LoginUserID], [Biography], [IsDeleted]) VALUES (30, N'caner', NULL, N'asdfasdf', NULL, N'asdfasd', 2, NULL, 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Donate] ON 

INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (1, N'500', N'caner', N'caner@gmail.com')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (2, N'555', N'metin', N'metin@gmaiil.com')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (3, N'5552', N'metin', N'metin@gmaiil.com')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (4, N'500', N'donatello', N'donatello@donat')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (5, N'500', N'donatello', N'donatello@donat')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (6, N'44', N'asdfasdf', N'asdfasd@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (7, N'', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (8, N'', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (9, N'', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (10, N'', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (11, N'2143143', N'123412341', N'23412341243@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (12, N'2143143', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (13, N'2143143', N'asdfasdf', N'sdfasfd@asdfadsf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (14, N'', N'', N'')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (15, N'5', N'acasdcasd', N'asdfasdfadsf@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (16, N'5', N'acasdcasd', N'asdfasdfadsf@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (17, N'5', N'acasdcasd', N'asdfasdfadsf@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (18, N'1', N'asdf', N'asdf@asdas')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (19, N'3', N'asdf', N'asdfasd@asdfasdf')
INSERT [dbo].[Donate] ([ID], [Donate], [Name], [Email]) VALUES (20, N'4', N'asdfasdf', N'asdfasdfasdf@gmail.com')
SET IDENTITY_INSERT [dbo].[Donate] OFF
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([FoodID], [CategoryID], [FoodName], [FoodType], [FoodWeight], [FoodAmount], [FoodDescription], [FoodBrand], [FoodPrice], [IsDeleted]) VALUES (1, 2, N'Kedi Mamasi', N'Satista', N'8', 1000, N'Kemik sulu kuzu etli', N'Goldi', 130.0000, 0)
INSERT [dbo].[Foods] ([FoodID], [CategoryID], [FoodName], [FoodType], [FoodWeight], [FoodAmount], [FoodDescription], [FoodBrand], [FoodPrice], [IsDeleted]) VALUES (2, 5, N'Dog Burger', N'Satista', N'19', 1000, N'Yüzde Yüz Doğal ve Sağlıklı Raw Food Burger', N'Euro Garden', 3.9500, 0)
INSERT [dbo].[Foods] ([FoodID], [CategoryID], [FoodName], [FoodType], [FoodWeight], [FoodAmount], [FoodDescription], [FoodBrand], [FoodPrice], [IsDeleted]) VALUES (3, 1, N'Cat Burger', N'Satista', N'50', 1000, N'Yüzde Yüz Doğal ve Sağlıklı Raw Food Burger', N'Pet Burger', 2500.0000, 0)
INSERT [dbo].[Foods] ([FoodID], [CategoryID], [FoodName], [FoodType], [FoodWeight], [FoodAmount], [FoodDescription], [FoodBrand], [FoodPrice], [IsDeleted]) VALUES (1003, 2, N'Ödül Maması', N'Satista', N'20', 1000, N'Dana Etli Ödül Maması', N'Pet Burger', 150.0000, 0)
INSERT [dbo].[Foods] ([FoodID], [CategoryID], [FoodName], [FoodType], [FoodWeight], [FoodAmount], [FoodDescription], [FoodBrand], [FoodPrice], [IsDeleted]) VALUES (1004, NULL, N'Goody', N'Satista', N'24', 1000, N'Kuzu Etli ve Pirinçli Yetişkin Köpek Maması', N'Goody', 280.0000, 0)
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (1, 5, N'Kedi Taşıma Ekipmanı', N'Karlie', N'Kırmızı', N'Çanta', N'120x80', N'Pet Kargo Güçlendirilmiş Plastik', 120, 5.8700, 1, 0)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (2, 5, N'Köpek Tasma', N'Tulyano', N'Hardal', N'Aksesuar', N'2*29-37', N'Gerçek deri el yapımı köpek tasması', 80, 139.0000, 1, 0)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (3, 1, N'string', N'string', N'string', N'string', N'string', N'string', 0, 0.0000, 1, 1)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (1003, 5, N'Köpek Oyuncağı ', N'PetKolik', N'Sarı', N'Oyuncak', N'Yuvarlak', N'3lü Tenis Topu', 3, 129.0000, 1, 0)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (1004, 5, N'Kedi Oltası', N'Petviya', N'Kırmızı', N'Oyuncak', N'50 Cm', N'3 Kalın Tüylü olta ', 1, 20.0000, 1, 0)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (1005, 5, N'Kedi-Köpek Koltuğu', N'Petviya', N'Gri', N'Aksesuar', N'Tek Kişilik', N'Araç İçi Koltuk', 1, 200.0000, 1, 0)
INSERT [dbo].[Items] ([ItemID], [CategoryID], [ItemName], [ItemBrand], [ItemColor], [ItemType], [ItemSize], [ItemDescription], [ItemAmount], [ItemPrice], [IsStock], [IsDeleted]) VALUES (1006, 5, N'Lazer', N'Petviya', N'Siyah', N'Oyuncak', N'5 Cm', N'Pilli Lazer Kedi Oyuncağı', 1, 30.0000, 1, 0)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginUser] ON 

INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (2, N'asfjafhafj@gmail.com', N'1234', NULL, NULL, NULL, NULL, 1, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (3, N'arataatta@gmail.com', N'22333', NULL, NULL, NULL, NULL, 1, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (4, N'cano@gmail.com', N'tahaca', NULL, NULL, NULL, NULL, 1, CAST(N'2023-06-03T15:28:11.120' AS DateTime), 0, 0, 1, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (5, N'caner', N'1234', NULL, NULL, NULL, NULL, 1, CAST(N'2023-06-04T19:39:35.440' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (6, N'caner2', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:05:29.237' AS DateTime), 0, 1, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (7, N'caner3', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:05:55.807' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (8, N'caner10', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:20:57.123' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (9, N'müfit', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:21:24.903' AS DateTime), 1, 1, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (10, N'canerr', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:26:40.463' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (11, N'müfitt', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:27:51.600' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (12, N'müfitt', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:28:11.160' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (13, N'möfit', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:28:55.933' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (14, N'möfit', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:29:05.010' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (15, N'444', N'444', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-05T20:29:24.537' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (16, N'caner', N'müfi', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-06T11:22:32.390' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (17, N'caner', N'strinmügitg', NULL, NULL, NULL, NULL, 4, CAST(N'2023-06-06T11:24:13.763' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (18, N'caner2', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:10:36.653' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (19, N'canerss', N'ss', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:12:17.027' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (20, N'asdfasdf', N'adsfa', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:17:37.050' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (21, N'asdfasdf', N'adsfa', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:17:41.527' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (22, N'asdf', N'asdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:20:49.983' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (23, N'asdf', N'asdfasdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:21:31.287' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (24, N'asdfasdfads', N'fasdfasdfasdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:21:59.073' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (25, N'vsadvasdv', N'asdvasdv', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:22:19.810' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (26, N'asdfasdfa', N'sdfasdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:22:34.080' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (27, N'canerr', N'dasfdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T21:27:35.770' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (28, N'canerrr', N'canerrr', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-11T22:34:44.053' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (29, N'casdcasdcasdcas', N'dcas', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T12:22:44.893' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (30, N'asdfasdf', N'asdfasdf', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T12:23:58.530' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (31, N'kahvedünyası', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T19:40:16.313' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (32, N'xxxx', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T20:33:50.850' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (33, N'qqqq', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T20:55:34.650' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (34, N'eeee', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-12T20:57:04.967' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (35, N'deneme', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-13T09:10:03.873' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (36, N'bitirme', N'1234', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-13T09:53:21.767' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (37, N'ikili', N'ikili', NULL, NULL, NULL, NULL, 2, CAST(N'2023-06-14T10:47:26.443' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (38, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 2, CAST(N'2023-06-14T11:27:33.600' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (39, N'test2', N'test2', N'test2', N'test2', N'test2', N'test2', 2, CAST(N'2023-06-14T11:28:36.983' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (40, N'test2', N'test2', N'test2', N'test2', N'test2', N'test2', 2, CAST(N'2023-06-14T12:04:03.970' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (41, N'test3', N'test3', N'test3', N'test3', N'test3', N'test3', 2, CAST(N'2023-06-14T19:05:21.957' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (42, N'bubirdeneme', N'1234', N'caner', N'kuyucu', N'5395154273', N'merkez mahallesi', 2, CAST(N'2023-06-14T20:04:35.703' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (43, N'TEST5', N'TEST5', N'TEST5', N'TEST5', N'TEST5', N'TEST5', 2, CAST(N'2023-06-15T11:16:40.893' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (44, N'canerkuyucu', N'1234', N'caner', N'kuyucu', N'5395154273', N'canerli mahallesi', 2, CAST(N'2023-06-15T13:01:23.153' AS DateTime), 0, 1, 0, CAST(N'2023-06-18T19:26:53.233' AS DateTime))
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (45, N'TEST6', N'TEST6', N'TEST6', N'TEST6', N'5555555555', N'TEST6', 2, CAST(N'2023-06-15T15:49:38.223' AS DateTime), 0, 1, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (46, N'TEST7', N'TEST7', N'TEST7', N'TEST7', N'5555555555', N'TEST7', 2, CAST(N'2023-06-15T16:30:13.940' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (47, N'BARIŞ', N'BARIŞ', N'BARIŞ', N'BARIŞ', N'5366666666', N'BARIŞ', 2, CAST(N'2023-06-15T18:01:48.600' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (48, N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'5395154273', N'ALISVERIS', 2, CAST(N'2023-06-16T11:13:02.160' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (49, N'HASAN', N'HASAN', N'HASAN', N'HASAN', N'0303030303', N'HASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASANHASAN', 2, CAST(N'2023-06-16T11:37:47.917' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (50, N'KEMAL', N'KEMAL', N'KEMAL', N'KEMAL', N'2222222222', N'KEMALKEMAL', 2, CAST(N'2023-06-16T11:41:58.940' AS DateTime), 0, 1, 0, CAST(N'2023-06-18T19:18:10.470' AS DateTime))
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (51, N'son', N'son', N'son', N'son', N'32323', N'son', 2, CAST(N'2023-06-18T18:22:19.493' AS DateTime), 1, 1, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (52, N'son2', N'son2', N'son2', N'son2', N'21123123', N'son2', 2, CAST(N'2023-06-18T18:33:31.490' AS DateTime), 0, 0, 0, NULL)
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (53, N'kiko', N'kiko', N'kiko', N'kiko', N'5395154273', N'Merkez mahallesi Ece sokak Genyap Osmanpaşa Konakları
C Blok Daire : 6 No : 8', 2, CAST(N'2023-06-18T19:30:39.743' AS DateTime), 0, 0, 0, CAST(N'2023-06-18T19:30:55.163' AS DateTime))
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (54, N'kiko2', N'kiko2', N'kiko2', N'kiko2', N'5395154273', N'Merkez mahallesi Ece sokak Genyap Osmanpaşa Konakları
C Blok Daire : 6 No : 8', 2, CAST(N'2023-06-18T19:31:28.047' AS DateTime), 1, 1, 0, CAST(N'2023-06-18T19:31:37.530' AS DateTime))
INSERT [dbo].[LoginUser] ([ID], [UserName], [Password], [FirstName], [LastName], [PhoneNumber], [Address], [RoleID], [CreateDate], [IsOwnership], [IsPurchase], [IsDeleted], [LastAddedDate]) VALUES (55, N'admin2', N'admin2', N'admin2', N'admin2', N'3232323232', N'admin2', 2, CAST(N'2023-06-19T19:21:01.657' AS DateTime), 1, 1, 0, CAST(N'2023-06-19T19:22:02.393' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoginUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1, NULL, 1, N'Golden Terrier', N'Erkek', N'Leblebi', N'2', 0, N'Sarı', 2, NULL, 3000.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (2, NULL, 1, N'Çin aslanı', N'Dişi', N'Ejderya', N'1', 0, N'Kahverengi', 2, NULL, 15000.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (5, NULL, 1, N'string', N'string', N'string', N'string', 1, N'string', 1, NULL, 0.0000, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1003, NULL, 1, N'köpek', N'erkek', N'köpke', N'3', 0, N'mor', 5, N'Mercan PetShop', 99999.0000, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1007, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1008, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1009, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1010, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1011, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1012, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1013, NULL, 1, N'ddddd', N'dddd', N'ddddd', N'dddd', 0, N'ddddddd', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1014, NULL, 1, N'fasdfa', N'sdfasd', N'asdfasd', N'fasdfas', 0, N'dfasdfasd', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1015, NULL, 1, N'casdcasdc', N'asdcasdca', N'casdcasd', N'sdcasdcasd', 0, N'casdcasdc', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1016, NULL, 1, N'sdfasdfa', N'sdfasdfasd', N'asdfasdfa', N'fasdfasdf', 0, N'asdfasdf', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1017, NULL, 1, N'köpek', N'erkek', N'tombiş', N'6', 0, N'beyaz', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1018, NULL, 1, N'sdfasd', N'fasdfa', N'asdfa', N'sdfasdfa', 0, N'sdfasdf', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1019, NULL, 1, N'ccc', N'ccc', N'ccc', N'ccc', 0, N'ccc', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1020, NULL, 1, N'asdfasdf', N'asdfasdfasdf', N'sdfasd', N'asdfasdf', 0, N'asdfasdf', 1, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1021, NULL, 1, N'Pug', N'Dişi', N'Şila', N'4', 0, N'Siyah', 6, N'PetShop', 4343.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1024, NULL, 1, N'French Bulldog', N'Dişi', N'Leo', N'3', 0, N'Beyaz', 2, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1025, NULL, 1, N'French Bulldog', N'Erkek', N'Leo', N'3', 0, N'Beyaz', 2, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1026, NULL, 1, N'Köpek', N'Erkek', N'Köpek', N'5', 1, N'beyaz', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1027, NULL, 1, N'Doberman', N'Erkek', N'Dondurma', N'4', 0, N'Siyah', 2, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1028, NULL, 1, N'bitirme', N'Erkek', N'bitirme', N'4', 0, N'siyah', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1029, NULL, 1, N'at', N'Dişi', N'köpek', N'14', 0, N'beyaz', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1030, NULL, 1, N'sdfasdf', N'Erkek', N'asdfa', N'asdfasdf', 1, N'asdfasdfsd', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1031, NULL, 1, N'sdfasd', N'Erkek', N'asdfasdfa', N'4', 1, N'adsfsdf', 1, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1032, NULL, 1, N'TEST5', N'Erkek', N'TEST5', N'TEST5', 1, N'TEST5', 1, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1033, NULL, 1, N'TEST6', N'Erkek', N'TEST6', N'3', 0, N'TEST6', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1034, NULL, 1, N'TEST7', N'Erkek', N'TEST7', N'3', 1, N'TEST7', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1035, N'TEST7', 1, N'TEST8', N'Erkek', N'TEST8', N'3', 1, N'TEST8', 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1036, N'TEST7', 1, N'TEST8', N'Erkek', N'TEST8', N'3', 1, N'TEST8', 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1037, N'TEST7', 1, N'TEST8', N'Erkek', N'TEST9', N'3', 1, N'TEST8', 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1038, N'TEST7', 1, N'TEST8', N'Erkek', N'TEST10', N'3', 1, N'TEST8', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1039, N'BARIŞ', 1, N'BARIŞ', N'Erkek', N'BARIŞ', N'24', 0, N'BARIŞ', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1041, NULL, 1, N'Pug', N'Dişi', N'Şila', N'2', 0, N'Siyah', 3, N'Pet Center', 99999.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1042, NULL, 1, N'French Bulldog', N'Erkek', N'Leo', N'2', 0, N'Siyah', 3, N'Pet Center', 99999.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1043, NULL, 1, N'Doberman', N'Dişi', N'Alex', N'2', 0, N'siyah', 3, N'Pet Center ', 99999.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1044, NULL, 1, N'Pitbull', N'Dişi', N'Alexa', N'2', 0, N'siyah', 3, N'Pet Center ', 99999.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1045, N'KEMAL', 1, N'Pomeranian Boo', N'Erkek', N'Neo', N'2', 0, N'Siyah', 2, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1047, N'Admin', 1, N'Kurt', N'Erkek', N'Yaban', N'2', 0, N'Beyaz', 3, N'Okyanus Pet Store', 5555.0000, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1048, N'KEMAL', 1, N'Fino', N'Erkek', N'Fındık', N'3', 0, N'Beyaz', 2, NULL, NULL, 0)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1049, N'canerkuyucu', 1, N'fino', N'Dişi', N'cino', N'3', 0, N'siyah', 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1050, N'kiko', 1, N'kiko', N'Erkek', N'kiko', N'2', 0, N'kiko', 2, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1051, N'kiko2', 1, N'kiko2', N'Dişi', N'kiko2', N'2', 0, N'kiko2', 5, NULL, NULL, 1)
INSERT [dbo].[Pets] ([PetID], [UserName], [CategoryID], [PetType], [PetGenus], [PetName], [PetAge], [IsPetSick], [PetColor], [PetStatusID], [PetSeller], [PetPrice], [IsDeleted]) VALUES (1052, N'admin2', 1, N'golden', N'Erkek', N'fındık', N'3', 1, N'sarı', 5, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Pets] OFF
GO
SET IDENTITY_INSERT [dbo].[PetStatus] ON 

INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (1, N'Sahiplendirildi')
INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (2, N'Sahiplendirilmedi')
INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (3, N'Satışta')
INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (4, N'Satildi')
INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (5, N'Beklemede')
INSERT [dbo].[PetStatus] ([ID], [StatusType]) VALUES (6, N'İşleme Alındı')
SET IDENTITY_INSERT [dbo].[PetStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [RoleType]) VALUES (1, N'Kullanıcı')
INSERT [dbo].[Roles] ([ID], [RoleType]) VALUES (2, N'Admin')
INSERT [dbo].[Roles] ([ID], [RoleType]) VALUES (3, N'Satıcı')
INSERT [dbo].[Roles] ([ID], [RoleType]) VALUES (4, N'Veteriner')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Support] ON 

INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (161, N'TEST7', N'Satın Alma', NULL, 1003, NULL, N'ALAL', N'ALAL', N'ALAL', N'ALAL', N'ALAL@ALAL', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (162, N'TEST7', N'Sahiplenme', NULL, 1014, NULL, N'asdfasdf', N'asdfasdf', N'sdfasdfasdf', N'asdfasdfa', N'asdfasdf@sadfasdfasdf', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (163, N'TEST7', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'canerkuyucu@gmail.com', N'asdfasdf', N'asdfasdfasd', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (164, N'TEST7', N'Destek', NULL, NULL, NULL, N'casdcasd', NULL, NULL, NULL, N'casdcasdc@asdasdasd', NULL, N'asdcasdcasd', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (165, N'BARIŞ', N'Yemek', 1, NULL, NULL, N'BARIŞ', NULL, NULL, NULL, NULL, NULL, NULL, N'BARIŞ', N'3333333333', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (166, N'BARIŞ', N'Eşya', NULL, NULL, 1, N'BARIŞ', NULL, NULL, NULL, NULL, NULL, NULL, N'BARIŞ', N'3333333333', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (167, N'BARIŞ', N'Satın Alma', NULL, 1003, NULL, N'BARIŞ', N'BARIŞ', N'BARIŞ', N'BARIŞ', N'BARIs@BARIs', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (168, N'BARIŞ', N'Sahiplenme', NULL, 1013, NULL, N'BARIŞ', N'BARIŞBARIŞ', N'BARIŞ', N'BARIŞ', N'BARIs@BARIs', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (169, N'BARIŞ', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'canerkuyucu@gmail.com', N'BARIŞ', N'BARIŞ', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (170, N'BARIŞ', N'Destek', NULL, NULL, NULL, N'BARIŞ', NULL, NULL, NULL, N'BARIs@BARIs', NULL, N'BARIŞ', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (171, N'ALISVERIS', N'Yemek', 1, NULL, NULL, N'ALISVERIS', NULL, NULL, NULL, NULL, NULL, NULL, N'ALISVERIS', N'5395154273', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (172, N'ALISVERIS', N'Eşya', NULL, NULL, 1, N'ALISVERIS', NULL, NULL, NULL, NULL, NULL, NULL, N'ALISVERIS', N'5395154273', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (173, N'ALISVERIS', N'Satın Alma', NULL, 1003, NULL, N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'ALISVERIS@ALISVERIS', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (174, N'ALISVERIS', N'Satın Alma', NULL, 1021, NULL, N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'ALISVERIS', N'ALISVERIS@ALISVERIS', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (175, N'ALISVERIS', N'Satın Alma', NULL, 1041, NULL, N'DENEME', N'DENEME', N'DENEME', N'DENEME', N'DENEME@DENEME', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (176, N'ALISVERIS', N'Sahiplenme', NULL, 1039, NULL, N'DENEME', N'DENEME', N'DENEME', N'DENEME', N'DENEME@DENEME', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (177, N'ALISVERIS', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'canerkuyucu@gmail.com', N'DENEME', N'DENEME', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (178, N'KEMAL', N'Yemek', 1, NULL, NULL, N'KEMAL', NULL, NULL, NULL, NULL, NULL, NULL, N'KEMALKEMAL', N'2222222222', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (179, N'KEMAL', N'Eşya', NULL, NULL, 1, N'KEMAL', NULL, NULL, NULL, NULL, NULL, NULL, N'KEMALKEMAL', N'2222222222', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (180, N'KEMAL', N'Satın Alma', NULL, 1042, NULL, N'KEMAL', N'KEMAL', N'24', N'Mühendis', N'KEMAL@KEMAL', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (181, N'KEMAL', N'Sahiplenme', NULL, 1045, NULL, N'KEMAL', N'KEMAL', N'25', N'Mühendis', N'KEMAL@KEMAL', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (182, N'KEMAL', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'canerkuyucu@gmail.com', N'KEMAL', N'KEMALKEMAL', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (183, N'KEMAL', N'Destek', NULL, NULL, NULL, N'KEMAL', NULL, NULL, NULL, N'KEMAL@KEMAL', NULL, N'KEMALKEMAL', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (184, N'canerkuyucu', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'canerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (185, N'canerkuyucu', N'Satın Alma', NULL, 1044, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'canerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (186, N'canerkuyucu', N'Satın Alma', NULL, 1047, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'canerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (187, N'canerkuyucu', N'Satın Alma', NULL, 1047, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (188, N'canerkuyucu', N'Satın Alma', NULL, 1044, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (189, N'canerkuyucu', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'mühendis', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (190, N'canerkuyucu', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (191, N'canerkuyucu', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'23', N'mühendis', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (192, N'canerkuyucu', N'Satın Alma', NULL, 1047, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (193, N'canerkuyucu', N'Satın Alma', NULL, 1044, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (194, N'canerkuyucu', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (195, N'canerkuyucu', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'23', N'mühendis', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (196, N'canerkuyucu', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (197, N'canerkuyucu', N'Satın Alma', NULL, 1044, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (198, N'canerkuyucu', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (199, N'canerkuyucu', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (200, N'caner', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'123', N'1243', N'1243@1234', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (201, N'canerkuyucu', N'Sahiplenme', NULL, 2, NULL, N'Caner', N'Kuyucu', N'23', N'asdf', N'tahacanokuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (202, N'canerkuyucu', N'Sahiplenme', NULL, 1, NULL, N'Caner', N'Kuyucu', N'23', N'asdf', N'tahacanokuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (203, N'test5', N'Satın Alma', NULL, 1044, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (204, N'caner', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (205, N'caner', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (206, N'caner', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (207, N'caner', N'Satın Alma', NULL, 1021, NULL, N'asdfa', N'sdfa', N'sdfas', N'dfasd', N'fasdf@sfasd', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (208, N'canerkuyucu', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (209, N'canerkuyucu', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'1234', N'1243', N'12413@123123', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (210, N'canerkuyucu', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (211, N'kemal', N'Satın Alma', NULL, 1044, NULL, N'kemal', N'müfit', N'23', N'öğrenci', N'KEMAL@KEMAL', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (212, N'kemal', N'Satın Alma', NULL, 1047, NULL, N'Caner', N'Kuyucu', N'23', N'asdf', N'1234@123', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (213, N'kemal', N'Satın Alma', NULL, 1041, NULL, N'Caner', N'Kuyucu', N'1234', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (214, N'canerkuyucu', N'Satın Alma', NULL, 1042, NULL, N'caner', N'kuyucu', N'23', N'öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (215, N'müfit', N'Satın Alma', NULL, 1043, NULL, N'müfit', N'şakir', N'23', N'öprenci', N'Mehmetyldrim666@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (216, N'müfit', N'Sahiplenme', NULL, 1034, NULL, N'Caner', N'Kuyucu', N'1234', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (217, N'caner2', N'Satın Alma', NULL, 1042, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (218, N'test6', N'Satın Alma', NULL, 1043, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (219, N'son', N'Satın Alma', NULL, 1044, NULL, N'son', N'son', N'son', N'son', N'son@son', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (220, N'son', N'Sahiplenme', NULL, 1038, NULL, N'son', N'son', N'son', N'son', N'son@son', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (221, N'kiko2', N'Yemek', 1, NULL, NULL, N'asdfasdf', NULL, NULL, NULL, NULL, NULL, NULL, N'asdfasdf', N'3412412431', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (222, N'kiko2', N'Eşya', NULL, NULL, 1, N'asdfasdfa', NULL, NULL, NULL, NULL, NULL, NULL, N'sdfasdf', N'333333', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (223, N'kiko2', N'Satın Alma', NULL, 1047, NULL, N'asdfasd', N'fasdfasd', N'fasdf', N'sdfasdfasd', N'asdfasdf@asdfasdfa', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (224, N'kiko2', N'Sahiplenme', NULL, 1051, NULL, N'kiko2', N'kiko2', N'kiko2', N'kiko2', N'kiko2@kiko2', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (225, N'kiko2', N'Sahiplenme', NULL, 1048, NULL, N'kiko2', N'kiko2', N'kiko2', N'kiko2', N'kiko2@kiko2', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (226, N'kiko2', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'canerkuyucu@gmail.com', N'kiko2', N'kiko2', NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (227, N'admin2', N'Sahiplenme', NULL, 1052, NULL, N'caner', N'kuyucu', N'23', N'öğrenci', N'canerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (228, N'admin2', N'Yemek', 1, NULL, NULL, N'Caner Kuyucu', NULL, NULL, NULL, NULL, NULL, NULL, N'Merkez mahallesi Ece sokak Genyap Osmanpaşa Konakları
C Blok Daire : 6 No : 8', N'5395154273', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (229, N'admin2', N'Eşya', NULL, NULL, 1004, N'Caner Kuyucu', NULL, NULL, NULL, NULL, NULL, NULL, N'Merkez mahallesi Ece sokak Genyap Osmanpaşa Konakları
C Blok Daire : 6 No : 8', N'5395154273', 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (230, N'admin2', N'Satın Alma', NULL, 1021, NULL, N'Caner', N'Kuyucu', N'23', N'Öğrenci', N'tahacanerkuyucu@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Support] ([ID], [UserName], [SupportType], [FoodID], [PetID], [ItemID], [Name], [LastName], [Age], [Job], [Email], [Subject], [Message], [Address], [PhoneNumber], [IsDeleted]) VALUES (231, N'admin2', N'Veteriner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'kemalmufit@gmail.com', N'haycvan', N'hayvan hasta', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Support] OFF
GO
SET IDENTITY_INSERT [dbo].[Veterinary] ON 

INSERT [dbo].[Veterinary] ([ID], [UserName], [LastName], [Email], [Age], [Education], [IsActive]) VALUES (1, N'string', N'string', N'hhhhhhhhhhhh', N'3         ', N'string', 0)
INSERT [dbo].[Veterinary] ([ID], [UserName], [LastName], [Email], [Age], [Education], [IsActive]) VALUES (2, N'Caner', N'KUYUCU', N'canerkuyucu@gmail.com', N'23        ', N'haliç üniversite', 1)
INSERT [dbo].[Veterinary] ([ID], [UserName], [LastName], [Email], [Age], [Education], [IsActive]) VALUES (3, N'Müfit', N'ŞAKIR', N'kemalmufit@gmail.com', N'23        ', N'haliç üniversite', 1)
INSERT [dbo].[Veterinary] ([ID], [UserName], [LastName], [Email], [Age], [Education], [IsActive]) VALUES (4, N'Dağhan', N'YAZGAN', N'daghanyazgan@gmail.com', N'23        ', N'haliç üniversite', 1)
SET IDENTITY_INSERT [dbo].[Veterinary] OFF
GO
ALTER TABLE [dbo].[Basket] ADD  CONSTRAINT [DF_Basket_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Foods] ADD  CONSTRAINT [DF_Foods_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_IsStock]  DEFAULT ((1)) FOR [IsStock]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LoginUser] ADD  CONSTRAINT [DF_LoginUser_IsOwnership]  DEFAULT ((0)) FOR [IsOwnership]
GO
ALTER TABLE [dbo].[LoginUser] ADD  CONSTRAINT [DF_LoginUser_IsPurchase]  DEFAULT ((0)) FOR [IsPurchase]
GO
ALTER TABLE [dbo].[LoginUser] ADD  CONSTRAINT [DF_LoginUser_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Pets] ADD  CONSTRAINT [DF_Pets_IsPetSick]  DEFAULT ((0)) FOR [IsPetSick]
GO
ALTER TABLE [dbo].[Pets] ADD  CONSTRAINT [DF_Pets_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Support] ADD  CONSTRAINT [DF_Support_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Veterinary] ADD  CONSTRAINT [DF_Veterinary_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Customers]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Foods] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([FoodID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Foods]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Items]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Pets]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_LoginUser1] FOREIGN KEY([LoginUserID])
REFERENCES [dbo].[LoginUser] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_LoginUser1]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK_Foods_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK_Foods_Categories]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
ALTER TABLE [dbo].[LoginUser]  WITH CHECK ADD  CONSTRAINT [FK_LoginUser_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[LoginUser] CHECK CONSTRAINT [FK_LoginUser_Roles]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Categories]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_PetStatus] FOREIGN KEY([PetStatusID])
REFERENCES [dbo].[PetStatus] ([ID])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_PetStatus]
GO
ALTER TABLE [dbo].[Support]  WITH CHECK ADD  CONSTRAINT [FK_Support_Foods] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([FoodID])
GO
ALTER TABLE [dbo].[Support] CHECK CONSTRAINT [FK_Support_Foods]
GO
ALTER TABLE [dbo].[Support]  WITH CHECK ADD  CONSTRAINT [FK_Support_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Support] CHECK CONSTRAINT [FK_Support_Items]
GO
ALTER TABLE [dbo].[Support]  WITH CHECK ADD  CONSTRAINT [FK_Support_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
ALTER TABLE [dbo].[Support] CHECK CONSTRAINT [FK_Support_Pets]
GO
