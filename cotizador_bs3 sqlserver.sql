USE [master]
GO
/****** Object:  Database [cotizador_bs3]    Script Date: 30/05/2021 15:01:25 ******/
CREATE DATABASE [cotizador_bs3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cotizador_bs3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cotizador_bs3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cotizador_bs3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cotizador_bs3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cotizador_bs3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cotizador_bs3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cotizador_bs3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cotizador_bs3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cotizador_bs3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cotizador_bs3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cotizador_bs3] SET ARITHABORT OFF 
GO
ALTER DATABASE [cotizador_bs3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cotizador_bs3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cotizador_bs3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cotizador_bs3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cotizador_bs3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cotizador_bs3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cotizador_bs3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cotizador_bs3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cotizador_bs3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cotizador_bs3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cotizador_bs3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cotizador_bs3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cotizador_bs3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cotizador_bs3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cotizador_bs3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cotizador_bs3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cotizador_bs3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cotizador_bs3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cotizador_bs3] SET  MULTI_USER 
GO
ALTER DATABASE [cotizador_bs3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cotizador_bs3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cotizador_bs3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cotizador_bs3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cotizador_bs3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cotizador_bs3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [cotizador_bs3] SET QUERY_STORE = OFF
GO
USE [cotizador_bs3]
GO
/****** Object:  Table [dbo].[cotizaciones_demo]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotizaciones_demo](
	[id_cotizacion] [int] NOT NULL,
	[numero_cotizacion] [int] NOT NULL,
	[fecha_cotizacion] [datetime2](0) NOT NULL,
	[atencion] [varchar](50) NOT NULL,
	[tel1] [varchar](9) NOT NULL,
	[empresa] [varchar](75) NOT NULL,
	[tel2] [varchar](9) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[condiciones] [varchar](30) NOT NULL,
	[validez] [varchar](20) NOT NULL,
	[entrega] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_cotizacion_demo]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_cotizacion_demo](
	[id_detalle_cotizacion] [int] NOT NULL,
	[numero_cotizacion] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas_demo]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas_demo](
	[id_marca] [int] NOT NULL,
	[nombre_marca] [char](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos_demo]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_demo](
	[id_producto] [int] NOT NULL,
	[codigo_producto] [char](20) NOT NULL,
	[nombre_producto] [char](100) NOT NULL,
	[modelo_producto] [varchar](30) NOT NULL,
	[id_departamento_producto] [int] NOT NULL,
	[id_marca_producto] [int] NOT NULL,
	[status_producto] [smallint] NOT NULL,
	[unidad_medida_producto] [char](20) NOT NULL,
	[peso_producto] [char](20) NOT NULL,
	[date_added] [datetime2](0) NOT NULL,
	[precio_producto] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_cotizacion]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_cotizacion](
	[id_tmp] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad_tmp] [int] NOT NULL,
	[precio_tmp] [float] NULL,
	[session_id] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_demo]    Script Date: 30/05/2021 15:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_demo](
	[user_id] [int] NOT NULL,
	[firstname] [varchar](32) NOT NULL,
	[lastname] [varchar](32) NOT NULL,
	[email] [varchar](96) NOT NULL,
	[code] [varchar](32) NOT NULL,
	[status] [smallint] NOT NULL,
	[date_added] [datetime2](0) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_cotizacion] ADD  DEFAULT (NULL) FOR [precio_tmp]
GO
ALTER TABLE [dbo].[user_demo] ADD  DEFAULT ('') FOR [firstname]
GO
ALTER TABLE [dbo].[user_demo] ADD  DEFAULT ('') FOR [lastname]
GO
ALTER TABLE [dbo].[user_demo] ADD  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[user_demo] ADD  DEFAULT ('0000-00-00 00:00:00') FOR [date_added]
GO
USE [master]
GO
ALTER DATABASE [cotizador_bs3] SET  READ_WRITE 
GO
