
/****** Object:  Table [dbo].[DataSourceConfigs]    Script Date: 10-11-2021 00:01:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DataSourceConfigs](
	[ConfigID] [int] IDENTITY(1,1),
	[SourceType] [nvarchar](50) NOT NULL,
	[ExtractType] [nvarchar](50) NOT NULL,
	[SourceName] [nvarchar](50) NOT NULL,
	[SourceVal1] [nvarchar](150) NOT NULL,
	[SourceVal2] [nvarchar](150) NULL,
	[AccessToken] [nvarchar](50) NULL,
	[TargetName] [nvarchar](50) NOT NULL,
	[TargetLocation] [nvarchar](50) NOT NULL,
	[TargetVal] [nvarchar](50) NOT NULL,
	[APIHeader1] [nvarchar](50) NULL,
	[Param1Name] [nvarchar](50) NULL,
	[Param1Val] [nvarchar](50) NULL,
	[Param2Name] [nvarchar](50) NULL,
	[Param2Val] [nvarchar](50) NULL,
	[Param3Name] [nvarchar](50) NULL,
	[Param3Val] [nvarchar](50) NULL,
	[TargetFileExtension] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO

