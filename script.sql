USE [master]
GO
/****** Object:  Database [BlueBank]    Script Date: 2020-06-24 4:48:19 PM ******/
CREATE DATABASE [BlueBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlueBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BlueBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlueBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BlueBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BlueBank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlueBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlueBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlueBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlueBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlueBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlueBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlueBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlueBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlueBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlueBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlueBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlueBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlueBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlueBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlueBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlueBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlueBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlueBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlueBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlueBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlueBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlueBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlueBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlueBank] SET RECOVERY FULL 
GO
ALTER DATABASE [BlueBank] SET  MULTI_USER 
GO
ALTER DATABASE [BlueBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlueBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlueBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlueBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlueBank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlueBank', N'ON'
GO
ALTER DATABASE [BlueBank] SET QUERY_STORE = OFF
GO
USE [BlueBank]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[InvocationDate] [date] NOT NULL,
	[SupervisorId] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[SIN] [nvarchar](11) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleInitial] [char](1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[StreetAddress] [nvarchar](200) NOT NULL,
	[City] [nvarchar](200) NOT NULL,
	[PostalCode] [nvarchar](7) NOT NULL,
	[SeniorityDate] [date] NOT NULL,
	[WorkPhoneNumber] [nvarchar](255) NOT NULL,
	[CellPhoneNumber] [nvarchar](15) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[EmployeeType] [int] NOT NULL,
	[SupervisorId] [int] NULL,
	[JobId] [int] NOT NULL,
	[JobStartDate] [datetime] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Status] [int] NOT NULL,
	[Province] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Price] [decimal](19, 2) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Justification] [nvarchar](255) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Reason] [nvarchar](255) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[EmployeeId] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Department] [nvarchar](30) NOT NULL,
	[Status] [int] NOT NULL,
	[Subtotal] [decimal](19, 2) NOT NULL,
	[Tax] [decimal](19, 2) NOT NULL,
	[TotalAfterTax] [decimal](19, 2) NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder_1] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [Name], [Description], [InvocationDate], [SupervisorId]) VALUES (1, N'Accounting', N'Accounting department', CAST(N'2020-03-01' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description], [InvocationDate], [SupervisorId]) VALUES (2, N'Human Resources', N'Human Resources', CAST(N'2020-03-01' AS Date), 2)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description], [InvocationDate], [SupervisorId]) VALUES (3, N'Marketing', N'Marketing department', CAST(N'2020-03-01' AS Date), 3)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description], [InvocationDate], [SupervisorId]) VALUES (4, N'Management', N'Management', CAST(N'2020-03-01' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200003, N'102030405', N'William', N'A', N'Frank', N'ABC Street', N'Moncton', N'E1B1K8', CAST(N'2020-03-01' AS Date), N'5061234567', N'2345678293', N'frankwilliam@mail.ca', 1, 4, NULL, 1, CAST(N'2020-03-01T10:00:00.000' AS DateTime), 1, N'Brandenburg', N'Germany', CAST(N'1990-10-10' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200004, N'102030405', N'Ward', N' ', N'Lexie', N'ABC Street', N'Moncton', N'E1B1K8', CAST(N'2020-10-10' AS Date), N'5061234567', N'1025823945', N'lexieward@mail.ca', 1, 4, NULL, 1, CAST(N'2020-03-01T10:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-10-10' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200005, N'50538246453', N'Wegener', N' ', N'Kevin', N'111 Parkdale Drive', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'kevinwnb@gmail.com', 1, 2, 1, 1, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1996-03-17' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200006, N'40436598348', N'Smith', N' ', N'Frank', N'106 Parkdale Drive', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'franksmithtestmail@gmail.com', 1, 4, NULL, 1, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200007, N'32679345724', N'William', N' ', N'James', N'123 Main Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'jameswilliam@mail.com', 2, 1, 2, 1, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200008, N'32679345724', N'Willson', N' ', N'Fred', N'321 Lower Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'fredwillson@mail.com', 2, 3, NULL, 1, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200009, N'94730648723', N'Gutenberg', N' ', N'Mark', N'135 Main Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'markgutenberg@mail.com', 3, 2, 3, 3, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200010, N'86325782310', N'Lopez', N' ', N'Jason', N'427 Main Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'jasonlopez@mail.com', 3, 4, NULL, 3, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200011, N'57295873031', N'Acker', N' ', N'Harry', N'984 Main Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'harryacker@mail.com', 1, 4, NULL, 1, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
INSERT [dbo].[Employee] ([EmployeeId], [SIN], [LastName], [MiddleInitial], [FirstName], [StreetAddress], [City], [PostalCode], [SeniorityDate], [WorkPhoneNumber], [CellPhoneNumber], [EmailAddress], [DepartmentId], [EmployeeType], [SupervisorId], [JobId], [JobStartDate], [Status], [Province], [Country], [DateOfBirth]) VALUES (20200012, N'58297564011', N'Baker', N' ', N'George', N'385 Main Street', N'Moncton', N'E1C4K8', CAST(N'2019-10-10' AS Date), N'555 345 1234', N'525 678 4362', N'georgebaker@mail.com', 3, 4, NULL, 3, CAST(N'2019-09-09T00:00:00.000' AS DateTime), 2, N'NB', N'Canada', CAST(N'1990-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (1, N'Papers', N'White papers', CAST(10.50 AS Decimal(19, 2)), N'Walmart', 0, N'Out of papers', 3, 1, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (2, N'Pencils', N'german pencils', CAST(2.35 AS Decimal(19, 2)), N'Walmart', 0, N'We need pencils', 2, 1, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (3, N'Wooden pencil holder', N'No longer needed', CAST(0.00 AS Decimal(19, 2)), N'Walmart', 2, N'To hold the pencils', 0, 2, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (4, N'Pen holder', N'pen holder', CAST(3.00 AS Decimal(19, 2)), N'Walmart', 1, N'to hold pens', 3, 2, N'')
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (5, N'Some item', N'No longer needed', CAST(0.00 AS Decimal(19, 2)), N'Walmart', 2, N'some justification', 0, 3, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (6, N'Blue papers', N'blue papers pack', CAST(3.75 AS Decimal(19, 2)), N'Walmart', 2, N'out of papers', 3, 2, N'Not needed')
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (7, N'Some item 2', N'some item 2', CAST(1.00 AS Decimal(19, 2)), N'Walmart', 0, N'some justification 2', 1, 4, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (8, N'Yellow paper', N'pack of yellow papers', CAST(2.30 AS Decimal(19, 2)), N'Walmart', 1, N'out of yellow papers', 3, 5, N'')
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (9, N'Clips', N'No longer needed', CAST(0.00 AS Decimal(19, 2)), N'Walmart', 2, N'out of clips', 0, 5, N'')
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (10, N'White paper', N'pack of white papers', CAST(2.55 AS Decimal(19, 2)), N'Walmart', 0, N'out of papers', 3, 6, N'more needed')
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (11, N'Clips', N'No longer needed', CAST(0.00 AS Decimal(19, 2)), N'Staples', 2, N'out of clips', 4, 7, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (226, N'Business Card Holder', N'for displaying cards', CAST(1.96 AS Decimal(19, 2)), N'Staples', 0, N'get rid of clutter', 1, 148, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (227, N'Letter Tray Set', N'for holding incoming mail', CAST(5.76 AS Decimal(19, 2)), N'Staples', 0, N'other one is broken', 1, 148, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (228, N'Erasable Markers', N'box: Multi-Colored', CAST(3.98 AS Decimal(19, 2)), N'Staples', 0, N'ran out', 2, 148, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (229, N'Desk Organize', N'Oak', CAST(74.16 AS Decimal(19, 2)), N'Staples', 0, N'to organize', 1, 149, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (230, N'Pencil Holder', N'black mesh', CAST(5.99 AS Decimal(19, 2)), N'Staples', 0, N'need one', 1, 149, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (231, N'File Sorters', N'value desk order', CAST(4.99 AS Decimal(19, 2)), N'Staples', 0, N'replacing broken one', 1, 149, NULL)
INSERT [dbo].[Item] ([ItemId], [Name], [Description], [Price], [Location], [Status], [Justification], [Quantity], [PurchaseOrderId], [Reason]) VALUES (232, N'Pencils', N'special art pencils', CAST(3.99 AS Decimal(19, 2)), N'Staples', 0, N'need more', 3, 149, NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([JobId], [Name]) VALUES (1, N'Accountant')
INSERT [dbo].[Job] ([JobId], [Name]) VALUES (2, N'Human Resources')
INSERT [dbo].[Job] ([JobId], [Name]) VALUES (3, N'Marketer')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200007, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200008, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200004, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200005, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200006, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200009, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200010, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200011, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
INSERT [dbo].[Login] ([EmployeeId], [Password]) VALUES (20200012, N'Xr4ilOzQ4PCOq3aQ0qbuaQ==')
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (1, CAST(N'2020-06-10' AS Date), 20200008, N'Human Resources', 0, CAST(36.20 AS Decimal(19, 2)), CAST(5.43 AS Decimal(19, 2)), CAST(41.63 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (2, CAST(N'2020-06-11' AS Date), 20200006, N'Accounting', 2, CAST(20.25 AS Decimal(19, 2)), CAST(3.04 AS Decimal(19, 2)), CAST(23.29 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (3, CAST(N'2020-06-11' AS Date), 20200006, N'Accounting', 0, CAST(7.00 AS Decimal(19, 2)), CAST(1.05 AS Decimal(19, 2)), CAST(8.05 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (4, CAST(N'2020-06-11' AS Date), 20200005, N'Accounting', 0, CAST(1.00 AS Decimal(19, 2)), CAST(0.15 AS Decimal(19, 2)), CAST(1.15 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (5, CAST(N'2020-06-11' AS Date), 20200008, N'Human Resources', 2, CAST(11.80 AS Decimal(19, 2)), CAST(1.77 AS Decimal(19, 2)), CAST(13.57 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (6, CAST(N'2020-06-11' AS Date), 20200006, N'Accounting', 0, CAST(7.65 AS Decimal(19, 2)), CAST(1.15 AS Decimal(19, 2)), CAST(8.80 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (7, CAST(N'2020-06-24' AS Date), 20200008, N'Human Resources', 0, CAST(0.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (148, CAST(N'2020-05-27' AS Date), 20200006, N'Accounting', 0, CAST(15.68 AS Decimal(19, 2)), CAST(2.35 AS Decimal(19, 2)), CAST(18.03 AS Decimal(19, 2)))
INSERT [dbo].[PurchaseOrder] ([PurchaseOrderId], [CreationDate], [EmployeeId], [Department], [Status], [Subtotal], [Tax], [TotalAfterTax]) VALUES (149, CAST(N'2020-05-27' AS Date), 20200006, N'Accounting', 0, CAST(97.11 AS Decimal(19, 2)), CAST(14.57 AS Decimal(19, 2)), CAST(111.68 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Job] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([JobId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Job]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_PurchaseOrder] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_PurchaseOrder]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Employee1]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Employee1]
GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentLookups]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentLookups]
AS
BEGIN
SELECT DepartmentId, Name FROM Department
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeCountByDepartment]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEmployeeCountByDepartment]
@DepartmentId INT,
@SupervisorId INT
AS
BEGIN
SELECT COUNT(*) FROM Employee WHERE  DepartmentId = @DepartmentId AND SupervisorId = @SupervisorId
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeEmail]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetEmployeeEmail]
	@EmployeeId INT
AS
BEGIN
	SELECT EmailAddress FROM Employee WHERE EmployeeId = @EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeInformation]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEmployeeInformation]
@EmployeeId INT
AS
BEGIN
SELECT emp1.EmployeeId
      ,emp1.SIN
      ,emp1.LastName
      ,emp1.MiddleInitial
      ,emp1.FirstName
      ,emp1.DateOfBirth
      ,emp1.Country
      ,emp1.Province
      ,emp1.StreetAddress
      ,emp1.City
      ,emp1.PostalCode
      ,emp1.SeniorityDate
      ,emp1.WorkPhoneNumber
      ,emp1.CellPhoneNumber
      ,emp1.EmailAddress
      ,Department.Name AS DepartmentName
      ,emp1.EmployeeType
	  ,emp2.SupervisorId
      ,emp2.LastName + ', ' + emp2.FirstName AS Supervisor
      ,Job.Name AS JobPosition
      ,emp1.JobStartDate
      ,emp1.TimeStamp
      ,emp1.Status
  FROM Employee emp1 JOIN Job ON emp1.JobId = Job.JobId
  JOIN Department ON emp1.DepartmentId = Department.DepartmentId
  JOIN Employee emp2 ON emp1.EmployeeId = emp2.EmployeeId
   WHERE emp1.EmployeeId = @EmployeeId
  END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeName]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetEmployeeName]
	@EmployeeId INT
AS
BEGIN
	SELECT FirstName + ' ' + LastName AS Name FROM Employee WHERE EmployeeId = @EmployeeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetItem]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetItem]
	@PurchaseOrderId INT,
	@ItemName NVARCHAR(50)
AS
BEGIN
	SELECT * FROM Item WHERE PurchaseOrderId = @PurchaseOrderId AND Name = @ItemName
END
GO
/****** Object:  StoredProcedure [dbo].[GetItemStatus]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetItemStatus]
	@ItemId INT
AS
BEGIN
	SELECT Status FROM Item WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[GetJobs]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJobs]
AS
BEGIN
SELECT * FROM Job
END
GO
/****** Object:  StoredProcedure [dbo].[GetLoginInformation]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetLoginInformation]
	@EmployeeId INT,
	@Password NVARCHAR(50)
AS
BEGIN
	SELECT
		Login.EmployeeId,
		Employee.FirstName + ' ' + Employee.LastName AS EmployeeName,
		Employee.Status,
		Employee.EmployeeType,
		Department.Name AS Department
	FROM
		Login
	INNER JOIN
		Employee
	ON
		Login.EmployeeId = Employee.EmployeeId
	INNER JOIN
		Department
	ON
		Employee.DepartmentId = Department.DepartmentId
	WHERE
		Login.EmployeeId = @EmployeeId AND Login.Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[GetRegularEmployees]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRegularEmployees]
@DepartmentId INT
AS
BEGIN
SELECT EmployeeId, FirstName + ', ' + LastName AS FullName FROM Employee
WHERE EmployeeType IN (2)
AND DepartmentId = @DepartmentId
END
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisorName]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[GetSupervisorName]
	@EmployeeId INT
AS
BEGIN
	SELECT FirstName + ' ' + LastName AS Name FROM Employee
	INNER JOIN
	Department ON Employee.DepartmentId = Department.DepartmentId
	WHERE Employee.SupervisorId = (SELECT SupervisorId FROM Department WHERE DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId))
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Delete]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Item_Delete]
	@ItemId INT
AS
BEGIN
	DELETE FROM Item WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Insert]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Item_Insert]
	@Name NVARCHAR(50),
	@Description NVARCHAR(255),
	@Price DECIMAL(19,2),
	@Location NVARCHAR(255),
	@Status INT,
	@Justification NVARCHAR(255),
	@Quantity INT,
	@PurchaseOrderId INT
AS
BEGIN
	INSERT INTO Item (Name, Description, Price, Location, Status, Justification, Quantity, PurchaseOrderId)
	VALUES (@Name, @Description, @Price, @Location, @Status, @Justification, @Quantity, @PurchaseOrderId)
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Update]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[Item_Update]
	@ItemId INT,
	@Name NVARCHAR(50),
	@Description NVARCHAR(255),
	@Price DECIMAL(19,2),
	@Location NVARCHAR(255),
	@Status INT,
	@Justification NVARCHAR(255),
	@Quantity INT,
	@PurchaseOrderId INT
AS
BEGIN
	UPDATE Item SET Name = @Name, Description = @Description, Price = @Price, Location = @Location, Status = @Status, Justification = @Justification, Quantity = @Quantity WHERE ItemId = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[PO_Browse_Search]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_Browse_Search]
	@EmployeeId INT,
	@PurchaseOrderIdSearch INT = NULL,
	@POStatus INT = NULL,
	@StartDate DATE,
	@EndDate DATETIME
AS
BEGIN
	IF (SELECT SupervisorId FROM Employee WHERE EmployeeId = @EmployeeId) IS NULL
	BEGIN
		IF @POStatus = 0
		BEGIN
			SELECT * FROM PurchaseOrder
			WHERE (CreationDate >= @StartDate AND CreationDate <= @EndDate)
			AND (([Status] = @POStatus)
			OR ([Status] = 1))
			AND (@PurchaseOrderIdSearch IS NULL OR PurchaseOrderId LIKE @PurchaseOrderIdSearch)
			AND EmployeeId = @EmployeeId
			ORDER BY CreationDate DESC, PurchaseOrderId DESC
		END
		ELSE
		BEGIN
			SELECT * FROM PurchaseOrder
			WHERE (CreationDate >= @StartDate AND CreationDate <= @EndDate)
			AND (@POStatus IS NULL OR [Status] = @POStatus)
			AND (@PurchaseOrderIdSearch IS NULL OR PurchaseOrderId LIKE @PurchaseOrderIdSearch)
			AND EmployeeId = @EmployeeId
			ORDER BY CreationDate DESC, PurchaseOrderId DESC
		END
	END
	ELSE
	BEGIN
		IF @POStatus = 0
		BEGIN
			SELECT * FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			WHERE (PurchaseOrder.CreationDate >= @StartDate AND PurchaseOrder.CreationDate <= @EndDate)
			AND ((PurchaseOrder.[Status] = @POStatus)
			OR (PurchaseOrder.[Status] = 1))
			AND (@PurchaseOrderIdSearch IS NULL OR PurchaseOrderId LIKE @PurchaseOrderIdSearch)
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			ORDER BY CreationDate DESC, PurchaseOrderId DESC
		END
		ELSE
		BEGIN
			SELECT * FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			WHERE (PurchaseOrder.CreationDate >= @StartDate AND PurchaseOrder.CreationDate <= @EndDate)
			AND (@POStatus IS NULL OR PurchaseOrder.[Status] = @POStatus)
			AND (@PurchaseOrderIdSearch IS NULL OR PurchaseOrderId LIKE @PurchaseOrderIdSearch)
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			ORDER BY CreationDate DESC, PurchaseOrderId DESC
		END
	END
END

SELECT * FROM PurchaseOrder
GO
/****** Object:  StoredProcedure [dbo].[PO_GetById]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_GetById]
	@PurchaseOrderId INT
AS
BEGIN
	SELECT * FROM PurchaseOrder WHERE PurchaseOrderId = @PurchaseOrderId
END
GO
/****** Object:  StoredProcedure [dbo].[PO_GetItems]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_GetItems]
	@PurchaseOrderId INT
AS
BEGIN
	SELECT ItemId, Name, Description, Price, Location, Status, Justification, Quantity, PurchaseOrderId, Reason FROM Item WHERE PurchaseOrderId = @PurchaseOrderId
END
GO
/****** Object:  StoredProcedure [dbo].[PO_Insert]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_Insert]
	@PurchaseOrderId INT OUTPUT,
	@CreationDate DATE,
	@EmployeeId INT,
	@Department NVARCHAR(30),
	@Status INT,
	@Subtotal DECIMAL(19,2),
	@Tax DECIMAL(19,2),
	@TotalAfterTax DECIMAL(19,2),
	@ItemName NVARCHAR(50),
	@ItemDescription NVARCHAR(255),
	@ItemPrice DECIMAL(19,2),
	@ItemLocation NVARCHAR(255),
	@ItemStatus INT,
	@ItemJustification NVARCHAR(255),
	@ItemQuantity INT
AS
BEGIN
BEGIN TRY
    BEGIN TRANSACTION
		--DECLARE @Division INT
		--SET @Division = 3/0
		INSERT INTO PurchaseOrder (CreationDate, EmployeeId, Department, Status, Subtotal, Tax, TotalAfterTax) VALUES (@CreationDate, @EmployeeId, @Department, @Status, @Subtotal, @Tax, @TotalAfterTax)
		DECLARE @LastId INT;
		SET @LastId = SCOPE_IDENTITY();
		SET @PurchaseOrderId = @LastId;
		INSERT INTO Item (Name, Description, Price, Location, Status, Justification, Quantity, PurchaseOrderId) VALUES (@ItemName, @ItemDescription, @ItemPrice, @ItemLocation, @ItemStatus, @ItemJustification, @ItemQuantity, @LastId)
    COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

		;THROW 50001, 'Transaction was not complete', 1
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[PO_Search]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_Search]
	@SearchBy INT,
	@PurchaseOrderId INT,
	@StartDate DATE,
	@EndDate DATE,
	@EmployeeId INT,
	@Status INT = NULL
AS
BEGIN
	IF @SearchBy = 1
	BEGIN
		SELECT PurchaseOrderId, CreationDate, PurchaseOrder.TotalAfterTax AS 'TotalAfterTax', PurchaseOrder.EmployeeId FROM PurchaseOrder
		INNER JOIN
		Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
		INNER JOIN
		Department ON Employee.DepartmentId = Department.DepartmentId
		WHERE PurchaseOrderId = @PurchaseOrderId
		AND Employee.DepartmentId = (SELECT TOP 1 Department.DepartmentId FROM Department INNER JOIN Employee ON Department.DepartmentId = Employee.DepartmentId WHERE Employee.EmployeeId = @EmployeeId)
		ORDER BY CreationDate DESC, PurchaseOrder.PurchaseOrderId DESC
	END
	ELSE
	BEGIN
		IF @Status = 0
		BEGIN
			SELECT PurchaseOrderId, CreationDate, PurchaseOrder.TotalAfterTax AS 'TotalAfterTax', PurchaseOrder.EmployeeId FROM PurchaseOrder
			INNER JOIN
			Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN
			Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE CreationDate >= @StartDate AND CreationDate <= @EndDate
			AND ((PurchaseOrder.[Status] = @Status)
			OR (PurchaseOrder.[Status] = 1))
			AND Employee.DepartmentId = (SELECT TOP 1 Department.DepartmentId FROM Department INNER JOIN Employee ON Department.DepartmentId = Employee.DepartmentId WHERE Employee.EmployeeId = @EmployeeId)
			ORDER BY CreationDate DESC, PurchaseOrder.PurchaseOrderId DESC
		END
		ELSE
		BEGIN
			SELECT PurchaseOrderId, CreationDate, PurchaseOrder.TotalAfterTax AS 'TotalAfterTax', PurchaseOrder.EmployeeId FROM PurchaseOrder
			INNER JOIN
			Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN
			Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE CreationDate >= @StartDate AND CreationDate <= @EndDate
			AND (@Status IS NULL OR PurchaseOrder.[Status] = @Status)
			AND Employee.DepartmentId = (SELECT TOP 1 Department.DepartmentId FROM Department INNER JOIN Employee ON Department.DepartmentId = Employee.DepartmentId WHERE Employee.EmployeeId = @EmployeeId)
			ORDER BY CreationDate DESC, PurchaseOrder.PurchaseOrderId DESC
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PO_SearchProcess]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_SearchProcess]
	@EmployeeId INT,
	@SearchCriteria NVARCHAR(255) = NULL,
	@StartDate DATE = NULL,
	@EndDate DATE = NULL,
	@Status INT = NULL
AS
BEGIN
	IF @Status = 0
	BEGIN
		IF ISNUMERIC(@SearchCriteria) = 1
		BEGIN
			SELECT PurchaseOrder.PurchaseOrderId, Employee.FirstName + ' ' + Employee.LastName AS Name, PurchaseOrder.CreationDate, PurchaseOrder.TotalAfterTax FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE (@SearchCriteria IS NULL OR PurchaseOrder.PurchaseOrderId LIKE CONVERT(int, @SearchCriteria))
			AND (PurchaseOrder.CreationDate >= @StartDate OR @StartDate IS NULL)
			AND (PurchaseOrder.CreationDate <= @EndDate OR @EndDate IS NULL)
			AND ((PurchaseOrder.[Status] = 0 OR PurchaseOrder.[Status] = 1))
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			AND PurchaseOrder.EmployeeId <> @EmployeeId
			ORDER BY
			CASE WHEN @Status IS NOT NULL THEN PurchaseOrder.CreationDate END
		END
		ELSE
		BEGIN
			SELECT PurchaseOrder.PurchaseOrderId, Employee.FirstName + ' ' + Employee.LastName AS Name, PurchaseOrder.CreationDate, PurchaseOrder.TotalAfterTax FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE (@SearchCriteria IS NULL OR (Employee.FirstName + ' ' + Employee.LastName) LIKE CONCAT('%', @SearchCriteria, '%'))
			AND (PurchaseOrder.CreationDate >= @StartDate OR @StartDate IS NULL)
			AND (PurchaseOrder.CreationDate <= @EndDate OR @EndDate IS NULL)
			AND ((PurchaseOrder.[Status] = 0 OR PurchaseOrder.[Status] = 1))
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			AND PurchaseOrder.EmployeeId <> @EmployeeId
			ORDER BY
			CASE WHEN @Status IS NOT NULL THEN PurchaseOrder.CreationDate END
		END
	END
	ELSE
	BEGIN
		IF ISNUMERIC(@SearchCriteria) = 1
		BEGIN
			SELECT PurchaseOrder.PurchaseOrderId, Employee.FirstName + ' ' + Employee.LastName AS Name, PurchaseOrder.CreationDate, PurchaseOrder.TotalAfterTax FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE (@SearchCriteria IS NULL OR CONVERT(int, @SearchCriteria) LIKE PurchaseOrder.PurchaseOrderId)
			AND (PurchaseOrder.CreationDate >= @StartDate OR @StartDate IS NULL)
			AND (PurchaseOrder.CreationDate <= @EndDate OR @EndDate IS NULL)
			AND (PurchaseOrder.[Status] = @Status OR @Status IS NULL)
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			AND PurchaseOrder.EmployeeId <> @EmployeeId
			ORDER BY
			CASE WHEN @Status IS NOT NULL THEN PurchaseOrder.CreationDate END
		END
		ELSE
		BEGIN
			SELECT PurchaseOrder.PurchaseOrderId, Employee.FirstName + ' ' + Employee.LastName AS Name, PurchaseOrder.CreationDate, PurchaseOrder.TotalAfterTax FROM PurchaseOrder
			INNER JOIN Employee ON PurchaseOrder.EmployeeId = Employee.EmployeeId
			INNER JOIN Department ON Employee.DepartmentId = Department.DepartmentId
			WHERE (@SearchCriteria IS NULL OR (Employee.FirstName + ' ' + Employee.LastName) LIKE CONCAT('%', @SearchCriteria, '%'))
			AND (PurchaseOrder.CreationDate >= @StartDate OR @StartDate IS NULL)
			AND (PurchaseOrder.CreationDate <= @EndDate OR @EndDate IS NULL)
			AND (PurchaseOrder.[Status] = @Status OR @Status IS NULL)
			AND Employee.DepartmentId = (SELECT DepartmentId FROM Employee WHERE EmployeeId = @EmployeeId)
			AND PurchaseOrder.EmployeeId <> @EmployeeId
			ORDER BY
			CASE WHEN @Status IS NOT NULL THEN PurchaseOrder.CreationDate END
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PO_Update]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PO_Update]
	@TimeStamp TIMESTAMP OUTPUT,
	@PurchaseOrderId INT,
	@Status INT,
	@Subtotal DECIMAL(19,2),
	@Tax DECIMAL(19,2),
	@TotalAfterTax DECIMAL(19,2)
AS
BEGIN
	IF (SELECT TimeStamp FROM PurchaseOrder WHERE PurchaseOrderId = @PurchaseOrderId) <> @TimeStamp
		THROW 50001, 'Your version is behind, please retrieve the current version first', 1
	ELSE
	BEGIN
		UPDATE PurchaseOrder SET Status = @Status, Subtotal = @Subtotal, Tax = @Tax, TotalAfterTax = @TotalAfterTax WHERE PurchaseOrderId = @PurchaseOrderId
		SET @TimeStamp = (SELECT [TimeStamp] FROM PurchaseOrder WHERE PurchaseOrderId = @PurchaseOrderId)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PO_UpdateCreate]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROC [dbo].[PO_UpdateCreate]
	@PurchaseOrderId INT,
	@Subtotal DECIMAL(19,2),
	@Tax DECIMAL(19,2),
	@TotalAfterTax DECIMAL(19,2)
AS
BEGIN
	UPDATE PurchaseOrder SET Subtotal = @Subtotal, Tax = @Tax, TotalAfterTax = @TotalAfterTax WHERE PurchaseOrderId = @PurchaseOrderId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemReason]    Script Date: 2020-06-24 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[UpdateItemReason]
	@ItemId INT,
	@Reason NVARCHAR(255)
AS
BEGIN
	UPDATE Item SET Reason = @Reason WHERE ItemId = @ItemId
END
GO
USE [master]
GO
ALTER DATABASE [BlueBank] SET  READ_WRITE 
GO
