USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_Attacks]    Script Date: 8/15/2016 12:20:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_Attacks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[DPS] [float] NOT NULL,
	[Damage] [int] NOT NULL,
	[Seconds] [float] NOT NULL,
	[Energy] [int] NOT NULL,
	[FastMove] [bit] NOT NULL,
 CONSTRAINT [PK_PT_Attacks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_Attacks]  WITH CHECK ADD  CONSTRAINT [FK_PT_Attacks_PT_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PT_Type] ([ID])
GO

ALTER TABLE [dbo].[PT_Attacks] CHECK CONSTRAINT [FK_PT_Attacks_PT_Type]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_Gym]    Script Date: 8/15/2016 12:20:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_Gym](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[GymLevel] [int] NOT NULL,
	[Location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Gym] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_Gym]  WITH CHECK ADD  CONSTRAINT [FK_PT_Gym_PT_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[PT_Team] ([ID])
GO

ALTER TABLE [dbo].[PT_Gym] CHECK CONSTRAINT [FK_PT_Gym_PT_Team]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_GymHasPokemon]    Script Date: 8/15/2016 12:20:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_GymHasPokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[GymID] [int] NOT NULL,
	[CP] [int] NOT NULL,
 CONSTRAINT [PK_PT_GymHasPokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_GymHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_GymHasPokemon_PT_Gym] FOREIGN KEY([GymID])
REFERENCES [dbo].[PT_Gym] ([ID])
GO

ALTER TABLE [dbo].[PT_GymHasPokemon] CHECK CONSTRAINT [FK_PT_GymHasPokemon_PT_Gym]
GO

ALTER TABLE [dbo].[PT_GymHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_GymHasPokemon_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_GymHasPokemon] CHECK CONSTRAINT [FK_PT_GymHasPokemon_PT_Pokemon]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_Pokemon]    Script Date: 8/15/2016 12:21:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_Pokemon](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ImagePath] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Pokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_PokemonHasAttack]    Script Date: 8/15/2016 12:21:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_PokemonHasAttack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[AttackID] [int] NOT NULL,
 CONSTRAINT [PK_PT_PokemonHasAttack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_PokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasAttack_PT_Attacks] FOREIGN KEY([AttackID])
REFERENCES [dbo].[PT_Attacks] ([ID])
GO

ALTER TABLE [dbo].[PT_PokemonHasAttack] CHECK CONSTRAINT [FK_PT_PokemonHasAttack_PT_Attacks]
GO

ALTER TABLE [dbo].[PT_PokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasAttack_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_PokemonHasAttack] CHECK CONSTRAINT [FK_PT_PokemonHasAttack_PT_Pokemon]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_PokemonHasType]    Script Date: 8/15/2016 12:22:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_PokemonHasType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_PT_PokemonHasType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_PokemonHasType]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasType_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_PokemonHasType] CHECK CONSTRAINT [FK_PT_PokemonHasType_PT_Pokemon]
GO

ALTER TABLE [dbo].[PT_PokemonHasType]  WITH CHECK ADD  CONSTRAINT [FK_PT_PokemonHasType_PT_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PT_Type] ([ID])
GO

ALTER TABLE [dbo].[PT_PokemonHasType] CHECK CONSTRAINT [FK_PT_PokemonHasType_PT_Type]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_Team]    Script Date: 8/15/2016 12:22:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_Team](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Team] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_Type]    Script Date: 8/15/2016 12:22:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PT_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_User]    Script Date: 8/15/2016 12:23:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_PT_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_User]  WITH CHECK ADD  CONSTRAINT [FK_PT_User_PT_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[PT_Team] ([ID])
GO

ALTER TABLE [dbo].[PT_User] CHECK CONSTRAINT [FK_PT_User_PT_Team]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_UserFavoriteGym]    Script Date: 8/15/2016 12:23:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_UserFavoriteGym](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GymID] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserFavoriteGym] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_UserFavoriteGym]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserFavoriteGym_PT_Gym] FOREIGN KEY([GymID])
REFERENCES [dbo].[PT_Gym] ([ID])
GO

ALTER TABLE [dbo].[PT_UserFavoriteGym] CHECK CONSTRAINT [FK_PT_UserFavoriteGym_PT_Gym]
GO

ALTER TABLE [dbo].[PT_UserFavoriteGym]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserFavoriteGym_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO

ALTER TABLE [dbo].[PT_UserFavoriteGym] CHECK CONSTRAINT [FK_PT_UserFavoriteGym_PT_User]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_UserHasCandy]    Script Date: 8/15/2016 12:23:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_UserHasCandy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PokemonID] [int] NOT NULL,
	[CandyAmount] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserHasCandy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_UserHasCandy]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasCandy_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_UserHasCandy] CHECK CONSTRAINT [FK_PT_UserHasCandy_PT_Pokemon]
GO

ALTER TABLE [dbo].[PT_UserHasCandy]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasCandy_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO

ALTER TABLE [dbo].[PT_UserHasCandy] CHECK CONSTRAINT [FK_PT_UserHasCandy_PT_User]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_UserHasPokemon]    Script Date: 8/15/2016 12:23:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_UserHasPokemon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PokemonID] [int] NOT NULL,
	[CP] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserHasPokemon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_UserHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasPokemon_PT_Pokemon] FOREIGN KEY([PokemonID])
REFERENCES [dbo].[PT_Pokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_UserHasPokemon] CHECK CONSTRAINT [FK_PT_UserHasPokemon_PT_Pokemon]
GO

ALTER TABLE [dbo].[PT_UserHasPokemon]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserHasPokemon_PT_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[PT_User] ([ID])
GO

ALTER TABLE [dbo].[PT_UserHasPokemon] CHECK CONSTRAINT [FK_PT_UserHasPokemon_PT_User]
GO


USE [PokemonTracker]
GO

/****** Object:  Table [dbo].[PT_UserPokemonHasAttack]    Script Date: 8/15/2016 12:24:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PT_UserPokemonHasAttack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserPokemonID] [int] NOT NULL,
	[AttackID] [int] NOT NULL,
 CONSTRAINT [PK_PT_UserPokemonHasAttack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PT_UserPokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_Attacks] FOREIGN KEY([AttackID])
REFERENCES [dbo].[PT_Attacks] ([ID])
GO

ALTER TABLE [dbo].[PT_UserPokemonHasAttack] CHECK CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_Attacks]
GO

ALTER TABLE [dbo].[PT_UserPokemonHasAttack]  WITH CHECK ADD  CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_UserHasPokemon] FOREIGN KEY([UserPokemonID])
REFERENCES [dbo].[PT_UserHasPokemon] ([ID])
GO

ALTER TABLE [dbo].[PT_UserPokemonHasAttack] CHECK CONSTRAINT [FK_PT_UserPokemonHasAttack_PT_UserHasPokemon]
GO


