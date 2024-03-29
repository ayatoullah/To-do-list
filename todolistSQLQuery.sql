USE [master]
GO
/****** Object:  Database [Fighting Task]    Script Date: 1/26/2018 2:31:09 AM ******/
CREATE DATABASE [Fighting Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fighting Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Fighting Task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fighting Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Fighting Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fighting Task] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fighting Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fighting Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fighting Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fighting Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fighting Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fighting Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fighting Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fighting Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fighting Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fighting Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fighting Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fighting Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fighting Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fighting Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fighting Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fighting Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fighting Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fighting Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fighting Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fighting Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fighting Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fighting Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fighting Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fighting Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Fighting Task] SET  MULTI_USER 
GO
ALTER DATABASE [Fighting Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fighting Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fighting Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fighting Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fighting Task] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fighting Task', N'ON'
GO
ALTER DATABASE [Fighting Task] SET QUERY_STORE = OFF
GO
USE [Fighting Task]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Fighting Task]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/26/2018 2:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] NOT NULL,
	[CatName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 1/26/2018 2:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserID] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ToDoList]    Script Date: 1/26/2018 2:31:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CatID] [int] NOT NULL,
	[Todolist] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_Todolist_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (1, N'Family')
GO
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (2, N'Work')
GO
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (3, N'Friend')
GO
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (4, N'Hobby')
GO
INSERT [dbo].[Login] ([UserID], [email], [password]) VALUES (1, N'ayaramzy2014@gmail.com', N'111')
GO
INSERT [dbo].[Login] ([UserID], [email], [password]) VALUES (2, N'asmaarabea@gmail.com', N'222')
GO
SET IDENTITY_INSERT [dbo].[ToDoList] ON 

GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (22, 1, 1, N'vv', CAST(N'2018-01-25T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (23, 1, 1, N'jj', CAST(N'2018-01-25T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (24, 1, 1, N'lala', CAST(N'2018-01-25T00:00:00.000' AS DateTime), N'0')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (25, 1, 1, N'xx', CAST(N'2018-01-25T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (27, 1, 1, N'jj', CAST(N'2018-01-25T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (30, 1, 1, N'jj', CAST(N'2018-01-26T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (50, 1, 2, N'nn', CAST(N'2018-01-27T00:00:00.000' AS DateTime), N'0')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (53, 1, 1, N'nn', CAST(N'2018-01-26T00:00:00.000' AS DateTime), N'0')
GO
INSERT [dbo].[ToDoList] ([ID], [UserID], [CatID], [Todolist], [Date], [status]) VALUES (56, 1, 4, N'nn', CAST(N'2018-01-26T00:00:00.000' AS DateTime), N'0')
GO
SET IDENTITY_INSERT [dbo].[ToDoList] OFF
GO
ALTER TABLE [dbo].[ToDoList]  WITH CHECK ADD  CONSTRAINT [FK_Todolist_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDoList] CHECK CONSTRAINT [FK_Todolist_Categories]
GO
ALTER TABLE [dbo].[ToDoList]  WITH CHECK ADD  CONSTRAINT [FK_Todolist_Login] FOREIGN KEY([UserID])
REFERENCES [dbo].[Login] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ToDoList] CHECK CONSTRAINT [FK_Todolist_Login]
GO
USE [master]
GO
ALTER DATABASE [Fighting Task] SET  READ_WRITE 
GO
