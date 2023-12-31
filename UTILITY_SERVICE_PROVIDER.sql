USE [master]
GO
/****** Object:  Database [UTILITY SERVICE PROVIDER]    Script Date: 2023-04-06 6:16:36 PM ******/
CREATE DATABASE [UTILITY SERVICE PROVIDER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UTILITY SERVICE PROVIDER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UTILITY SERVICE PROVIDER.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UTILITY SERVICE PROVIDER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UTILITY SERVICE PROVIDER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UTILITY SERVICE PROVIDER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ARITHABORT OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET  MULTI_USER 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET QUERY_STORE = ON
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UTILITY SERVICE PROVIDER]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [varchar](128) NOT NULL,
	[StreetNumber] [varchar](128) NOT NULL,
	[StreetName] [varchar](128) NOT NULL,
	[City] [varchar](128) NOT NULL,
	[Province] [varchar](128) NOT NULL,
	[PostalCode] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CustomerFirstname] [varchar](128) NOT NULL,
	[CustomerMidname] [varchar](128) NULL,
	[CustomerLastname] [varchar](128) NOT NULL,
	[CustomerEmail] [varchar](128) NOT NULL,
	[CustomerContactID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[DateCreated] [date] NOT NULL,
 CONSTRAINT [PK_CustomerAccount] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerContact]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerContact](
	[CustomerContactID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerContactNumberPrimary] [numeric](10, 0) NOT NULL,
	[CustomerContactNumberSecondary] [numeric](10, 0) NULL,
	[CustomerContactNumberTertiary] [numeric](10, 0) NULL,
 CONSTRAINT [PK_CustomerContact] PRIMARY KEY CLUSTERED 
(
	[CustomerContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerBill]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerBill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RateID] [int] NOT NULL,
	[TaxRateID] [int] NOT NULL,
	[MeterReadingID] [int] NOT NULL,
	[OverdueID] [int] NOT NULL,
	[StatementDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerBill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterReading]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterReading](
	[MeterReadingID] [int] IDENTITY(1,1) NOT NULL,
	[StartMeterReading] [numeric](18, 2) NOT NULL,
	[EndMeterReading] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_MeterReading] PRIMARY KEY CLUSTERED 
(
	[MeterReadingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Overdue]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Overdue](
	[OverdueID] [int] IDENTITY(1,1) NOT NULL,
	[OverdueAmount] [money] NOT NULL,
 CONSTRAINT [PK_Overdue] PRIMARY KEY CLUSTERED 
(
	[OverdueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[BusinessName] [varchar](128) NOT NULL,
	[BusinessContactNumber] [varchar](128) NOT NULL,
	[BusinessContactType] [varchar](128) NOT NULL,
	[BusinessEmail] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesRate]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesRate](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ServiceType] [varchar](128) NOT NULL,
	[ServiceRate] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_ServicesRate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxRate]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxRate](
	[TaxRateID] [int] IDENTITY(1,1) NOT NULL,
	[Province] [varchar](128) NOT NULL,
	[TaxRate] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_TaxRate] PRIMARY KEY CLUSTERED 
(
	[TaxRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalAmountDue]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalAmountDue](
	[RateID] [int] NOT NULL,
	[TaxRateID] [int] NOT NULL,
	[MeterReadingID] [int] NOT NULL,
	[OverdueID] [int] NOT NULL,
	[TotalAmountDue] [money] NOT NULL,
 CONSTRAINT [PK_TotalAmountDue] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC,
	[TaxRateID] ASC,
	[MeterReadingID] ASC,
	[OverdueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CUSTOMER_BILL_PROFILE]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CUSTOMER_BILL_PROFILE]
AS
SELECT    cb.BillID, c.CustomerFirstname, c.CustomerLastname, cc.CustomerContactNumberPrimary, ca.StreetNumber AS CustomerStreetNumber, 
                   ca.StreetName AS CustomerStreetName, ca.City AS CustomerCity, p.BusinessName, p.BusinessContactNumber, 
                   pa.StreetNumber AS ProviderStreetNumber, pa.StreetName AS ProviderStreetName, pa.City AS ProviderCity, sr.ServiceType, 
                   mr.StartMeterReading, mr.EndMeterReading, sr.ServiceRate, tr.TaxRate, o.OverdueAmount, tad.TotalAmountDue, cb.StatementDate, 
                   cb.DueDate
