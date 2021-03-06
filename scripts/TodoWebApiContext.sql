-- a linea 2 all'interno dell'Use bisogna mettere il nome del nostro DataBase (il nostro DataBase si chiamava "tutti")
USE [TodoWebApiContext]
GO
ALTER TABLE [dbo].[Todo] DROP CONSTRAINT [FK_Todo_Person_ProfileId]
GO
/****** Object:  Index [IX_Todo_ProfileId]    Script Date: 14/02/2022 17:47:11 ******/
DROP INDEX [IX_Todo_ProfileId] ON [dbo].[Todo]
GO
/****** Object:  Table [dbo].[Todo]    Script Date: 14/02/2022 17:47:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Todo]') AND type in (N'U'))
DROP TABLE [dbo].[Todo]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 14/02/2022 17:47:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/02/2022 17:47:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/02/2022 17:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 14/02/2022 17:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Town] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Todo]    Script Date: 14/02/2022 17:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Todo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[State] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ProfileId] [int] NULL,
 CONSTRAINT [PK_Todo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220204161604_Init', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220214160411_FkRelations', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Todo] ON 

INSERT [dbo].[Todo] ([Id], [Title], [State], [CreatedAt], [ProfileId]) VALUES (1, N'APP MVC', 0, CAST(N'2022-02-16T21:38:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Todo] OFF
GO
/****** Object:  Index [IX_Todo_ProfileId]    Script Date: 14/02/2022 17:47:11 ******/
CREATE NONCLUSTERED INDEX [IX_Todo_ProfileId] ON [dbo].[Todo]
(
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Todo]  WITH CHECK ADD  CONSTRAINT [FK_Todo_Person_ProfileId] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Todo] CHECK CONSTRAINT [FK_Todo_Person_ProfileId]
GO
