USE [MercaditoN1]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[IdCaja] [int] NOT NULL,
	[IdIngreso] [int] NULL,
	[IdEgreso] [int] NULL,
	[FechaApertura] [datetime] NULL,
	[FechaCierre] [datetime] NULL,
 CONSTRAINT [PK_Caja] PRIMARY KEY CLUSTERED 
(
	[IdCaja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Egreso]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Egreso](
	[IdEgreso] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_Egreso] PRIMARY KEY CLUSTERED 
(
	[IdEgreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IdIngreso] [int] NOT NULL,
	[Proveedor] [varchar](50) NULL,
	[Vendedor] [varchar](50) NULL,
	[Total] [int] NULL,
	[Impuesto] [int] NULL,
	[Articulo] [varchar](50) NULL,
	[Cantidad] [varchar](50) NULL,
	[Categoria] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[IdVendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 20/11/2020 22:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Idventa] [int] NOT NULL,
	[IdCliente] [int] NULL,
	[IdVendedor] [int] NULL,
	[Fecha] [datetime] NULL,
	[Impuesto] [int] NULL,
	[Total] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [int] NULL,
	[descuento] [int] NULL,
	[articulo] [varchar](50) NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_Egreso] FOREIGN KEY([IdEgreso])
REFERENCES [dbo].[Egreso] ([IdEgreso])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_Egreso]
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_Ingreso] FOREIGN KEY([IdIngreso])
REFERENCES [dbo].[Ingreso] ([IdIngreso])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_Ingreso]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([IdVendedor])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Vendedor]
GO
