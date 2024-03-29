USE [Farmacia_1743923]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/12/2019 06:42:23 p. m. ******/
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 03/12/2019 06:42:23 p. m. ******/
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/12/2019 06:42:23 p. m. ******/
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 03/12/2019 06:42:23 p. m. ******/
DROP TABLE [dbo].[Medicamento]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/12/2019 06:42:23 p. m. ******/
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/12/2019 06:42:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Empleados_id] [int] NOT NULL,
	[Nombre_empleados] [varchar](50) NOT NULL,
	[Ap_pat_empleados] [varchar](50) NOT NULL,
	[Ap_mat_empleados] [varchar](50) NULL,
	[Fecha_nac_empleados] [date] NOT NULL,
	[Nombre_completo_empleados]  AS (((([Nombre_empleados]+' ')+[Ap_pat_empleados])+' ')+[Ap_mat_empleados]),
	[Domicilio_empleados] [varchar](150) NOT NULL,
	[Telefono_empleados] [numeric] NOT NULL,
	[Correo_empleados] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Empleados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicamento]    Script Date: 03/12/2019 06:42:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Medicamento_id] [int] NOT NULL,
	[Nombre_medicina] [varchar](60) NOT NULL,
	[Marca_medicina] [varchar](60) NOT NULL,
	[Nombre_y_Marca_medicina]  AS (([Nombre_medicina]+' de la marca: ')+[Marca_medicina]),
	[Cantidad_medicina] [varchar](30) NOT NULL,
	[Precio_venta_medicina] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Medicamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 03/12/2019 06:42:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Provedor] [int] NOT NULL,
	[Nombre_pro] [varchar](50) NOT NULL,
	[Nombre_sucursa_pro] [varchar](60) NOT NULL,
	[Fecha_surtido_pro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 03/12/2019 06:42:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[Puesto_id] [int] NOT NULL,
	[Nombre_puesto] [varchar](50) NOT NULL,
	[Sueldo_puesto] [int] NOT NULL,
	[Turno_puesto] [varchar](40) NOT NULL,
	[Antiguedad_puesto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Puesto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 03/12/2019 06:42:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Sucursal_id] [int] NOT NULL,
	[Nombre_sucursal] [varchar](80) NOT NULL,
	[Direccion_sucursal] [varchar](120) NOT NULL,
	[Telefono_sucursal] [numeric] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