FROM        dbo.Customer AS c INNER JOIN
                   dbo.Address AS ca ON c.AddressID = ca.AddressID INNER JOIN
                   dbo.CustomerContact AS cc ON c.CustomerContactID = cc.CustomerContactID INNER JOIN
                   dbo.CustomerAccount AS caa ON c.CustomerID = caa.CustomerID INNER JOIN
                   dbo.Provider AS p ON caa.ProviderID = p.ProviderID INNER JOIN
                   dbo.Address AS pa ON p.AddressID = pa.AddressID INNER JOIN
                   dbo.ServicesRate AS sr ON p.ProviderID = sr.ProviderID INNER JOIN
                   dbo.CustomerBill AS cb ON caa.AccountID = cb.AccountID AND sr.RateID = cb.RateID INNER JOIN
                   dbo.MeterReading AS mr ON cb.MeterReadingID = mr.MeterReadingID INNER JOIN
                   dbo.Overdue AS o ON cb.OverdueID = o.OverdueID INNER JOIN
                   dbo.TaxRate AS tr ON cb.TaxRateID = tr.TaxRateID INNER JOIN
                   dbo.TotalAmountDue AS tad ON cb.RateID = tad.RateID AND cb.TaxRateID = tad.TaxRateID AND 
                   cb.MeterReadingID = tad.MeterReadingID AND cb.OverdueID = tad.OverdueID
