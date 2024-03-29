USE [master]
GO
/****** Object:  Database [291_RentalDatabase]    Script Date: 2022-04-06 5:27:56 PM ******/
CREATE DATABASE [291_RentalDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'291_RentalDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\291_RentalDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'291_RentalDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\291_RentalDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [291_RentalDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [291_RentalDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [291_RentalDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [291_RentalDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [291_RentalDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [291_RentalDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [291_RentalDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [291_RentalDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [291_RentalDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [291_RentalDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [291_RentalDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [291_RentalDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [291_RentalDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [291_RentalDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'291_RentalDatabase', N'ON'
GO
ALTER DATABASE [291_RentalDatabase] SET QUERY_STORE = OFF
GO
USE [291_RentalDatabase]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2022-04-06 5:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BID] [numeric](3, 0) NOT NULL,
	[Description] [nchar](100) NOT NULL,
	[Street_Address1] [nchar](50) NOT NULL,
	[Street_Address2] [nchar](50) NULL,
	[City] [nchar](35) NOT NULL,
	[Province] [nchar](25) NOT NULL,
	[Postal_Code] [nchar](7) NOT NULL,
	[Phone_Number] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 2022-04-06 5:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[VIN] [nchar](18) NOT NULL,
	[Make] [nchar](20) NOT NULL,
	[Model] [nchar](20) NOT NULL,
	[Year] [nchar](4) NOT NULL,
	[No_of_Seats] [nchar](2) NOT NULL,
	[Colour] [nchar](20) NOT NULL,
	[Insurance_No] [nchar](15) NOT NULL,
	[Odometer_No] [numeric](6, 0) NOT NULL,
	[Branch_ID] [numeric](3, 0) NOT NULL,
	[Car_Type_ID] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_Type]    Script Date: 2022-04-06 5:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Type](
	[Car_Type_ID] [numeric](3, 0) NOT NULL,
	[Description] [nchar](20) NOT NULL,
	[Daily_Rate] [decimal](8, 2) NOT NULL,
	[Weekly_Rate] [decimal](8, 2) NOT NULL,
	[Monthly_Rate] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Car Type] PRIMARY KEY CLUSTERED 
(
	[Car_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022-04-06 5:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [numeric](4, 0) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Middle_Name] [nchar](20) NULL,
	[Last_Name] [nchar](20) NULL,
	[Street_Address1] [nchar](50) NOT NULL,
	[Street_Address2] [nchar](50) NULL,
	[City] [nchar](35) NOT NULL,
	[Province] [nchar](25) NOT NULL,
	[Postal_Code] [nchar](7) NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Phone_Number] [nchar](15) NOT NULL,
	[Insurance] [nchar](15) NOT NULL,
	[Drivers_License] [nchar](20) NOT NULL,
	[Membership_Status] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 2022-04-06 5:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[TID] [numeric](4, 0) NOT NULL,
	[Pick_Up_Date] [date] NOT NULL,
	[Return_Date] [date] NOT NULL,
	[Customer_ID] [numeric](4, 0) NOT NULL,
	[VIN] [nchar](18) NOT NULL,
	[Pick_Up_BID] [numeric](3, 0) NOT NULL,
	[Return_BID] [numeric](3, 0) NOT NULL,
	[Total_Rent_Value] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Membership_Status]  DEFAULT ((0)) FOR [Membership_Status]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([BID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Branch]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Car_Type] FOREIGN KEY([Car_Type_ID])
REFERENCES [dbo].[Car_Type] ([Car_Type_ID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Car_Type]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Branch] FOREIGN KEY([Return_BID])
REFERENCES [dbo].[Branch] ([BID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Branch]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Branch1] FOREIGN KEY([Pick_Up_BID])
REFERENCES [dbo].[Branch] ([BID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Branch1]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Car] FOREIGN KEY([VIN])
REFERENCES [dbo].[Car] ([VIN])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Car]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customer]
GO
USE [master]
GO
ALTER DATABASE [291_RentalDatabase] SET  READ_WRITE 
GO
