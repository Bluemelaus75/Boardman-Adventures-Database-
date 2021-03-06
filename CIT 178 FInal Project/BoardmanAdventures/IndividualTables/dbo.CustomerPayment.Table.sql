USE [BoardmanAdventures]
GO
/****** Object:  Table [dbo].[CustomerPayment]    Script Date: 2/29/2020 3:41:12 PM ******/
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