GO
/****** Object:  Table [dbo].[ProviderSales]    Script Date: 2023-04-06 6:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderSales](
	[TranstractionID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ReceivedDate] [date] NOT NULL,
	[AmountReceived] [money] NOT NULL,
 CONSTRAINT [PK_ProviderSales] PRIMARY KEY CLUSTERED 
(
	[TranstractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (1, N'Home', N'123', N'apple st', N'Windsor', N'ON', N'N9A B1C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (2, N'Home', N'124', N'banana st', N'Windsor', N'ON', N'N9A B2C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (3, N'Home', N'125', N'peach st', N'Windsor', N'ON', N'N9A B3C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (4, N'Office', N'126', N'orange st', N'Windsor', N'ON', N'N9A B4C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (5, N'Office', N'127', N'grape st', N'Windsor', N'ON', N'N9A B5C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (6, N'Office', N'128', N'lemon st', N'Windsor', N'ON', N'N9A B6C')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (7, N'Home', N'999', N'Asd St', N'Windsor', N'ON', N'N9A 2L8')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (8, N'Home', N'888', N'Top St', N'Windsor', N'ON', N'N9A 2L9')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (9, N'Home', N'777', N'Qwer St', N'Windsor', N'ON', N'N9A 2L1')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (10, N'Home', N'666', N'Yuio St', N'Windsor', N'ON', N'N9A 2L2')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (11, N'Home', N'555', N'Jio St', N'Windsor', N'ON', N'N9A 2L3')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (12, N'Home', N'444', N'Ree St', N'Windsor', N'ON', N'N9A 2L4')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (13, N'Home', N'333', N'Opp St', N'Windsor', N'ON', N'N9A 2L5')
INSERT [dbo].[Address] ([AddressID], [AddressType], [StreetNumber], [StreetName], [City], [Province], [PostalCode]) VALUES (14, N'Home', N'222', N'Tre St', N'Windsor', N'ON', N'N9A 2L6')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10001, 1, N'Mark', N'Ben', N'abc1', N'101@gmail.com', 1)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10002, 2, N'Thomas', N'Abc', N'abc2', N'102@gmail.com', 2)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10003, 3, N'Mark1', N'', N'abc3', N'103@gmail.com', 3)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10004, 7, N'Alice', NULL, N'Smith', N'alice.smith@example.com', 4)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10005, 8, N'Bob', NULL, N'Johnson', N'bob.johnson@example.com', 5)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10006, 9, N'Charlie', NULL, N'Brown', N'charlie.brown@example.com', 6)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10007, 10, N'David', NULL, N'Lee', N'david.lee@example.com', 7)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10008, 11, N'Eva', NULL, N'Nguyen', N'eva.nguyen@example.com', 8)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10009, 12, N'Frank', NULL, N'Garcia', N'frank.garcia@example.com', 9)
INSERT [dbo].[Customer] ([CustomerID], [AddressID], [CustomerFirstname], [CustomerMidname], [CustomerLastname], [CustomerEmail], [CustomerContactID]) VALUES (10010, 13, N'Grace', N'L', N'Wong', N'grace.wong@example.com', 10)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAccount] ON 

INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30001, 10001, 20001, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30002, 10002, 20001, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30003, 10003, 20002, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30004, 10004, 20001, CAST(N'2022-01-03' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30005, 10004, 20002, CAST(N'2022-01-03' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30006, 10005, 20003, CAST(N'2022-01-03' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30007, 10005, 20001, CAST(N'2022-01-03' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30008, 10006, 20001, CAST(N'2022-09-03' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30009, 10006, 20002, CAST(N'2022-09-01' AS Date))
INSERT [dbo].[CustomerAccount] ([AccountID], [CustomerID], [ProviderID], [DateCreated]) VALUES (30010, 10007, 20003, CAST(N'2022-09-07' AS Date))
SET IDENTITY_INSERT [dbo].[CustomerAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerBill] ON 

INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (3, 30001, 40003, 101, 201, 305, CAST(N'2022-01-01' AS Date), CAST(N'2022-01-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (4, 30003, 40002, 101, 210, 313, CAST(N'2019-03-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (5, 30006, 40010, 101, 201, 1, CAST(N'2023-02-01' AS Date), CAST(N'2023-03-01' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (6, 30003, 40007, 101, 211, 314, CAST(N'2020-03-01' AS Date), CAST(N'2020-04-01' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (7, 30003, 40007, 101, 212, 1, CAST(N'2020-04-01' AS Date), CAST(N'2020-04-30' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (8, 30010, 40011, 101, 202, 1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (9, 30010, 40011, 101, 213, 1, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-28' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (10, 30010, 40011, 101, 214, 1, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (11, 30009, 40005, 101, 201, 311, CAST(N'2019-03-01' AS Date), CAST(N'2019-03-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (12, 30009, 40005, 101, 215, 1, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-30' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (13, 30009, 40005, 101, 216, 1, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (15, 30009, 40005, 101, 217, 2, CAST(N'2019-06-01' AS Date), CAST(N'2019-06-30' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (16, 30009, 40005, 101, 218, 1, CAST(N'2019-07-01' AS Date), CAST(N'2019-07-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (17, 30009, 40011, 101, 222, 1, CAST(N'2022-04-01' AS Date), CAST(N'2022-04-30' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (18, 30001, 40011, 101, 219, 1, CAST(N'2022-02-01' AS Date), CAST(N'2022-02-28' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (19, 30001, 40001, 101, 223, 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-02-28' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (20, 30001, 40011, 101, 224, 1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (21, 30009, 40005, 101, 225, 1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (23, 30004, 40002, 101, 201, 1, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-31' AS Date))
INSERT [dbo].[CustomerBill] ([BillID], [AccountID], [RateID], [TaxRateID], [MeterReadingID], [OverdueID], [StatementDate], [DueDate]) VALUES (24, 30004, 40002, 101, 227, 315, CAST(N'2018-02-01' AS Date), CAST(N'2018-02-28' AS Date))
SET IDENTITY_INSERT [dbo].[CustomerBill] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerContact] ON 

INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (1, CAST(5194561234 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (2, CAST(5192345678 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (3, CAST(5199876543 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (4, CAST(2343223423 AS Numeric(10, 0)), CAST(1111111111 AS Numeric(10, 0)), NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (5, CAST(1234567890 AS Numeric(10, 0)), CAST(4567891230 AS Numeric(10, 0)), NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (6, CAST(9876543210 AS Numeric(10, 0)), CAST(5432167890 AS Numeric(10, 0)), NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (7, CAST(8901234567 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (8, CAST(8769054321 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (9, CAST(9900887766 AS Numeric(10, 0)), NULL, NULL)
INSERT [dbo].[CustomerContact] ([CustomerContactID], [CustomerContactNumberPrimary], [CustomerContactNumberSecondary], [CustomerContactNumberTertiary]) VALUES (10, CAST(7890456123 AS Numeric(10, 0)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerContact] OFF
GO
SET IDENTITY_INSERT [dbo].[MeterReading] ON 

INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (201, CAST(0.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (202, CAST(0.00 AS Numeric(18, 2)), CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (203, CAST(0.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (204, CAST(10.00 AS Numeric(18, 2)), CAST(25.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (205, CAST(25.00 AS Numeric(18, 2)), CAST(45.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (206, CAST(45.00 AS Numeric(18, 2)), CAST(60.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (207, CAST(100.00 AS Numeric(18, 2)), CAST(200.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (208, CAST(10.00 AS Numeric(18, 2)), CAST(20.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (209, CAST(15.00 AS Numeric(18, 2)), CAST(150.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (210, CAST(30.00 AS Numeric(18, 2)), CAST(40.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (211, CAST(40.00 AS Numeric(18, 2)), CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (212, CAST(80.00 AS Numeric(18, 2)), CAST(130.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (213, CAST(20.00 AS Numeric(18, 2)), CAST(50.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (214, CAST(50.00 AS Numeric(18, 2)), CAST(70.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (215, CAST(10.00 AS Numeric(18, 2)), CAST(30.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (216, CAST(30.00 AS Numeric(18, 2)), CAST(55.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (217, CAST(55.00 AS Numeric(18, 2)), CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (218, CAST(80.00 AS Numeric(18, 2)), CAST(103.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (219, CAST(0.00 AS Numeric(18, 2)), CAST(33.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (220, CAST(0.00 AS Numeric(18, 2)), CAST(14.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (221, CAST(0.00 AS Numeric(18, 2)), CAST(23.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (222, CAST(0.00 AS Numeric(18, 2)), CAST(26.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (223, CAST(0.00 AS Numeric(18, 2)), CAST(123.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (224, CAST(0.00 AS Numeric(18, 2)), CAST(34.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (225, CAST(0.00 AS Numeric(18, 2)), CAST(45.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (226, CAST(0.00 AS Numeric(18, 2)), CAST(13.00 AS Numeric(18, 2)))
INSERT [dbo].[MeterReading] ([MeterReadingID], [StartMeterReading], [EndMeterReading]) VALUES (227, CAST(10.00 AS Numeric(18, 2)), CAST(22.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[MeterReading] OFF
GO
SET IDENTITY_INSERT [dbo].[Overdue] ON 

INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (1, 0.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (2, 5.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (301, 0.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (302, 0.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (303, 200.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (304, 123.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (305, 100.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (306, 234.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (307, 9.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (308, 7.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (309, 333.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (310, 12.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (311, 10.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (312, 94.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (313, 20.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (314, 14.0000)
INSERT [dbo].[Overdue] ([OverdueID], [OverdueAmount]) VALUES (315, 2.0000)
SET IDENTITY_INSERT [dbo].[Overdue] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderID], [AddressID], [BusinessName], [BusinessContactNumber], [BusinessContactType], [BusinessEmail]) VALUES (20001, 4, N'abc company', N'519 200 0001', N'MobilePhone', N'qwe@gmail.com')
INSERT [dbo].[Provider] ([ProviderID], [AddressID], [BusinessName], [BusinessContactNumber], [BusinessContactType], [BusinessEmail]) VALUES (20002, 5, N'qwe company', N'519 200 0002', N'MobilePhone', N'iop@gmail.com')
INSERT [dbo].[Provider] ([ProviderID], [AddressID], [BusinessName], [BusinessContactNumber], [BusinessContactType], [BusinessEmail]) VALUES (20003, 6, N'sdf company', N'519 200 0003', N'MobilePhone', N'okm@gmail.com')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[ProviderSales] ON 

INSERT [dbo].[ProviderSales] ([TranstractionID], [AccountID], [ReceivedDate], [AmountReceived]) VALUES (60001, 30001, CAST(N'2023-03-20' AS Date), 260.0000)
SET IDENTITY_INSERT [dbo].[ProviderSales] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicesRate] ON 

INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40001, 20001, N'Water', CAST(0.72 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40002, 20001, N'Natural Gas', CAST(5.65 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40003, 20001, N'Electric', CAST(0.15 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40004, 20001, N'Sewerage', CAST(0.20 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40005, 20002, N'Water', CAST(0.70 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40006, 20002, N'Natural Gas', CAST(5.60 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40007, 20002, N'Electric', CAST(0.20 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40008, 20002, N'Sewerage', CAST(0.15 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40009, 20003, N'Water', CAST(0.76 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40010, 20003, N'Natural Gas', CAST(0.50 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40011, 20003, N'Electric', CAST(0.30 AS Numeric(18, 2)))
INSERT [dbo].[ServicesRate] ([RateID], [ProviderID], [ServiceType], [ServiceRate]) VALUES (40012, 20003, N'Sewerage', CAST(0.10 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[ServicesRate] OFF
GO
SET IDENTITY_INSERT [dbo].[TaxRate] ON 

INSERT [dbo].[TaxRate] ([TaxRateID], [Province], [TaxRate]) VALUES (101, N'ON', CAST(0.13 AS Numeric(18, 2)))
INSERT [dbo].[TaxRate] ([TaxRateID], [Province], [TaxRate]) VALUES (102, N'BC', CAST(0.12 AS Numeric(18, 2)))
INSERT [dbo].[TaxRate] ([TaxRateID], [Province], [TaxRate]) VALUES (103, N'NB', CAST(0.15 AS Numeric(18, 2)))
INSERT [dbo].[TaxRate] ([TaxRateID], [Province], [TaxRate]) VALUES (104, N'AB', CAST(0.05 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[TaxRate] OFF
GO
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40001, 101, 223, 1, 100.0700)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40001, 102, 201, 312, 102.0600)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40001, 102, 205, 2, 300.0000)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40001, 103, 209, 311, 121.7800)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40002, 101, 201, 1, 63.8400)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40002, 101, 210, 313, 83.8400)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40002, 101, 227, 315, 78.6100)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40002, 102, 205, 2, 400.0000)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40003, 101, 201, 305, 101.6900)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 201, 311, 17.9100)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 215, 1, 15.8200)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 216, 1, 19.7700)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 217, 1, 19.7700)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 217, 2, 24.7700)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 218, 1, 18.1900)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40005, 101, 225, 1, 35.5900)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40007, 101, 211, 314, 23.0400)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40007, 101, 212, 1, 11.3000)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40008, 101, 226, 2, 7.2000)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40010, 101, 201, 1, 5.6500)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 201, 1, 3.3900)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 202, 1, 6.7800)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 213, 1, 10.1700)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 214, 1, 6.7800)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 219, 1, 11.1900)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 220, 1, 4.7500)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 222, 1, 8.8100)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40011, 101, 224, 1, 11.5300)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40012, 101, 201, 1, 1.1300)
INSERT [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID], [TotalAmountDue]) VALUES (40012, 101, 201, 310, 13.1300)
GO
/****** Object:  Index [Address_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Address_1] ON [dbo].[Address]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Customer_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Customer_1] ON [dbo].[Customer]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Customer_2]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [Customer_2] ON [dbo].[Customer]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Customer_3]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [Customer_3] ON [dbo].[Customer]
(
	[CustomerContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CustomerAccount_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CustomerAccount_1] ON [dbo].[CustomerAccount]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CustomerAccount_2]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [CustomerAccount_2] ON [dbo].[CustomerAccount]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CustomerAccount_3]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [CustomerAccount_3] ON [dbo].[CustomerAccount]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CustomerContact_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CustomerContact_1] ON [dbo].[CustomerContact]
(
	[CustomerContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Provider_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Provider_1] ON [dbo].[Provider]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Provider_2]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [Provider_2] ON [dbo].[Provider]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProviderSales_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [ProviderSales_1] ON [dbo].[ProviderSales]
(
	[TranstractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProviderSales_2]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [ProviderSales_2] ON [dbo].[ProviderSales]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ServicesRate_1]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [ServicesRate_1] ON [dbo].[ServicesRate]
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ServicesRate_2]    Script Date: 2023-04-06 6:16:37 PM ******/
CREATE NONCLUSTERED INDEX [ServicesRate_2] ON [dbo].[ServicesRate]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uc_TotalAmountDue]    Script Date: 2023-04-06 6:16:37 PM ******/
ALTER TABLE [dbo].[TotalAmountDue] ADD  CONSTRAINT [uc_TotalAmountDue] UNIQUE NONCLUSTERED 
(
	[RateID] ASC,
	[TaxRateID] ASC,
	[MeterReadingID] ASC,
	[OverdueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Address]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerContact] FOREIGN KEY([CustomerContactID])
