CREATE DATABASE [platzi]
 CONTAINMENT = NONE
 ON  PRIMARY 
GO
Tablas
<------------------------------
USE [platzi]
GO

/** Object:  Table [dbo].[catAirports]    Script Date: 3/6/2021 12:06:53 PM **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[catAirports](
    [cveAirport] [nvarchar](4) NOT NULL,
    [description] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


/**/
USE [platzi]
GO

/** Object:  Table [dbo].[flights]    Script Date: 3/6/2021 12:07:16 PM **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[flights](
    [cveFligth] [nvarchar](10) NOT NULL,
    [cveRoute] [nvarchar](4) NOT NULL,
    [cveUser] [nvarchar](4) NOT NULL,
    [dateFlight] [date] NULL
) ON [PRIMARY]
GO

/**/
USE [platzi]
GO

/** Object:  Table [dbo].[routes]    Script Date: 3/6/2021 12:07:50 PM **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[routes](
    [cveRoute] [nvarchar](10) NOT NULL,
    [departureRoute] [nvarchar](4) NOT NULL,
    [arrivalRoute] [nvarchar](4) NOT NULL
) ON [PRIMARY]
GO

/**/
USE [platzi]
GO

/** Object:  Table [dbo].[users]    Script Date: 3/6/2021 12:08:14 PM **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
    [cveUser] [nvarchar](10) NOT NULL,
    [nameUser] [nvarchar](50) NOT NULL,
    [addressUser] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO