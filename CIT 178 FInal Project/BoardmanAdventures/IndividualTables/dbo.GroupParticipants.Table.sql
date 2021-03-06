USE [BoardmanAdventures]
GO
/****** Object:  Table [dbo].[GroupParticipants]    Script Date: 2/29/2020 3:41:12 PM ******/
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
ALTER TABLE [dbo].[GroupParticipants]  WITH CHECK ADD  CONSTRAINT [FK_GroupParticipants_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[GroupParticipants] CHECK CONSTRAINT [FK_GroupParticipants_Groups]
GO
