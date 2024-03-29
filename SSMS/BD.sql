USE [master]
GO
/****** Object:  Database [Borisikhin_SKM]    Script Date: 14.02.2024 10:29:59 ******/
CREATE DATABASE [Borisikhin_SKM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Borisikhin SKM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Borisikhin SKM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Borisikhin SKM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Borisikhin SKM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Borisikhin_SKM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Borisikhin_SKM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Borisikhin_SKM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET ARITHABORT OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Borisikhin_SKM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Borisikhin_SKM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Borisikhin_SKM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Borisikhin_SKM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Borisikhin_SKM] SET  MULTI_USER 
GO
ALTER DATABASE [Borisikhin_SKM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Borisikhin_SKM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Borisikhin_SKM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Borisikhin_SKM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Borisikhin_SKM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Borisikhin_SKM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Borisikhin_SKM] SET QUERY_STORE = OFF
GO
USE [Borisikhin_SKM]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 14.02.2024 10:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Код_Заказа] [int] NOT NULL,
	[Код_Товара] [int] NULL,
	[Код_Клиента] [int] NULL,
	[ФИО] [nvarchar](50) NULL,
	[Вес] [int] NULL,
	[Цена_Товара] [money] NULL,
	[Цена_Доставки] [money] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Код_Заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Изделие]    Script Date: 14.02.2024 10:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Изделие](
	[Код_Товара] [int] NOT NULL,
	[Вид_Изделия] [nvarchar](50) NULL,
	[Название_Изделия] [nvarchar](50) NULL,
	[Дата_Изготовления] [datetime] NULL,
	[Срок_Хранения] [nvarchar](50) NULL,
	[Цена] [money] NULL,
	[Вес] [int] NULL,
	[Фото] [image] NULL,
	[Состав] [nvarchar](max) NULL,
	[Товар] [nvarchar](50) NULL,
	[Дата_Поступления] [datetime] NULL,
	[Код_Фабрики] [int] NULL,
 CONSTRAINT [PK_Изделие] PRIMARY KEY CLUSTERED 
(
	[Код_Товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 14.02.2024 10:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Код_Клиента] [int] NOT NULL,
	[Вид_Клиента] [nvarchar](50) NULL,
	[ФИО] [nvarchar](50) NULL,
	[Адрес_Доставки] [nvarchar](max) NULL,
	[Телефон] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Код_Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фабрики]    Script Date: 14.02.2024 10:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фабрики](
	[Код_Фабрики] [int] NOT NULL,
	[Название_Фабрики] [nvarchar](50) NULL,
	[Основная_Продукция] [nvarchar](50) NULL,
 CONSTRAINT [PK_Фабрики] PRIMARY KEY CLUSTERED 
(
	[Код_Фабрики] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Изделие] FOREIGN KEY([Код_Товара])
REFERENCES [dbo].[Изделие] ([Код_Товара])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Изделие]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Клиенты] FOREIGN KEY([Код_Клиента])
REFERENCES [dbo].[Клиенты] ([Код_Клиента])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Клиенты]
GO
ALTER TABLE [dbo].[Изделие]  WITH CHECK ADD  CONSTRAINT [FK_Изделие_Фабрики] FOREIGN KEY([Код_Фабрики])
REFERENCES [dbo].[Фабрики] ([Код_Фабрики])
GO
ALTER TABLE [dbo].[Изделие] CHECK CONSTRAINT [FK_Изделие_Фабрики]
GO
USE [master]
GO
ALTER DATABASE [Borisikhin_SKM] SET  READ_WRITE 
GO
