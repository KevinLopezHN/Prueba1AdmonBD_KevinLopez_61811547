USE [Mercadito]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](256) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[IdCaja] [int] IDENTITY(1,1) NOT NULL,
	[IdIngreso] [int] NULL,
	[IdEgreso] [int] NULL,
	[FechaApertura] [date] NULL,
	[FechaCierre] [date] NULL,
 CONSTRAINT [PK_Caja] PRIMARY KEY CLUSTERED 
(
	[IdCaja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Egreso]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Egreso](
	[IdEgreso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_Egreso] PRIMARY KEY CLUSTERED 
(
	[IdEgreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK__usuario__080A9743688B44A6] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 20/11/2020 22:33:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](20) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[impuesto] [int] NOT NULL,
	[total] [int] NOT NULL,
	[estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK__venta__F82D1AFB91DE6B6E] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[articulo] ON 

INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [estado]) VALUES (1, 1, N'Ce-1', N'Corn Flakers', CAST(50.00 AS Decimal(11, 2)), 100, N'Caja', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [estado]) VALUES (2, 2, N'La-1', N'Queso', CAST(40.00 AS Decimal(11, 2)), 230, N'Libra', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [estado]) VALUES (3, 2, N'La-2', N'Mantequilla', CAST(50.00 AS Decimal(11, 2)), 150, N'Onza', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [estado]) VALUES (1005, 1002, N'Ca-1', N'Pollo', CAST(50.00 AS Decimal(11, 2)), 20, N'Libra', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precio_venta], [stock], [descripcion], [estado]) VALUES (1006, 1002, N'Ca-2', N'Ternera', CAST(100.00 AS Decimal(11, 2)), 30, N'Libra', 1)
SET IDENTITY_INSERT [dbo].[articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Caja] ON 

INSERT [dbo].[Caja] ([IdCaja], [IdIngreso], [IdEgreso], [FechaApertura], [FechaCierre]) VALUES (1, 1, 1, CAST(N'2020-11-20' AS Date), CAST(N'2020-11-20' AS Date))
INSERT [dbo].[Caja] ([IdCaja], [IdIngreso], [IdEgreso], [FechaApertura], [FechaCierre]) VALUES (2, 1, 1, CAST(N'2020-11-20' AS Date), CAST(N'2020-11-20' AS Date))
SET IDENTITY_INSERT [dbo].[Caja] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (1, N'Cereales', N'Seccion Comidas', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (2, N'Lacteos', N'Seccion Refrigerante', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [estado]) VALUES (1002, N'Carnes', N'Carnes en refrigerador', 1)
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_ingreso] ON 

