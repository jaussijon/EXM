/*****************************************************************************************************************
NAME:    CreateTheEXMschema2.sql
PURPOSE: Create the EXM schema 2

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   JJAUSSI       1. Built this table for LDS BC IT240


RUNTIME: 
Approx. 1 min

NOTES:
This is an example of what the result is when using SSMS to script a database

SSMS > EXM > Tasks > Generate Scripts > Script entire database and all objects

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


USE [master]
GO
/****** Object:  Database [EXM]    Script Date: 10/21/2019 6:01:30 PM ******/
CREATE DATABASE [EXM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EXM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EXM.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EXM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EXM_log.ldf' , SIZE = 1856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EXM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EXM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EXM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EXM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EXM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EXM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EXM] SET ARITHABORT OFF 
GO
ALTER DATABASE [EXM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EXM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EXM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EXM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EXM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EXM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EXM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EXM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EXM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EXM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EXM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EXM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EXM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EXM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EXM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EXM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EXM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EXM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EXM] SET  MULTI_USER 
GO
ALTER DATABASE [EXM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EXM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EXM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EXM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EXM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EXM', N'ON'
GO
ALTER DATABASE [EXM] SET QUERY_STORE = OFF
GO
USE [EXM]
GO
/****** Object:  Table [dbo].[tblPlayerDim]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlayerDim](
	[pl_id] [int] NOT NULL,
	[l_name] [varchar](50) NOT NULL,
	[f_name] [varchar](50) NOT NULL,
	[pl_name] [varchar](100) NOT NULL,
	[t_id] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[pl_num] [int] NOT NULL,
 CONSTRAINT [PK_tblPlayerDim] PRIMARY KEY CLUSTERED 
(
	[pl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPositionDim]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPositionDim](
	[p_id] [int] NOT NULL,
	[p_code] [varchar](5) NOT NULL,
	[p_name] [varchar](50) NOT NULL,
	[p_target] [int] NOT NULL,
 CONSTRAINT [PK_tblPositionDim] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTeamDim]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamDim](
	[t_id] [int] NOT NULL,
	[t_code] [varchar](5) NOT NULL,
 CONSTRAINT [PK_tblTeamDim] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_team_detail_dim]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*****************************************************************************************************************
NAME:    dbo.v_team_detail_dim
PURPOSE: Create the dbo.v_team_detail_dim view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   JJAUSSI       1. Built this table for LDS BC IT240


RUNTIME: 
Approx. 1 min

NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

CREATE VIEW [dbo].[v_team_detail_dim]
AS
SELECT t.t_id
     , t.t_code
     , p.p_id
     , p.p_code
     , p.p_name
     , pl.pl_id
     , pl.pl_name
     , pl.pl_num
  FROM dbo.tblTeamDim AS t
 INNER JOIN dbo.tblPlayerDim AS pl 
    ON t.t_id = pl.t_id 
 INNER JOIN dbo.tblPositionDim AS p
   ON pl.p_id = p.p_id;

GO
/****** Object:  View [dbo].[v_team_sum]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*****************************************************************************************************************
NAME:    dbo.v_team_sum
PURPOSE: Create the dbo.v_team_sum view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   JJAUSSI       1. Built this table for LDS BC IT240


RUNTIME: 
Approx. 1 min

NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

CREATE VIEW [dbo].[v_team_sum]
AS

WITH s1 -- Step 1
AS
(
SELECT pl.t_id
     , pl.p_id
     , Count(pl.pl_id) AS p_id_count
     , p.p_target
  FROM dbo.tblPlayerDim AS pl
 INNER JOIN dbo.tblPositionDim AS p
    ON pl.p_id = p.p_id
 GROUP BY pl.t_id
     , pl.p_id
     , p.p_target
)
SELECT s1.t_id
     , t.t_code
     , p.p_id
     , p.p_code
     , p.p_name
     , s1.p_id_count
     , s1.p_target
     , [p_id_count]-[s1].[p_target] AS p_target_var
  FROM s1 
 INNER JOIN dbo.tblTeamDim AS t
    ON s1.t_id = t.t_id
 INNER JOIN dbo.tblPositionDim AS p
    ON s1.p_id = p.p_id;

GO
/****** Object:  Table [dbo].[tblData]    Script Date: 10/21/2019 6:01:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblData](
	[pl_id] [int] NOT NULL,
	[l_name] [varchar](50) NOT NULL,
	[f_name] [varchar](50) NOT NULL,
	[pl_name] [varchar](100) NOT NULL,
	[t_id] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[pl_num] [int] NOT NULL,
	[p_code] [varchar](5) NOT NULL,
	[p_name] [varchar](50) NOT NULL,
	[p_target] [int] NOT NULL,
	[t_code] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPlayerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblPlayerDim_tblPositionDim] FOREIGN KEY([p_id])
REFERENCES [dbo].[tblPositionDim] ([p_id])
GO
ALTER TABLE [dbo].[tblPlayerDim] CHECK CONSTRAINT [FK_tblPlayerDim_tblPositionDim]
GO
ALTER TABLE [dbo].[tblPlayerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblPlayerDim_tblTeamDim] FOREIGN KEY([t_id])
REFERENCES [dbo].[tblTeamDim] ([t_id])
GO
ALTER TABLE [dbo].[tblPlayerDim] CHECK CONSTRAINT [FK_tblPlayerDim_tblTeamDim]
GO
USE [master]
GO
ALTER DATABASE [EXM] SET  READ_WRITE 
GO
