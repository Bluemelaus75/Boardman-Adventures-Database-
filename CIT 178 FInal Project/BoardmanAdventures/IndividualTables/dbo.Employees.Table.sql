USE [BoardmanAdventures]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/29/2020 3:41:12 PM ******/
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
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_JobTypes] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTypes] ([JobID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_JobTypes]
GO
