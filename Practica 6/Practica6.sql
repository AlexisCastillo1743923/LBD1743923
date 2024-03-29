USE [Farmacia_1743923]
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
/****** Object:  Index [Surtido_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Surtido] DROP CONSTRAINT [Surtido_id]
GO
/****** Object:  Index [Sucursal_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Sucursal] DROP CONSTRAINT [Sucursal_id]
GO
/****** Object:  Index [UQ__proveedo__0465F7C28E64A6EB]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Proveedor] DROP CONSTRAINT [UQ__proveedo__0465F7C28E64A6EB]
GO
/****** Object:  Index [Proveedor_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Proveedor] DROP CONSTRAINT [proveedor_id]
GO
/****** Object:  Table [dbo].[Surtido]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[Surtido]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[medicamento]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 03/12/2019 09:23:12 p. m. ******/
DROP TABLE [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 03/12/2019 09:23:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Empleado_ID] [int] NOT NULL,
	[Nombre_empleado] [varchar](50) NULL,
	[ApPaterno_empleado] [varchar](50) NULL,
	[ApMaterno_empleado] [varchar](50) NULL,
	[Fecha_nac_empleado] [date] NOT NULL,
	[Domicilio_empleado] [varchar](150) NULL,
	[Correo_empleado] [varchar](100) NULL,
	[Telefono_empleado] [numeric](20) NULL,
	[Celular_empleado] [numeric](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Empleado_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 03/12/2019 09:23:12 p. m. ******/
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
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/12/2019 09:23:12 p. m. ******/
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
/****** Object:  Table [dbo].[Puesto]    Script Date: 03/12/2019 09:23:12 p. m. ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 03/12/2019 09:23:12 p. m. ******/
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
/****** Object:  Table [dbo].[Surtido]    Script Date: 03/12/2019 09:23:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surtido](
	[Surtido_id] [int] NOT NULL,
	[Proveedor_id] [int] NOT NULL,
	[Precio_compra_med_surt] [int] NOT NULL,
	[Medicamento_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Surtido_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (1, N'Jose Jose', N'Holmes', N'Sutton', CAST(N'2011-01-16' AS Date), N'3530 In C.', N'sem@diameu.net', N'(467) 392-0577', N'52-31-16-98-75-19')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (2, N'Hokage', N'Peck', N'Lyons', CAST(N'2002-05-11' AS Date), N'Apartado núm.: 166, 5704 Sodales Avda.', N'Nunc.mauris@estvitaesodales.co.uk', N'(636) 789-1396', N'52-30-67-65-81-39')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (3, N'Woddy', N'Hoffman', N'Morrison', CAST(N'2019-01-17' AS Date), N'Apdo.:751-5029 Iaculis Carretera', N'consequat.dolor@liberomaurisaliquam.ca', N'(282) 585-8795', N'52-41-27-21-67-47')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (4, N'Finn', N'Brady', N'Sutton', CAST(N'1993-03-17' AS Date), N'Apartado núm.: 273, 6027 Eget Calle', N'posuere@torquent.edu', N'(732) 828-4626', N'52-21-34-60-93-46')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (5, N'Zeus', N'Gallegos', N'Marquez', CAST(N'2001-01-16' AS Date), N'3530 In C.', N'sem@diameu.net', N'(467) 392-0577', N'52-31-16-98-75-19')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (6, N'Hall', N'Chan', N'Nielsen', CAST(N'1997-05-07' AS Date), N'Apdo.:876-3979 Eu, C/', N'Sed.nec.metus@justoPraesentluctus.ca', N'(834) 542-8016', N'52-24-57-10-85-22')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (7, N'Wyatt', N'Hicks', N'Rosales', CAST(N'2018-06-09' AS Date), N'6892 Phasellus Ctra.', N'fringilla.mi@ipsumCurabiturconsequat.net', N'(197) 535-6862', N'52-11-11-69-82-28')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (8, N'Owen', N'Mccoy', N'Curtis', CAST(N'2008-08-24' AS Date), N'Apdo.:790-732 Eget Calle', N'eget.volutpat@et.ca', N'(692) 758-5783', N'52-28-41-68-39-76')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (9, N'Cailin', N'Sims', N'Norton', CAST(N'2000-04-25' AS Date), N'Apdo.:716-3186 Placerat, C/', N'tellus.faucibus.leo@faucibus.net', N'(519) 681-2618', N'52-26-77-78-41-54')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (10, N'Jessamine', N'Fry', N'Waller', CAST(N'2005-05-13' AS Date), N'Apdo.:446-2285 Leo, Av.', N'luctus.et.ultrices@enimconsequatpurus.edu', N'(537) 126-9297', N'52-85-20-71-18-56')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (11, N'Shea', N'King', N'Vega', CAST(N'2003-11-03' AS Date), N'Apartado núm.: 808, 4706 Pede Calle', N'Donec.egestas@a.ca', N'(701) 249-8376', N'52-11-60-92-68-97')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (12, N'Winifred', N'Head', N'Pitts', CAST(N'2011-07-03' AS Date), N'1477 Ornare, Av.', N'mauris.ut.mi@nequenonquam.edu', N'(356) 798-5511', N'52-75-21-56-49-15')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (13, N'Rama', N'Neal', N'Mccarthy', CAST(N'2000-01-13' AS Date), N'348-4967 Magna Calle', N'faucibus@duiin.edu', N'(570) 725-0408', N'52-66-26-84-74-61')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (14, N'Aristotle', N'Haney', N'Beard', CAST(N'1998-10-25' AS Date), N'Apdo.:112-3720 Lorem Av.', N'montes.nascetur.ridiculus@sitamet.ca', N'(840) 842-2215', N'52-79-34-19-96-54')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (15, N'Sopoline', N'Mccullough', N'Vang', CAST(N'2015-11-05' AS Date), N'Apartado núm.: 887, 553 In Avda.', N'Nunc.mauris.Morbi@natoque.edu', N'(910) 319-7175', N'52-44-86-50-92-36')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (16, N'Nyssa', N'Pratt', N'Doyle', CAST(N'1998-12-12' AS Date), N'Apartado núm.: 296, 775 At Avenida', N'Praesent.eu.dui@erategetipsum.edu', N'(592) 812-0062', N'52-17-34-79-40-70')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (17, N'Amal', N'Jackson', N'Walter', CAST(N'2011-11-15' AS Date), N'386-4047 Rhoncus C.', N'turpis@magna.edu', N'(558) 545-7267', N'52-99-58-95-95-19')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (18, N'Eliana', N'Doyle', N'Hutchinson', CAST(N'2008-08-18' AS Date), N'Apartado núm.: 317, 2571 Scelerisque Calle', N'Morbi@malesuadafamesac.net', N'(411) 799-1598', N'52-48-35-67-39-94')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (19, N'Kenneth', N'Wynn', N'Huff', CAST(N'2012-11-01' AS Date), N'Apdo.:708-639 A Ctra.', N'Aenean.gravida@ullamcorpervelitin.edu', N'(534) 576-5501', N'52-75-29-27-58-56')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (20, N'Clinton', N'Callahan', N'Valentine', CAST(N'2012-06-04' AS Date), N'2128 Vestibulum. C/', N'eu@quisurnaNunc.ca', N'(757) 525-4776', N'52-48-61-76-28-16')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (21, N'Guinevere', N'Joyner', N'Quinn', CAST(N'2016-05-17' AS Date), N'Apdo.:433-3634 Vivamus Carretera', N'nibh.Phasellus@erat.com', N'(605) 669-1399', N'52-39-59-46-49-80')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (22, N'Ramona', N'Terry', N'Ochoa', CAST(N'2019-01-08' AS Date), N'118-5303 Urna. Avda.', N'at@orciquislectus.org', N'(806) 814-3295', N'52-71-36-88-32-14')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (23, N'August', N'Gill', N'Frederick', CAST(N'2005-04-21' AS Date), N'6818 Condimentum. Avenida', N'nec.mollis@ultricesposuere.edu', N'(743) 269-7849', N'52-31-76-16-12-41')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (24, N'Hanae', N'Valentine', N'Sargent', CAST(N'1992-10-05' AS Date), N'5836 Ipsum. Ctra.', N'pede.ac@eratsemperrutrum.net', N'(673) 337-6999', N'52-10-57-41-60-33')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (25, N'Martin', N'Sykes', N'Huff', CAST(N'2001-09-17' AS Date), N'9384 Parturient Calle', N'Etiam.vestibulum@necquam.com', N'(651) 694-1639', N'52-21-46-40-58-58')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (26, N'Cheryl', N'Bryant', N'Hurley', CAST(N'2012-04-25' AS Date), N'408-487 Justo Ctra.', N'faucibus.orci.luctus@pede.ca', N'(766) 908-3578', N'52-51-57-11-26-76')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (27, N'Nasim', N'Roman', N'Foley', CAST(N'2010-10-05' AS Date), N'107-5280 Fermentum ', N'Duis.risus@ipsumdolorsit.org', N'(760) 992-3223', N'52-24-35-86-12-77')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (28, N'Desiree', N'Mcgowan', N'Kane', CAST(N'1998-07-07' AS Date), N'184-2267 Molestie Av.', N'dolor@Duissitamet.ca', N'(767) 880-1084', N'52-28-83-37-85-60')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (29, N'Ivana', N'Haley', N'Jensen', CAST(N'2007-12-01' AS Date), N'8806 Auctor Ctra.', N'litora.torquent.per@eratsemper.co.uk', N'(615) 603-2926', N'52-20-33-35-76-86')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (30, N'Evelyn', N'Kim', N'Sharp', CAST(N'1992-05-23' AS Date), N'Apdo.:252-7113 Auctor Calle', N'Ut@In.edu', N'(788) 299-8657', N'52-97-78-13-18-94')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (31, N'Kirsten', N'Dejesus', N'Payne', CAST(N'2004-07-06' AS Date), N'Apartado núm.: 842, 3270 Ac C.', N'Fusce.mi.lorem@etmagnis.co.uk', N'(647) 512-2028', N'52-83-61-74-69-21')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (32, N'Cain', N'Santos', N'Dillard', CAST(N'2017-04-17' AS Date), N'Apdo.:995-7964 Non, ', N'blandit.enim.consequat@Maurisnondui.com', N'(188) 806-5478', N'52-49-97-66-94-29')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (33, N'Zeph', N'Beard', N'Johns', CAST(N'2019-09-21' AS Date), N'Apartado núm.: 871, 7488 Sit Carretera', N'interdum.libero@diam.com', N'(940) 509-9943', N'52-35-14-87-92-63')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (34, N'Yardley', N'Herman', N'Fletcher', CAST(N'2016-07-13' AS Date), N'7755 Malesuada ', N'ac.fermentum@gravidamauris.edu', N'(687) 465-0456', N'52-88-48-55-92-79')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (35, N'Genevieve', N'Bishop', N'Jimenez', CAST(N'2005-08-09' AS Date), N'Apartado núm.: 705, 9979 Orci. Carretera', N'fringilla.porttitor.vulputate@velit.ca', N'(801) 940-0186', N'52-14-22-15-65-51')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (36, N'Hoyt', N'Howell', N'Burke', CAST(N'2012-08-11' AS Date), N'2022 Ornare, Carretera', N'neque.non@consequatpurusMaecenas.edu', N'(699) 518-0436', N'52-35-36-71-53-90')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (37, N'Joy', N'Jackson', N'Hunter', CAST(N'2012-06-28' AS Date), N'Apdo.:622-4967 Fusce C.', N'ornare.lectus.ante@Intincidunt.com', N'(267) 181-6322', N'52-64-80-75-77-25')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (38, N'Lavinia', N'Burns', N'Abbott', CAST(N'2016-07-04' AS Date), N'Apdo.:697-1671 Metus Avenida', N'Pellentesque@etrutrum.ca', N'(793) 152-0353', N'52-25-83-13-49-46')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (39, N'Wanda', N'Mitchell', N'Munoz', CAST(N'1993-07-09' AS Date), N'968-7256 Donec Carretera', N'eu@eget.ca', N'(335) 161-0213', N'52-98-75-24-69-75')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (40, N'Macey', N'Cortez', N'Castillo', CAST(N'2001-06-28' AS Date), N'339-490 Erat ', N'sed.turpis.nec@pede.co.uk', N'(653) 123-9893', N'52-81-16-75-21-70')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (41, N'Joshua', N'Contreras', N'Middleton', CAST(N'1993-05-03' AS Date), N'Apartado núm.: 802, 5673 Tincidunt Avenida', N'lorem.ipsum.sodales@sempercursus.co.uk', N'(792) 197-6671', N'52-28-68-24-99-40')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (42, N'Zenaida', N'Casey', N'Burris', CAST(N'2005-07-08' AS Date), N'Apartado núm.: 425, 3901 Diam C/', N'Cras@libero.com', N'(306) 724-6491', N'52-85-97-57-75-29')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (43, N'Lawrence', N'Velazquez', N'Walker', CAST(N'2019-03-17' AS Date), N'454-7340 Dictum C/', N'elit.pellentesque.a@laoreetlibero.com', N'(281) 983-5836', N'52-57-71-25-52-15')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (44, N'Glenna', N'Gentry', N'Ayers', CAST(N'2006-05-05' AS Date), N'Apdo.:922-4132 Sociis Carretera', N'diam@Curabitur.co.uk', N'(522) 607-4905', N'52-61-98-25-18-34')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (45, N'Hall', N'Eaton', N'Wynn', CAST(N'2013-08-08' AS Date), N'458-2589 Quisque Calle', N'tristique@auctor.net', N'(941) 808-3341', N'52-21-53-23-21-51')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (46, N'Whoopi', N'Knapp', N'Brooks', CAST(N'1998-05-24' AS Date), N'9483 Mattis. C/', N'sem.Pellentesque@inconsequat.com', N'(335) 822-4983', N'52-22-19-99-71-25')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (47, N'Astra', N'Dixon', N'Wilkerson', CAST(N'2018-02-21' AS Date), N'405-4569 Morbi Calle', N'Mauris.nulla@accumsanlaoreet.edu', N'(776) 537-5603', N'52-73-29-87-58-85')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (48, N'Zenaida', N'Benjamin', N'Watts', CAST(N'2017-07-18' AS Date), N'Apartado núm.: 598, 9447 Enim, Ctra.', N'risus.In@Aliquamtincidunt.co.uk', N'(905) 699-9931', N'52-64-93-94-52-32')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (49, N'Regina', N'Mccormick', N'Hernandez', CAST(N'1999-07-24' AS Date), N'137-7246 Proin Avda.', N'Duis.a.mi@accumsanconvallis.edu', N'(832) 975-1569', N'52-89-73-50-96-79')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (50, N'Rachel', N'Snider', N'Sanford', CAST(N'2016-01-20' AS Date), N'Apartado núm.: 186, 756 Odio Avda.', N'sit.amet@mattisvelitjusto.net', N'(560) 170-4100', N'52-97-33-34-83-86')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (51, N'Logan', N'Frazier', N'Roberts', CAST(N'2014-02-14' AS Date), N'Apartado núm.: 947, 5396 Commodo ', N'et.rutrum@Crasvehiculaaliquet.co.uk', N'(572) 759-3805', N'52-15-79-34-70-70')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (52, N'Cassandra', N'Drake', N'Young', CAST(N'2018-07-04' AS Date), N'Apartado núm.: 204, 365 Eu C.', N'Sed.molestie.Sed@a.net', N'(249) 992-9410', N'52-97-52-76-70-62')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (53, N'Sheila', N'Manning', N'Holt', CAST(N'2003-03-09' AS Date), N'Apartado núm.: 778, 1953 Condimentum. C/', N'egestas.ligula@Pellentesquehabitant.com', N'(286) 201-8068', N'52-48-87-50-85-52')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (54, N'Maxwell', N'Conner', N'Herring', CAST(N'2004-04-13' AS Date), N'Apartado núm.: 114, 6635 Praesent Calle', N'congue@Duisrisus.org', N'(618) 979-9818', N'52-13-91-85-62-78')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (55, N'Hoyt', N'Juarez', N'Klein', CAST(N'2018-11-03' AS Date), N'Apartado núm.: 683, 9373 Sit Av.', N'eget.laoreet@inhendrerit.edu', N'(937) 390-7237', N'52-71-29-79-58-77')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (56, N'Walter', N'Davidson', N'Montgomery', CAST(N'1995-02-09' AS Date), N'207-2019 Lacus, ', N'mauris@nunc.com', N'(589) 746-2555', N'52-59-32-29-27-25')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (57, N'Colton', N'Mcguire', N'Kane', CAST(N'1996-07-02' AS Date), N'Apartado núm.: 727, 6568 Mauris, Calle', N'non@orci.net', N'(910) 384-7455', N'52-38-42-57-98-89')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (58, N'Aurora', N'Horn', N'Pruitt', CAST(N'1994-02-22' AS Date), N'Apartado núm.: 148, 3101 Pellentesque C/', N'conubia.nostra@Fusce.ca', N'(189) 785-1125', N'52-63-88-46-21-15')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (59, N'Guy', N'Mccoy', N'Daniel', CAST(N'2007-07-19' AS Date), N'Apartado núm.: 143, 2065 Nonummy C/', N'ut@mifringillami.net', N'(993) 383-6701', N'52-10-68-79-96-71')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (60, N'Lucy', N'Leonard', N'Bray', CAST(N'2002-11-30' AS Date), N'2638 Id, C.', N'egestas.blandit.Nam@odiotristique.org', N'(259) 334-6409', N'52-95-37-20-30-30')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (61, N'Gretchen', N'Macias', N'Kent', CAST(N'1996-11-08' AS Date), N'521 Sem. Carretera', N'diam@Nullamvelitdui.edu', N'(479) 888-3179', N'52-96-95-86-15-98')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (62, N'Lamar', N'Hutchinson', N'Hendricks', CAST(N'2012-06-08' AS Date), N'158-8167 Vivamus C/', N'lectus.convallis@sempererat.edu', N'(924) 552-2195', N'52-80-92-75-72-67')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (63, N'Merritt', N'Strickland', N'Ortiz', CAST(N'2002-10-28' AS Date), N'Apartado núm.: 738, 3040 Nam Avda.', N'non.justo.Proin@luctus.com', N'(325) 198-6253', N'52-99-17-23-40-13')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (64, N'Scarlett', N'Leon', N'Myers', CAST(N'2010-12-06' AS Date), N'5094 Ipsum. Calle', N'amet.diam@Aeneansed.ca', N'(561) 492-3737', N'52-36-21-71-56-91')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (65, N'Byron', N'Grimes', N'Joyner', CAST(N'1998-10-01' AS Date), N'Apartado núm.: 784, 8574 In C.', N'cursus.diam.at@tristiqueac.net', N'(181) 730-6700', N'52-19-87-16-89-87')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (66, N'Drake', N'Noble', N'Booth', CAST(N'1994-07-06' AS Date), N'125-4271 Dolor Ctra.', N'risus.at@dolor.co.uk', N'(348) 537-7885', N'52-47-30-34-54-25')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (67, N'Fay', N'Berry', N'Vasquez', CAST(N'2011-07-13' AS Date), N'Apartado núm.: 333, 6276 Nullam Carretera', N'suscipit.nonummy.Fusce@tristiquesenectuset.co.uk', N'(409) 369-9972', N'52-61-48-79-78-97')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (68, N'Leo', N'Mcclain', N'Fisher', CAST(N'2008-10-06' AS Date), N'Apartado núm.: 332, 2642 Nec Carretera', N'blandit@tinciduntduiaugue.co.uk', N'(170) 798-3330', N'52-95-37-36-78-36')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (69, N'Hall', N'Wilson', N'Paul', CAST(N'2003-09-12' AS Date), N'Apdo.:260-1759 In Av.', N'natoque.penatibus.et@estmollis.ca', N'(918) 767-5396', N'52-65-38-16-51-40')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (70, N'Janna', N'Burgess', N'Duke', CAST(N'2009-10-23' AS Date), N'Apartado núm.: 680, 8415 Suspendisse C/', N'diam.dictum@nostraperinceptos.edu', N'(339) 185-9185', N'52-33-24-34-35-35')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (71, N'Tanek', N'Drake', N'Villarreal', CAST(N'2004-06-11' AS Date), N'Apartado núm.: 956, 9895 Fringilla C.', N'Fusce@dolornonummyac.org', N'(456) 162-3576', N'52-65-89-43-20-98')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (72, N'Sean', N'Peters', N'Britt', CAST(N'2014-11-18' AS Date), N'347-4947 Arcu Ctra.', N'arcu.Sed@urna.org', N'(123) 873-9612', N'52-88-69-30-75-93')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (73, N'Ivana', N'Moody', N'Wolfe', CAST(N'1996-12-25' AS Date), N'Apdo.:765-4370 Non, C/', N'mi@imperdieterat.ca', N'(229) 147-5778', N'52-91-67-27-15-20')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (74, N'Dieter', N'Vance', N'Bond', CAST(N'2000-04-10' AS Date), N'823-4157 Parturient Ctra.', N'mauris.Suspendisse@justo.edu', N'(372) 161-5019', N'52-50-89-58-66-78')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (75, N'Aidan', N'Knight', N'Talley', CAST(N'2014-03-20' AS Date), N'Apdo.:647-1934 Lacus. C.', N'lacinia.orci.consectetuer@velitin.co.uk', N'(787) 291-8625', N'52-72-25-94-34-18')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (76, N'Jonas', N'Weiss', N'Bell', CAST(N'2016-05-08' AS Date), N'5245 Lacus, Av.', N'erat.vitae.risus@quam.com', N'(440) 220-1577', N'52-47-35-76-24-46')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (77, N'Tucker', N'Maddox', N'Cash', CAST(N'1992-11-13' AS Date), N'Apartado núm.: 257, 1678 Eget Ctra.', N'turpis@Vivamus.com', N'(258) 327-9924', N'52-70-67-76-26-86')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (78, N'Desiree', N'Bowen', N'Barnett', CAST(N'2006-06-26' AS Date), N'Apdo.:104-5682 Malesuada Av.', N'tristique@Duisami.ca', N'(424) 784-5795', N'52-69-92-62-67-76')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (79, N'Autumn', N'Hodge', N'Mcdaniel', CAST(N'2006-08-08' AS Date), N'675-8068 Arcu. Avda.', N'eleifend@adipiscingfringillaporttitor.net', N'(164) 469-5957', N'52-85-20-72-85-61')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (80, N'Tad', N'Fields', N'Juarez', CAST(N'2005-04-12' AS Date), N'7802 Montes, Calle', N'magna.a@vehiculaet.com', N'(102) 466-7446', N'52-98-72-43-70-15')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (81, N'Ann', N'Decker', N'Parker', CAST(N'2010-06-02' AS Date), N'Apdo.:521-4070 Lectus C/', N'ultricies.ligula@VivamusnisiMauris.org', N'(140) 534-5252', N'52-19-64-52-96-28')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (82, N'Moana', N'Mcintyre', N'Avery', CAST(N'1997-04-19' AS Date), N'Apdo.:306-8265 Ipsum Carretera', N'feugiat.tellus@velitAliquamnisl.org', N'(676) 815-2275', N'52-77-92-62-80-32')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (83, N'Brandon', N'Bright', N'Oconnor', CAST(N'2005-06-21' AS Date), N'Apartado núm.: 931, 9896 Non, Calle', N'non.dapibus.rutrum@ridiculus.org', N'(209) 428-4144', N'52-62-36-45-10-79')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (84, N'Martena', N'Hickman', N'Ingram', CAST(N'1993-03-08' AS Date), N'5306 Eu, C.', N'Nulla.aliquet@convallis.org', N'(946) 981-3935', N'52-41-44-78-98-18')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (85, N'Cleo', N'Alexander', N'Riggs', CAST(N'2003-09-26' AS Date), N'Apdo.:183-4688 Dis Avda.', N'metus.Aliquam@magnisdis.com', N'(402) 585-4562', N'52-45-13-25-37-94')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (86, N'Ezra', N'Ellis', N'Banks', CAST(N'1999-10-30' AS Date), N'Apdo.:565-9504 Et Calle', N'facilisis.Suspendisse@ullamcorpervelitin.net', N'(944) 430-5963', N'52-79-57-56-30-86')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (87, N'Andrew', N'Lloyd', N'Cardenas', CAST(N'1998-04-13' AS Date), N'715-4013 Magna. Av.', N'nisl.sem.consequat@Nulla.com', N'(552) 878-8844', N'52-98-23-77-55-37')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (88, N'Leo', N'Hodges', N'Norton', CAST(N'2015-07-21' AS Date), N'Apartado núm.: 901, 1053 Mauris C/', N'Aliquam.nec@turpisegestasAliquam.co.uk', N'(965) 954-3216', N'52-92-12-66-90-95')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (89, N'Ulla', N'Rosa', N'Moss', CAST(N'2010-06-27' AS Date), N'491-8553 Fermentum Av.', N'In.at@tortornibhsit.edu', N'(645) 662-7492', N'52-57-73-68-79-73')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (90, N'Nicole', N'Moon', N'Cline', CAST(N'2019-03-11' AS Date), N'Apartado núm.: 651, 2841 Auctor, C/', N'fames.ac@orciadipiscingnon.net', N'(272) 102-9608', N'52-97-41-84-81-79')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (91, N'Hyacinth', N'Ellison', N'Weber', CAST(N'2004-02-02' AS Date), N'2540 Euismod C/', N'sapien.molestie.orci@dolorsit.org', N'(867) 746-4118', N'52-49-27-95-12-45')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (92, N'Meghan', N'Castaneda', N'Maynard', CAST(N'2008-06-14' AS Date), N'Apdo.:565-1687 Quisque Av.', N'et.malesuada@fringilla.edu', N'(531) 381-7419', N'52-68-46-50-31-81')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (93, N'Dieter', N'Barker', N'Farmer', CAST(N'2017-01-13' AS Date), N'9348 Ultrices Calle', N'ipsum@leoVivamus.co.uk', N'(182) 591-3134', N'52-53-35-48-23-87')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (94, N'Nolan', N'Macias', N'Buckley', CAST(N'2019-02-09' AS Date), N'576-5313 At Ctra.', N'Integer.eu@semutdolor.edu', N'(293) 891-0790', N'52-98-39-59-94-35')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (95, N'Patrick', N'Allen', N'Jordan', CAST(N'1992-11-10' AS Date), N'856-6009 Vestibulum Avenida', N'justo.Proin@in.com', N'(511) 714-9901', N'52-34-80-58-18-36')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (96, N'Kiona', N'Schultz', N'Henderson', CAST(N'2014-03-21' AS Date), N'8808 Iaculis Calle', N'bibendum.fermentum.metus@semperduilectus.co.uk', N'(398) 215-1462', N'52-16-59-95-92-39')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (97, N'Giacomo', N'Alford', N'Hayden', CAST(N'2001-11-28' AS Date), N'Apartado núm.: 171, 1199 Erat Ctra.', N'mauris@acmattis.co.uk', N'(475) 897-4410', N'52-20-10-36-54-99')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (98, N'Lawrence', N'Shields', N'Roy', CAST(N'2008-11-26' AS Date), N'5381 Dolor, ', N'Ut.tincidunt@molestie.net', N'(747) 143-2622', N'52-46-28-81-89-26')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (99, N'Marny', N'Fox', N'Pearson', CAST(N'1999-05-31' AS Date), N'7737 Magnis Ctra.', N'erat.nonummy.ultricies@molestieorci.edu', N'(628) 104-0572', N'52-96-36-76-55-84')
INSERT [dbo].[Empleado] ([Empleado_ID], [Nombre_empleado], [ApPaterno_empleado], [ApMaterno_empleado], [Fecha_nac_empleado], [Domicilio_empleado], [Correo_empleado], [Telefono_empleado], [Celular_empleado]) VALUES (100, N'Chastity', N'Montoya', N'Alford', CAST(N'2019-04-07' AS Date), N'Apartado núm.: 777, 1774 Id, Av.', N'velit@cursus.com', N'(383) 478-8034', N'52-62-54-44-29-24')
GO
/****** Object:  Index [Proveedor_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Proveedor] ADD  CONSTRAINT [Proveedor_id] UNIQUE NONCLUSTERED 
(
	[Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__proveedo__0465F7C28E64A6EB]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Proveedor] ADD UNIQUE NONCLUSTERED 
(
	[Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sucursal_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Sucursal] ADD  CONSTRAINT [Sucursal_id] UNIQUE NONCLUSTERED 
(
	[Sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Surtido_id]    Script Date: 03/12/2019 09:23:12 p. m. ******/
ALTER TABLE [dbo].[Surtido] ADD  CONSTRAINT [Surtido_id] UNIQUE NONCLUSTERED 
(
	[Surtido_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