REFERENCES [dbo].[CustomerContact] ([CustomerContactID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerContact]
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBill_CustomerAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[CustomerAccount] ([AccountID])
GO
ALTER TABLE [dbo].[CustomerBill] CHECK CONSTRAINT [FK_CustomerBill_CustomerAccount]
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBill_TotalAmountDue] FOREIGN KEY([RateID], [TaxRateID], [MeterReadingID], [OverdueID])
REFERENCES [dbo].[TotalAmountDue] ([RateID], [TaxRateID], [MeterReadingID], [OverdueID])
GO
ALTER TABLE [dbo].[CustomerBill] CHECK CONSTRAINT [FK_CustomerBill_TotalAmountDue]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_Address]
GO
ALTER TABLE [dbo].[ProviderSales]  WITH CHECK ADD  CONSTRAINT [FK_ProviderSales_CustomerAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[CustomerAccount] ([AccountID])
GO
ALTER TABLE [dbo].[ProviderSales] CHECK CONSTRAINT [FK_ProviderSales_CustomerAccount]
GO
ALTER TABLE [dbo].[ServicesRate]  WITH CHECK ADD  CONSTRAINT [FK_ServicesRate_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[ServicesRate] CHECK CONSTRAINT [FK_ServicesRate_Provider]
GO
ALTER TABLE [dbo].[TotalAmountDue]  WITH CHECK ADD  CONSTRAINT [FK_TotalAmountDue_MeterReading] FOREIGN KEY([MeterReadingID])
REFERENCES [dbo].[MeterReading] ([MeterReadingID])
GO
ALTER TABLE [dbo].[TotalAmountDue] CHECK CONSTRAINT [FK_TotalAmountDue_MeterReading]
GO
ALTER TABLE [dbo].[TotalAmountDue]  WITH CHECK ADD  CONSTRAINT [FK_TotalAmountDue_Overdue] FOREIGN KEY([OverdueID])
REFERENCES [dbo].[Overdue] ([OverdueID])
GO
ALTER TABLE [dbo].[TotalAmountDue] CHECK CONSTRAINT [FK_TotalAmountDue_Overdue]
GO
ALTER TABLE [dbo].[TotalAmountDue]  WITH CHECK ADD  CONSTRAINT [FK_TotalAmountDue_ServicesRate] FOREIGN KEY([RateID])
REFERENCES [dbo].[ServicesRate] ([RateID])
GO
ALTER TABLE [dbo].[TotalAmountDue] CHECK CONSTRAINT [FK_TotalAmountDue_ServicesRate]
GO
ALTER TABLE [dbo].[TotalAmountDue]  WITH CHECK ADD  CONSTRAINT [FK_TotalAmountDue_TaxRate] FOREIGN KEY([TaxRateID])
REFERENCES [dbo].[TaxRate] ([TaxRateID])
GO
ALTER TABLE [dbo].[TotalAmountDue] CHECK CONSTRAINT [FK_TotalAmountDue_TaxRate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[80] 4[8] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -1152
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 201
               Right = 330
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 399
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cc"
            Begin Extent = 
               Top = 358
               Left = 639
               Bottom = 550
               Right = 1055
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "caa"
            Begin Extent = 
               Top = 575
               Left = 454
               Bottom = 767
               Right = 686
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 801
               Left = 57
               Bottom = 993
               Right = 372
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pa"
            Begin Extent = 
               Top = 999
               Left = 57
               Bottom = 1191
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sr"
            Begin Extent = 
               Top = 1197
               Left = 57
               Bottom = 1389
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CUSTOMER_BILL_PROFILE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       End
         Begin Table = "cb"
            Begin Extent = 
               Top = 1449
               Left = 759
               Bottom = 1641
               Right = 1006
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "mr"
            Begin Extent = 
               Top = 1593
               Left = 57
               Bottom = 1759
               Right = 326
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 1764
               Left = 57
               Bottom = 1904
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tr"
            Begin Extent = 
               Top = 1908
               Left = 57
               Bottom = 2074
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tad"
            Begin Extent = 
               Top = 2079
               Left = 57
               Bottom = 2271
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CUSTOMER_BILL_PROFILE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CUSTOMER_BILL_PROFILE'
GO
USE [master]
GO
ALTER DATABASE [UTILITY SERVICE PROVIDER] SET  READ_WRITE 
GO
