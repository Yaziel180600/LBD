USE [master]
GO
/****** Object:  Database [Ferreteria]    Script Date: 01/06/2020 20:26:52 ******/
CREATE DATABASE [Ferreteria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ferreteria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSV\MSSQL\DATA\Ferreteria.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ferreteria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSV\MSSQL\DATA\Ferreteria_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ferreteria] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ferreteria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ferreteria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ferreteria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ferreteria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ferreteria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ferreteria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ferreteria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ferreteria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ferreteria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ferreteria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ferreteria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ferreteria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ferreteria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ferreteria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ferreteria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ferreteria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ferreteria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ferreteria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ferreteria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ferreteria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ferreteria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ferreteria] SET  MULTI_USER 
GO
ALTER DATABASE [Ferreteria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ferreteria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ferreteria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ferreteria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ferreteria] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Ferreteria]
GO
/****** Object:  UserDefinedFunction [dbo].[Total]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Total]
 (@PrecioU1 decimal(9,9),
  @PrecioU2 decimal(9,9)
 )
 returns decimal (4,3)
 as
 begin 
   declare @resultado decimal(9,2)
   set @resultado=(@PrecioU1+@PrecioU2)
   return @resultado
 end

GO
/****** Object:  UserDefinedFunction [dbo].[TotalVendidoPorProducto]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[TotalVendidoPorProducto]
(
@Id_Producto int
)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @Calcular DECIMAL(10,2)
  SELECT @Calcular =SUM(Cantidad*PrecioU)
  from Producto INNER JOIN
  Cliente on Producto.Cantidad = Cliente.Id_Cliente
  WHERE Id_Producto=@Id_Producto
  RETURN @Calcular
  END

GO
/****** Object:  Table [dbo].[Adultos]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adultos](
	[Id_Vendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Edad] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bodega](
	[Id_Bodega] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Bodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Edades23]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Edades23](
	[Id_Vendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Edad] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_Producto] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioU] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id_Vendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Edad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Adultez]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Adultez] as
SELECT Nombre,Telefono FROM Vendedor WHERE Edad>40 group by Nombre, Telefono

GO
/****** Object:  View [dbo].[Compra]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Compra] as
select Cliente.Nombre , Producto.Cantidad from Cliente
join Producto on Producto.Id_Producto = Cliente.Id_Cliente

GO
/****** Object:  View [dbo].[ContBodegas]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ContBodegas] as 
select count(Capacidad) as ContBodegas from Bodega having count(Capacidad)=1000

GO
/****** Object:  View [dbo].[Fact]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Fact] as 
select * from Bodega cross join Proveedor

GO
/****** Object:  View [dbo].[Historial]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Historial] as 
Select * from Producto E left join Bodega D on E.Id_Producto = D.Id_Bodega

GO
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (2, N'Jose Luis Esquivel', 811413324, 32)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (3, N'Juan Lara Mendez', 832344333, 33)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (4, N'Daniel Ballasteres Martinez', 814121223, 37)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (5, N'Antonio Santander Gomez ', 811434300, 50)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (7, N'Ruy Diaz Salim', 811422132, 34)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (8, N'Alejandro Moreno Angulo', 811445555, 33)
INSERT [dbo].[Adultos] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (9, N'Yolanda Suarez Alanis', 810013322, 45)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333000, N'Bodega 10 andenes, 15x 20 mts cuadrados', 100)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333002, N'Bodega con 5 modulos 15 x 20 mts cuadrados', 600)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333232, N'Bodega de dos pisos, 20 x 20 mts cuadrados', 1000)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333270, N'Bodega dos pisos, 2 racks, 10 x 10 mts cuadrados', 900)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333289, N'Bodega 2 racks,10 x 12 mts cuadrados', 150)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333292, N'Bodega 1 piso, 40 x 40 mts cuadrados', 1000)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (333767, N'Bodega 1 rack, 10 x 10 mts cuadrados', 100)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (335456, N'Bodega con 5 modulos, 10 x 10 mts cuadrados', 100)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (345354, N'Bodega de dos pisos, 20 x 16 mts cuadrados', 800)
INSERT [dbo].[Bodega] ([Id_Bodega], [Descripcion], [Capacidad]) VALUES (354433, N'Bodega 3 racsk, 10 x 20 mts cuadrados', 600)
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (1, N'Julio Medrano Muñoz', 811464923, N'julio@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (2, N'Yair Gomez Torres', 811454669, N'yair_gomez@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (3, N'Osmar Gonzalez Ruiz', 811481469, N'OsGonRuiz@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (4, N'Eduardo Barbosa Rios', 811485666, N'EduPats@uanl.edu.mx')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (5, N'Alexis Saenz Flores', 811440099, N'alexissaenzflores@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (6, N'Ricardo Treviño Martinez', 816575767, N'ricky098@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (7, N'Lizbeth Ortiz Muñoz', 811478887, N'muñoz000@uanl.edu.mx')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (8, N'Andrea Garcia Perez', 811481088, N'andreaperez#3@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Telefono], [Correo]) VALUES (9, N'Roberto Martinez Gomez', 811431123, N'robert098@uanl.edu.mx')
INSERT [dbo].[Edades23] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (1, N'Hugo Rodriguez Mendez', 811412223, 23)
INSERT [dbo].[Edades23] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (6, N'Feliciano Trevino Sanchez', 809342345, 23)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (100, N'Carretilla vecker', 1, 249.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (102, N'Pala Vecker', 2, 44.55)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (110, N'Martillos cabeza plana', 5, 39.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (111, N'Tornilolos hierro 5cm', 30, 4.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (112, N'Pinzas de corte', 1, 64.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (1012, N'Cables de hierro (10 mts)', 10, 39.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (1100, N'Escalera', 2, 149.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (1110, N'Cerrucho 50 cm', 10, 79.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (1111, N'Cemento cruz azul', 2, 119.99)
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Cantidad], [PrecioU]) VALUES (1112, N'Pinzas ponchadoras', 2, 49.99)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (1, N'Vecker', 811465200)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (2, N'Lemus', 811420354)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (3, N'Home Depot', 810543555)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (4, N'Dexter', 811420087)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (5, N'Handy Home', 806445646)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (6, N'Encino', 811465515)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (7, N'Vecker', 811465262)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (8, N'MtyFerreteria', 810121112)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Telefono]) VALUES (9, N'Ferrymat', 811446365)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (1, N'Hugo Rodriguez Mendez', 811412223, 23)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (2, N'Jose Luis Esquivel', 811413324, 32)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (3, N'Juan Lara Mendez', 832344333, 33)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (4, N'Daniel Ballasteres Martinez', 814121223, 37)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (5, N'Antonio Santander Gomez ', 811434300, 50)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (6, N'Feliciano Trevino Sanchez', 809342345, 23)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (7, N'Ruy Diaz Salim', 811422132, 34)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (8, N'Alejandro Moreno Angulo', 811445555, 33)
INSERT [dbo].[Vendedor] ([Id_Vendedor], [Nombre], [Telefono], [Edad]) VALUES (9, N'Yolanda Suarez Alanis', 810013322, 45)
/****** Object:  StoredProcedure [dbo].[BodegaConCapacidad]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BodegaConCapacidad]
	@Bodega varchar(30)=null
as 
	if @Bodega is null
	begin 
		select 'Indicar Bodega' return
	end;
	select * from  Bodega where Capacidad = @Bodega

GO
/****** Object:  StoredProcedure [dbo].[Compras]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Compras]
	@Nombre varchar(256),
	@Telefono int
as
	select * from Cliente where Nombre = @Nombre and Telefono = @Telefono

GO
/****** Object:  StoredProcedure [dbo].[Facturacion]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Facturacion]
	@Proveedor varchar(256)
as
	select * from Proveedor where Nombre = @Proveedor

GO
/****** Object:  StoredProcedure [dbo].[MostrarCompra]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostrarCompra]
as
select Cliente.Nombre , Producto.Cantidad from Cliente
join Producto on Producto.Id_Producto = Cliente.Id_Cliente

GO
/****** Object:  StoredProcedure [dbo].[Sueldo]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sueldo]
AS
if object_id('Vendedores.Adultos') is null
		alter table Vendedor
		add Sueldo float
		

GO
/****** Object:  Trigger [dbo].[BorrarBodega]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BorrarBodega]
on [dbo].[Bodega]
INSTEAD OF DELETE
AS
DELETE  FROM Bodega WHERE Id_Bodega=10

GO
/****** Object:  Trigger [dbo].[Nombre]    Script Date: 01/06/2020 20:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Nombre]
 on [dbo].[Cliente]
 instead of insert
 as
	select * from inserted

GO
USE [master]
GO
ALTER DATABASE [Ferreteria] SET  READ_WRITE 
GO
