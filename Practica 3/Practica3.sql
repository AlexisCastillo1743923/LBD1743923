USE [Farmacia_1743923]
GO
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [MayordeDiesiciete]
GO
ALTER TABLE [dbo].[Surtido] DROP CONSTRAINT [fk_proveedor_surt]
GO
ALTER TABLE [dbo].[Surtido] DROP CONSTRAINT [fk_medicamento_surt]
GO
ALTER TABLE [dbo].[Sucursal] DROP CONSTRAINT [fk_proveedor_suc]
GO
ALTER TABLE [dbo].[Sucursal] DROP CONSTRAINT [fk_empleados_suc]
GO
ALTER TABLE [dbo].[Medicamento] DROP CONSTRAINT [fk_proveedor_med]
GO
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK__empleados__puest__5BE2A6F2]
GO
/****** Object:  Index [surtido_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Surtido] DROP CONSTRAINT [Surtido_id]
GO
/****** Object:  Index [sucursal_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Sucursal] DROP CONSTRAINT [Sucursal_id]
GO
/****** Object:  Index [UQ__proveedo__0465F7C28E64A6EB]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Proveedor] DROP CONSTRAINT [UQ__proveedo__0465F7C28E64A6EB]
GO
/****** Object:  Index [proveedor_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Proveedor] DROP CONSTRAINT [Proveedor_id]
GO
/****** Object:  Index [UQ__empleado__A98D301F4A1FA124]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [UQ__empleado__A98D301F4A1FA124]
GO
/****** Object:  Index [empleados_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [Empleados_id]
GO
/****** Object:  Table [dbo].[Surtido]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Surtido]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Medicamento]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/12/2019 08:42:39 p. m. ******/
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Empleados_id] [int] NOT NULL,
	[Nombre_empleado] [varchar](50) NOT NULL,
	[Ap_pat_empleado] [varchar](50) NOT NULL,
	[Ap_mat_empleado] [varchar](50) NULL,
	[Fecha_nac_empleado] [date] NOT NULL,
	[Nombre_completo_empleado]  AS (((([Nombre_empleado]+' ')+[Ap_pat_empleado])+' ')+[Ap_mat_empleado]),
	[Domicilio_empleado] [varchar](150) NOT NULL,
	[Telefono_empleado] [numeric] NOT NULL,
	[Correo_empleado] [varchar](100) NOT NULL,
	[Puesto_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Empleados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[medicamento_id] [int] NOT NULL,
	[Nombre_medicina] [varchar](60) NOT NULL,
	[Marca_medicina] [varchar](60) NOT NULL,
	[Nombre_y_Marca_medicina]  AS (([Nombre_medicina]+' de la marca: ')+[Marca_medicina]),
	[Cantidad_medicina] [varchar](30) NOT NULL,
	[Precio_venta_medicina] [int] NOT NULL,
	[proveedor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Medicamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/12/2019 08:42:39 p. m. ******/
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
/****** Object:  Table [dbo].[Puesto]    Script Date: 03/12/2019 08:42:39 p. m. ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Sucursal_id] [int] NOT NULL,
	[Nombre_sucursal] [varchar](80) NOT NULL,
	[Direccion_sucursal] [varchar](120) NOT NULL,
	[Telefono_sucursal] [numeric] NOT NULL,
	[Empleado] [int] NOT NULL,
	[Proveedor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surtido]    Script Date: 03/12/2019 08:42:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surtido](
	[Surtido_id] [int] NOT NULL,
	[Proveedor_id] [int] NOT NULL,
	[Precio_compra_med_surtido] [int] NOT NULL,
	[medicamento_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Surtido_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [Empleados_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [Empleados_id] UNIQUE NONCLUSTERED 
(
	[Empleados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__empleado__A98D301F4A1FA124]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Empleados] ADD UNIQUE NONCLUSTERED 
(
	[Empleados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Proveedor_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Proveedor] ADD  CONSTRAINT [Proveedor_id] UNIQUE NONCLUSTERED 
(
	[Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__proveedo__0465F7C28E64A6EB]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Proveedor] ADD UNIQUE NONCLUSTERED 
(
	[Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sucursal_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Sucursal] ADD  CONSTRAINT [Sucursal_id] UNIQUE NONCLUSTERED 
(
	[Sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Surtido_id]    Script Date: 03/12/2019 08:42:39 p. m. ******/
ALTER TABLE [dbo].[Surtido] ADD  CONSTRAINT [Surtido_id] UNIQUE NONCLUSTERED 
(
	[Surtido_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([Puesto_id])
REFERENCES [dbo].[Puesto] ([Puesto_id])
GO
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_med] FOREIGN KEY([Proveedor_id])
REFERENCES [dbo].[Proveedor] ([Provedor])
GO
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [fk_proveedor_med]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [fk_empleados_suc] FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleados] ([Empleados_id])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [fk_empleados_suc]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_suc] FOREIGN KEY([Proveedor_id])
REFERENCES [dbo].[Proveedor] ([Provedor])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [fk_proveedor_suc]
GO
ALTER TABLE [dbo].[Surtido]  WITH CHECK ADD  CONSTRAINT [fk_medicamento_surt] FOREIGN KEY([Medicamento_id])
REFERENCES [dbo].[Medicamento] ([Medicamento_id])
GO
ALTER TABLE [dbo].[Surtido] CHECK CONSTRAINT [fk_medicamento_surt]
GO
ALTER TABLE [dbo].[Surtido]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_surt] FOREIGN KEY([Proveedor_id])
REFERENCES [dbo].[Proveedor] ([Provedor])
GO
ALTER TABLE [dbo].[Surtido] CHECK CONSTRAINT [fk_proveedor_surt]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [MayordeDiesiciete] CHECK  ((datediff(year,[Fecha_nac_emp],getdate())>(17)))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [MayordeDiesiciete]
GO