INSERT [dbo].[detalle_ingreso] ([iddetalle_ingreso], [idingreso], [idarticulo], [cantidad], [precio]) VALUES (1, 1, 3, 50, CAST(200.00 AS Decimal(11, 2)))
INSERT [dbo].[detalle_ingreso] ([iddetalle_ingreso], [idingreso], [idarticulo], [cantidad], [precio]) VALUES (2, 1, 1, 20, CAST(400.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[detalle_ingreso] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 

INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idarticulo], [cantidad], [precio], [descuento]) VALUES (1, 1, 1, 2, CAST(100.00 AS Decimal(11, 2)), CAST(30.00 AS Decimal(11, 2)))
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [idarticulo], [cantidad], [precio], [descuento]) VALUES (2, 1, 2, 4, CAST(120.00 AS Decimal(11, 2)), CAST(20.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Egreso] ON 

INSERT [dbo].[Egreso] ([IdEgreso], [Descripcion], [Cantidad]) VALUES (1, N'Pago de Luz', 1000)
INSERT [dbo].[Egreso] ([IdEgreso], [Descripcion], [Cantidad]) VALUES (2, N'Impuesto alcaldia', 500)
INSERT [dbo].[Egreso] ([IdEgreso], [Descripcion], [Cantidad]) VALUES (3, N'Telefono', 200)
INSERT [dbo].[Egreso] ([IdEgreso], [Descripcion], [Cantidad]) VALUES (4, N'Agua', 200)
INSERT [dbo].[Egreso] ([IdEgreso], [Descripcion], [Cantidad]) VALUES (5, N'Comida de Casa', 500)
SET IDENTITY_INSERT [dbo].[Egreso] OFF
GO
SET IDENTITY_INSERT [dbo].[ingreso] ON 

INSERT [dbo].[ingreso] ([idingreso], [idproveedor], [idusuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [fecha], [impuesto], [total], [estado]) VALUES (1, 1, 1, N'factura', N'32784', N'2319', CAST(N'2020-11-20T23:59:59.997' AS DateTime), CAST(15.00 AS Decimal(4, 2)), CAST(1000.00 AS Decimal(11, 2)), N'1')
SET IDENTITY_INSERT [dbo].[ingreso] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (1, N'Proveedor', N'Alvarado Sanchez', N'Identidad', N'161820011111', N'Sps', N'98182439', N'Al_sanchez@gmail.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (2, N'Cliente', N'Juanita Leiva', N'Identidad', N'050119993474', N'Villanueva', N'90878949', N'Juanita@hotmai.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (3, N'ClienteCredito', N'Pedro Ramirez', N'Identidad', N'050120008391', N'Villanueva', N'90989901', N'Pedro_Ramirez@hotmail.com')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (4, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[persona] ([idpersona], [tipo_persona], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email]) VALUES (6, N'string', N'string', N'string', N'string', N'string', N'string', N'string')
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [estado]) VALUES (1, N'Administrador', N'Gestiona todo', 1)
INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [estado]) VALUES (2, N'Controlador', N'Controla las ventas', 1)
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado]) VALUES (1, 1, N'Kevin Lopez', N'identidad', N'1618200038389', N'Villanueva', N'96064399', N'kevinlopez@hotmail.es', N'kevolopez', 1)
INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado]) VALUES (2, 1, N'string', N'string', N'string', N'string', N'string', N'string', N'string', 1)
INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipo_documento], [num_documento], [direccion], [telefono], [email], [password], [estado]) VALUES (3, 1, N'string', N'string', N'string', N'string', N'string', N'string', N'contrasenacambiada', 1)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([idventa], [idcliente], [idusuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [fecha_hora], [impuesto], [total], [estado]) VALUES (1, 2, 1, N'identidad', N'124565', N'234', CAST(N'2020-11-20T23:59:59.997' AS DateTime), 15, 12356, N'1')
INSERT [dbo].[venta] ([idventa], [idcliente], [idusuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [fecha_hora], [impuesto], [total], [estado]) VALUES (2, 3, 1, N'identidad', N'12380', N'8479', CAST(N'2020-11-20T23:59:59.997' AS DateTime), 15, 203, N'1')
INSERT [dbo].[venta] ([idventa], [idcliente], [idusuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [fecha_hora], [impuesto], [total], [estado]) VALUES (5, 1, 1, N'identidad', N'1233', N'string', CAST(N'2020-11-21T03:12:12.817' AS DateTime), 15, 1300, N'true')
INSERT [dbo].[venta] ([idventa], [idcliente], [idusuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [fecha_hora], [impuesto], [total], [estado]) VALUES (6, 1, 1, N'identidad', N'1233', N'string', CAST(N'2020-11-21T03:12:12.817' AS DateTime), 15, 300, N'true')
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__articulo__72AFBCC6EDAFE29F]    Script Date: 20/11/2020 22:33:59 ******/
ALTER TABLE [dbo].[articulo] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__72AFBCC6E75E8CA2]    Script Date: 20/11/2020 22:33:59 ******/
ALTER TABLE [dbo].[categoria] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__estado__31EC6D26]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_Egreso] FOREIGN KEY([IdEgreso])
REFERENCES [dbo].[Egreso] ([IdEgreso])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_Egreso]
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_ingreso] FOREIGN KEY([IdIngreso])
REFERENCES [dbo].[ingreso] ([idingreso])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_ingreso]
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK__detalle_v__idven__412EB0B6] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK__detalle_v__idven__412EB0B6]
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK__ingreso__idusuar__36B12243] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK__ingreso__idusuar__36B12243]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK__usuario__idrol__32E0915F] FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK__usuario__idrol__32E0915F]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idcliente__3D5E1FD2] FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idcliente__3D5E1FD2]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idusuario__3E52440B] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idusuario__3E52440B]
GO
