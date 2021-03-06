USE [master]
GO
/****** Object:  Database [BoardmanAdventures]    Script Date: 2/29/2020 3:49:30 PM ******/
CREATE DATABASE [BoardmanAdventures]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BoardmanAdventures', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BoardmanAdventures.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BoardmanAdventures_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BoardmanAdventures_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BoardmanAdventures] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BoardmanAdventures].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BoardmanAdventures] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoardmanAdventures] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoardmanAdventures] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BoardmanAdventures] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoardmanAdventures] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET RECOVERY FULL 
GO
ALTER DATABASE [BoardmanAdventures] SET  MULTI_USER 
GO
ALTER DATABASE [BoardmanAdventures] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoardmanAdventures] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoardmanAdventures] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoardmanAdventures] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoardmanAdventures] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BoardmanAdventures', N'ON'
GO
ALTER DATABASE [BoardmanAdventures] SET QUERY_STORE = OFF
GO
USE [BoardmanAdventures]
GO
/****** Object:  Table [dbo].[CustomerPayment]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPayment](
	[PaymentID] [varchar](10) NOT NULL,
	[ParticipantID] [varchar](10) NOT NULL,
	[GroupID] [varchar](30) NOT NULL,
	[PaymentType] [nchar](5) NOT NULL,
	[CreditCompany] [varchar](15) NULL,
	[DepositPayed] [nchar](1) NOT NULL,
	[TotalTripCost] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CustomerPayment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [varchar](3) NOT NULL,
	[FirstName] [varchar](15) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[JobID] [nchar](2) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[SSN] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupParticipants]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupParticipants](
	[ParticipantID] [varchar](10) NOT NULL,
	[GroupID] [varchar](30) NOT NULL,
	[FirstName] [varchar](15) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Age] [char](2) NULL,
	[AoRWaiver] [nchar](1) NOT NULL,
	[SpecialRequirements] [varchar](50) NULL,
 CONSTRAINT [PK_GroupParticipants] PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [varchar](30) NOT NULL,
	[ArrivalTime] [varchar](15) NOT NULL,
	[Accomodations] [varchar](10) NOT NULL,
	[DepartureTime] [varchar](15) NOT NULL,
	[TripCode] [nchar](3) NOT NULL,
	[EmployeeID] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[JobID] [nchar](2) NOT NULL,
	[JobName] [varchar](30) NOT NULL,
	[JobDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_JobTypes] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripType]    Script Date: 2/29/2020 3:49:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripType](
	[TripCode] [nchar](3) NOT NULL,
	[AdventureType] [varchar](8) NOT NULL,
	[KitchenPrep] [nchar](1) NOT NULL,
	[Supplies] [nchar](1) NOT NULL,
	[AMorPM] [nchar](2) NOT NULL,
	[TransportationRequirement] [nchar](1) NOT NULL,
	[CostPerPerson] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TripType] PRIMARY KEY CLUSTERED 
(
	[TripCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerPayment]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPayment_GroupParticipants] FOREIGN KEY([ParticipantID])
REFERENCES [dbo].[GroupParticipants] ([ParticipantID])
GO
ALTER TABLE [dbo].[CustomerPayment] CHECK CONSTRAINT [FK_CustomerPayment_GroupParticipants]
GO
ALTER TABLE [dbo].[CustomerPayment]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPayment_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CustomerPayment] CHECK CONSTRAINT [FK_CustomerPayment_Groups]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_JobTypes] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTypes] ([JobID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_JobTypes]
GO
ALTER TABLE [dbo].[GroupParticipants]  WITH CHECK ADD  CONSTRAINT [FK_GroupParticipants_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[GroupParticipants] CHECK CONSTRAINT [FK_GroupParticipants_Groups]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Employees] FOREIGN KEY([TripCode])
REFERENCES [dbo].[TripType] ([TripCode])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Employees]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Employees1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Employees1]
GO
USE [master]
GO
ALTER DATABASE [BoardmanAdventures] SET  READ_WRITE 
GO
