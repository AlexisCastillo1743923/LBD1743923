USE [master]
GO
/****** Object:  Database [PIA_BD1743923]    Script Date: 03/12/2019 08:42:39 p. m. ******/
CREATE DATABASE [PIA_BD1743923]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'PIA_BD1743923', FILENAME = N'C:\SQL2018\MSSQL14.SQLEXPRESS\MSSQL\DATA\PIA-BD1743923.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PIA_BD1743923_log', FILENAME = N'C:\SQL2018\MSSQL14.SQLEXPRESS\MSSQL\DATA\PIA-BD1743923_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PIA_BD1743923].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PIA_BD1743923] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET ARITHABORT OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PIA_BD1743923] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PIA_BD1743923] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PIA_BD1743923] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PIA_BD1743923] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PIA_BD1743923] SET  MULTI_USER 
GO
ALTER DATABASE [PIA_BD1743923] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PIA_BD1743923] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PIA_BD1743923] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PIA_BD1743923] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PIA_BD1743923] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PIA_BD1743923]
GO
/****** Object:  Table [dbo].[Bebida]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bebida](
	[Bebida_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bebida] PRIMARY KEY CLUSTERED 
(
	[Bebida_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cliente_code] [int] NOT NULL,
	[ApPaterno_c] [varchar](50) NOT NULL,
	[ApMaterno_c] [varchar](50) NOT NULL,
	[Nombre_c] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Info_Gral]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Info_Gral](
	[Info_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Info_Gral] PRIMARY KEY CLUSTERED 
(
	[Info_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago_Metodo]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago_Metodo](
	[Pago_code] [int] NOT NULL,
	[TPago] [int] NOT NULL,
 CONSTRAINT [PK_Pago_Metodo] PRIMARY KEY CLUSTERED 
(
	[Pago_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Pedido_code] [int] NOT NULL,
	[Platillo_code] [int] NOT NULL,
	[Bebida_code] [int] NOT NULL,
	[Postre_code] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Pedido_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Platillo](
	[Platillo_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Platillo] PRIMARY KEY CLUSTERED 
(
	[Platillo_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postre]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postre](
	[Postre_code] [int] NOT NULL,
	[Descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_Postre] PRIMARY KEY CLUSTERED 
(
	[Postre_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[Reservacion_code] [int] NOT NULL,
	[Cliente_code] [int] NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[Reservacion_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_code] [int] NOT NULL,
	[Pedido_code] [int] NOT NULL,
	[Pago_code] [int] NOT NULL,
	[Reserv_code] [int] NOT NULL,
	[Info_code] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[TPago_code] [int] NOT NULL,
	[Efectivo] [bit] NOT NULL,
	[TDD] [bit] NOT NULL,
	[TDC] [bit] NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[TPago_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (1, N'Coca-Cola')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (2, N'Fanta')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (3, N'Manzanita')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (4, N'Pepsi')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (5, N'Sprite')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (6, N'Agua Natural')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (7, N'Agua Mineral')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (8, N'Cafe')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (9, N'Limonada')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (10, N'Naranjada')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (11, N'Agua de Tamarindo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (1, N'Castillo', N'Puente', N'Marcos Alexis')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (2, N'Zapata', N'Briones', N'Daniela Alexandra')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (3, N'Botello', N'Alanis', N'Armando Rodrigo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (4, N'Zavala', N'Gonzalez', N'Salvador')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (5, N'Blanco', N'Aguilar', N'Karina Aglae')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (6, N'Perez', N'Martinez', N'Eduardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (7, N'Peña', N'Tovar', N'Melissa Dioveni')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (8, N'Gonzalez', N'Torres', N'Antonio')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (9, N'Guajardo', N'Hernandez', N'Luis Alberto')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (10, N'Guadalupe', N'Castillo', N'Lidia Ivone')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (11, N'Gonzalez', N'Gonzalez', N'Osvaldo Habbib')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (12, N'Morales', N'Perez', N'Fernando')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (13, N'Carrizales', N'Zamora', N'Alejandro')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (14, N'Rodriguez', N'Gonzalez', N'Mariana')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (15, N'Perez', N'Morquecho', N'Eusabio')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (16, N'Gomez', N'Hilario', N'Ricardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (17, N'Hernandez', N'Torres', N'Eduardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (18, N'Tamez', N'Ramirez', N'David Alejandro')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (19, N'Blanco', N'Castro', N'Mario')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (20, N'Gallegos', N'Rodriguez', N'Irving')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (21, N'Rodriguez', N'Gonzalez', N'Brenda Abigail')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (22, N'Flores', N'Ortega', N'Valeria')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (23, N'Castillo', N'Gomez', N'Saul')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (24, N'Mireles,', N'Velez', N'Denis')
GO
INSERT [dbo].[Info_Gral] ([Info_code], [Descripcion], [Telefono], [Correo]) VALUES (1, N'LOS FRESNOS', 924839, N'losfresnosoficial@hotmail.com')
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (1, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (2, 2)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (3, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (4, 4)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (5, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (6, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (7, 7)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (8, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (9, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (10, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (11, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (12, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (13, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (14, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (15, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (16, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (17, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (18, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (19, 5)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (20, 5)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (21, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (22, 1)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (1, 1, 3, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (2, 2, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (3, 5, 2, 6)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (4, 6, 2, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (5, 3, 2, 1)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (6, 3, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (7, 7, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (8, 10, 2, 6)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (9, 1, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (10, 12, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (11, 6, 2, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (12, 1, 2, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (13, 1, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (14, 1, 4, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (15, 1, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (16, 4, 2, 8)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (17, 9, 2, 9)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (18, 3, 2, 10)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (19, 1, 2, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (20, 5, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (21, 10, 2, 9)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (22, 11, 2, 10)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (23, 12, 2, 4)
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (1, N'Caldo tlalpeño')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (2, N'Caldo de pollo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (3, N'Caldo de pescado')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (4, N'Sopa de arroz')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (5, N'Albondigas')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (6, N'Tacos de carne asada')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (7, N'Tacos de trompo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (8, N'Hamburguesa')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (9, N'Pollo a la plancha')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (10, N'Pasta Napolitna')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (11, N'Huevos al gusto')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (12, N'Huevos estrellados')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (13, N'Enchiladas suizas')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (14, N'Chilaquiles')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (15, N'Fajitas de pollo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (16, N'Parrillada')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (17, N'Tacos de bistec')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (18, N'Torta basica')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (19, N'Torta de res')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (20, N'Torta de pollo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (21, N'Torta ahogada')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (22, N'Torta de tamal')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (23, N'Filete de res 3/4')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (24, N'Filete de pescado')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (25, N'De la casa')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (26, N'Spagetti normal')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (27, N'Spagetti con albondigas')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (28, N'Mojarra')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (29, N'Boneless')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (30, N'Ramen')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (31, N'Huevos a la mexicana')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (1, N'Chessecake')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (4, N'Sundae    ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (8, N'Pastel de 3 leches  ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (12, N'Flan    ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (13, N'Nieve Napolitana   ')
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (1, 1)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (2, 2)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (3, 3)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (4, 4)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (5, 5)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (6, 6)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (7, 7)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (8, 8)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (9, 10)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (10, 11)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (11, 12)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (1, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (2, 1, 5, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (3, 1, 1, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (4, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (5, 3, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (6, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (7, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (8, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (9, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (10, 1, 7, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (11, 1, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (12, 1, 4, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (13, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (14, 1, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (15, 1, 4, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (16, 3, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (17, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (18, 1, 6, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (19, 1, 8, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (20, 1, 2, 5, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (21, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (22, 5, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (23, 1, 7, 1, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (1, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (2, 0, 0, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (3, 0, 0, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (4, 1, 0, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (5, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (6, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (7, 1, 0, 0)
GO
/****** Object:  StoredProcedure [dbo].[SP_Busqueda]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Busqueda] 
@id int
as 
Select * from Cliente
where Cliente_code = @id
GO
USE [master]
GO
ALTER DATABASE [PIA_BD1743923] SET  READ_WRITE 
GO
