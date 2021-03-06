USE [master]
GO
/****** Object:  Database [cadeteenlinea]    Script Date: 12/14/2015 10:15:49 ******/
CREATE DATABASE [cadeteenlinea] ON  PRIMARY 
( NAME = N'cadeteenlinea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cadeteenlinea.mdf' , SIZE = 60416KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cadeteenlinea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cadeteenlinea_log.ldf' , SIZE = 164672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cadeteenlinea] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cadeteenlinea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cadeteenlinea] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cadeteenlinea] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cadeteenlinea] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cadeteenlinea] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cadeteenlinea] SET ARITHABORT OFF
GO
ALTER DATABASE [cadeteenlinea] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cadeteenlinea] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cadeteenlinea] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cadeteenlinea] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cadeteenlinea] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cadeteenlinea] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cadeteenlinea] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cadeteenlinea] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cadeteenlinea] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cadeteenlinea] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cadeteenlinea] SET  DISABLE_BROKER
GO
ALTER DATABASE [cadeteenlinea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cadeteenlinea] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cadeteenlinea] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cadeteenlinea] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cadeteenlinea] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cadeteenlinea] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cadeteenlinea] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [cadeteenlinea] SET  READ_WRITE
GO
ALTER DATABASE [cadeteenlinea] SET RECOVERY FULL
GO
ALTER DATABASE [cadeteenlinea] SET  MULTI_USER
GO
ALTER DATABASE [cadeteenlinea] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cadeteenlinea] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'cadeteenlinea', N'ON'
GO
USE [cadeteenlinea]
GO
/****** Object:  Table [dbo].[notas_fin]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_fin](
	[rut] [numeric](10, 0) NULL,
	[codigo] [nvarchar](6) NULL,
	[ano] [numeric](4, 0) NULL,
	[nota_presentacion] [numeric](6, 3) NULL,
	[nota_examen] [numeric](6, 3) NULL,
	[nota_examen_repeticion] [numeric](6, 3) NULL,
	[nota_final] [numeric](6, 3) NULL,
	[estado] [nvarchar](1) NULL,
	[nota_final_repeticion] [numeric](6, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resumen]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resumen](
	[rut] [numeric](10, 0) NULL,
	[nCadete] [numeric](3, 0) NULL,
	[curso] [numeric](1, 0) NULL,
	[ano] [numeric](4, 0) NULL,
	[especialidad] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proceso]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proceso](
	[idproceso] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripción] [text] NOT NULL,
	[nombre_package_etl] [varchar](150) NOT NULL,
 CONSTRAINT [PK_tabla] PRIMARY KEY CLUSTERED 
(
	[idproceso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notas_parciales_paso]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_parciales_paso](
	[rut] [numeric](10, 0) NULL,
	[codigo] [nvarchar](6) NULL,
	[ano] [numeric](4, 0) NULL,
	[mes] [numeric](2, 0) NULL,
	[dia] [numeric](2, 0) NULL,
	[nNota] [numeric](2, 0) NULL,
	[tipo] [nvarchar](1) NULL,
	[nota] [numeric](3, 1) NULL,
	[semestre] [numeric](1, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[rut] [numeric](10, 0) NOT NULL,
	[apellidoPat] [nvarchar](25) NULL,
	[apellidoMat] [nvarchar](25) NULL,
	[nombre] [nvarchar](50) NULL,
	[password_2] [varchar](250) NULL,
	[perfil] [varchar](15) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estadoTarea]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estadoTarea](
	[idestado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estadoTarea] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[asignatura]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignatura](
	[idasignatura] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](6) NULL,
	[ano] [numeric](4, 0) NULL,
	[semestre] [numeric](1, 0) NULL,
	[curso] [numeric](1, 0) NULL,
	[nombre] [nvarchar](25) NULL,
	[especialidad] [nvarchar](1) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_asignatura] PRIMARY KEY CLUSTERED 
(
	[idasignatura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cadete]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cadete](
	[rut] [numeric](10, 0) NOT NULL,
	[nCadete] [numeric](10, 0) NULL,
	[division] [nvarchar](2) NULL,
	[anoIngreso] [numeric](10, 0) NULL,
	[anoNacimiento] [numeric](10, 0) NULL,
	[mesNacimiento] [numeric](10, 0) NULL,
	[diaNacimiento] [numeric](10, 0) NULL,
	[lugarNacimiento] [nvarchar](100) NULL,
	[seleccion] [nvarchar](25) NULL,
	[especialidad] [nvarchar](1) NULL,
	[nivel] [nvarchar](25) NULL,
	[curso] [nvarchar](2) NULL,
	[circulo] [nvarchar](50) NULL,
	[nacionalidad] [nvarchar](20) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_cadete] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apoderado]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apoderado](
	[rut] [numeric](10, 0) NOT NULL,
	[direccion] [nvarchar](100) NULL,
	[comuna] [nvarchar](25) NULL,
	[ciudad] [nvarchar](25) NULL,
	[fono] [nvarchar](15) NULL,
	[fonoComercial] [nvarchar](15) NULL,
	[difunto] [nvarchar](2) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_apoderado] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarea]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarea](
	[idtarea] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[estado] [int] NOT NULL,
	[proceso_idproceso] [int] NOT NULL,
 CONSTRAINT [PK_tarea] PRIMARY KEY CLUSTERED 
(
	[idtarea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaccion](
	[idtransaccion] [int] NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[tipoTransaccion] [nvarchar](5) NULL,
	[monto] [int] NULL,
	[fechaMovimiento] [datetime] NULL,
	[descripcion] [varchar](50) NULL,
	[tipoCuenta] [varchar](25) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[idtransaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notas_parciales]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_parciales](
	[idnotas_parciales] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[nota] [numeric](3, 1) NULL,
	[dia] [numeric](2, 0) NULL,
	[mes] [numeric](2, 0) NULL,
	[ano] [numeric](4, 0) NULL,
	[semestre] [numeric](1, 0) NULL,
	[asignatura_idasignatura] [int] NULL,
	[tipo] [nvarchar](1) NULL,
	[nNota] [numeric](2, 0) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_notas_parciales] PRIMARY KEY CLUSTERED 
(
	[idnotas_parciales] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas_fisico]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_fisico](
	[idnotas_fisico] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[ano] [numeric](4, 0) NULL,
	[semestre] [numeric](1, 0) NULL,
	[marca_100_mt] [numeric](6, 3) NULL,
	[marca_1000_mt] [numeric](6, 3) NULL,
	[marca_salto_largo] [numeric](6, 3) NULL,
	[marca_bala] [numeric](6, 3) NULL,
	[marca_100_libre] [numeric](6, 3) NULL,
	[marca_bajo_agua] [numeric](6, 3) NULL,
	[marca_trepa] [numeric](6, 3) NULL,
	[marca_abdominales] [numeric](3, 0) NULL,
	[marca_extension_brazos] [numeric](6, 3) NULL,
	[nota_100_mt] [numeric](6, 3) NULL,
	[nota_1000_mt] [numeric](6, 3) NULL,
	[nota_salto_largo] [numeric](6, 3) NULL,
	[nota_bala] [numeric](6, 3) NULL,
	[nota_100_libre] [numeric](6, 3) NULL,
	[nota_bajo_agua] [numeric](6, 3) NULL,
	[nota_trepa] [numeric](6, 3) NULL,
	[nota_abdominales] [numeric](6, 3) NULL,
	[nota_extension_brazos] [numeric](6, 3) NULL,
	[nota_final] [numeric](6, 3) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_notas_fisico] PRIMARY KEY CLUSTERED 
(
	[idnotas_fisico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas_finales]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_finales](
	[idnotas_finales] [int] IDENTITY(1,1) NOT NULL,
	[nota_presentacion] [numeric](6, 2) NULL,
	[nota_examen] [numeric](6, 2) NULL,
	[nota_final] [numeric](6, 2) NULL,
	[nota_examen_repeticion] [numeric](6, 2) NULL,
	[nota_final_repeticion] [numeric](6, 2) NULL,
	[estado] [nvarchar](1) NULL,
	[asignatura_idasignatura] [int] NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[estado_tf] [int] NULL,
 CONSTRAINT [PK_notas_finales] PRIMARY KEY CLUSTERED 
(
	[idnotas_finales] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivelacion]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivelacion](
	[idnivelacion] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[ano] [numeric](4, 0) NULL,
	[semestre] [numeric](1, 0) NULL,
	[etapa] [numeric](1, 0) NULL,
	[marca_100_mt] [numeric](6, 3) NULL,
	[marca_1000_mt] [numeric](6, 3) NULL,
	[marca_salto_largo] [numeric](6, 3) NULL,
	[marca_bala] [numeric](6, 3) NULL,
	[marca_100_libre] [numeric](6, 3) NULL,
	[marca_bajo_agua] [numeric](6, 3) NULL,
	[marca_trepa] [numeric](6, 3) NULL,
	[marca_abdominales] [numeric](3, 0) NULL,
	[marca_extension_brazos] [numeric](6, 3) NULL,
	[marca_cooper] [numeric](4, 0) NULL,
	[nota_100_mt] [numeric](6, 3) NULL,
	[nota_1000_mt] [numeric](6, 3) NULL,
	[nota_salto_largo] [numeric](6, 3) NULL,
	[nota_bala] [numeric](6, 3) NULL,
	[nota_100_libre] [numeric](6, 3) NULL,
	[nota_bajo_agua] [numeric](6, 3) NULL,
	[nota_trepa] [numeric](6, 3) NULL,
	[nota_abdominales] [numeric](6, 3) NULL,
	[nota_extension_brazos] [numeric](6, 3) NULL,
	[nota_final] [numeric](6, 3) NULL,
	[observacion] [nvarchar](30) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_nivelacion] PRIMARY KEY CLUSTERED 
(
	[idnivelacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingles_tae]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingles_tae](
	[idingles_tae] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[mes] [numeric](11, 0) NULL,
	[ano] [numeric](11, 0) NULL,
	[speaking] [numeric](11, 0) NULL,
	[understanding] [numeric](11, 0) NULL,
	[writing] [numeric](11, 0) NULL,
	[average] [numeric](11, 0) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_ingles_tae] PRIMARY KEY CLUSTERED 
(
	[idingles_tae] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[francos]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[francos](
	[idfrancos] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[fecha_salida] [varchar](50) NULL,
	[hora_salida] [varchar](50) NULL,
	[hora_recogida] [varchar](50) NULL,
	[fecha_recogida] [varchar](50) NULL,
	[asignatura_bajo] [nvarchar](258) NULL,
	[observaciones] [nvarchar](154) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_francos] PRIMARY KEY CLUSTERED 
(
	[idfrancos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[errores]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[errores](
	[iderror] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[idRegistro] [int] NULL,
	[tabla] [varchar](20) NULL,
	[error] [text] NOT NULL,
	[tarea_idTarea] [int] NULL,
 CONSTRAINT [PK_error] PRIMARY KEY CLUSTERED 
(
	[iderror] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calificaciones]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificaciones](
	[idcalificaciones] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NULL,
	[ano] [numeric](4, 0) NULL,
	[semestre] [numeric](1, 0) NULL,
	[mando] [numeric](4, 2) NULL,
	[interes_profesional] [numeric](4, 2) NULL,
	[personalidad_madurez] [numeric](4, 2) NULL,
	[responsabilidad] [numeric](4, 2) NULL,
	[espiritu_militar] [numeric](4, 2) NULL,
	[cooperacion] [numeric](4, 2) NULL,
	[conducta] [numeric](4, 2) NULL,
	[aptitud_fisica] [numeric](4, 2) NULL,
	[tenida_orden_aseo] [numeric](4, 2) NULL,
	[final] [numeric](4, 2) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_calificaciones] PRIMARY KEY CLUSTERED 
(
	[idcalificaciones] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cadete_apoderado]    Script Date: 12/14/2015 10:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cadete_apoderado](
	[idcadete_apoderado] [int] IDENTITY(1,1) NOT NULL,
	[cadete_rut] [numeric](10, 0) NOT NULL,
	[apoderado_rut] [numeric](10, 0) NOT NULL,
	[tipoApoderado] [nvarchar](20) NOT NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_cadete_apoderado] PRIMARY KEY CLUSTERED 
(
	[idcadete_apoderado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_cadete_usuario]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[cadete]  WITH CHECK ADD  CONSTRAINT [FK_cadete_usuario] FOREIGN KEY([rut])
REFERENCES [dbo].[usuario] ([rut])
GO
ALTER TABLE [dbo].[cadete] CHECK CONSTRAINT [FK_cadete_usuario]
GO
/****** Object:  ForeignKey [FK_apoderado_usuario]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[apoderado]  WITH CHECK ADD  CONSTRAINT [FK_apoderado_usuario] FOREIGN KEY([rut])
REFERENCES [dbo].[usuario] ([rut])
GO
ALTER TABLE [dbo].[apoderado] CHECK CONSTRAINT [FK_apoderado_usuario]
GO
/****** Object:  ForeignKey [FK_tarea_estadoTarea]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[tarea]  WITH CHECK ADD  CONSTRAINT [FK_tarea_estadoTarea] FOREIGN KEY([estado])
REFERENCES [dbo].[estadoTarea] ([idestado])
GO
ALTER TABLE [dbo].[tarea] CHECK CONSTRAINT [FK_tarea_estadoTarea]
GO
/****** Object:  ForeignKey [FK_tarea_proceso1]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[tarea]  WITH CHECK ADD  CONSTRAINT [FK_tarea_proceso1] FOREIGN KEY([proceso_idproceso])
REFERENCES [dbo].[proceso] ([idproceso])
GO
ALTER TABLE [dbo].[tarea] CHECK CONSTRAINT [FK_tarea_proceso1]
GO
/****** Object:  ForeignKey [FK_transaccion_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [FK_transaccion_cadete]
GO
/****** Object:  ForeignKey [FK_notas_parciales_asignatura]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[notas_parciales]  WITH CHECK ADD  CONSTRAINT [FK_notas_parciales_asignatura] FOREIGN KEY([asignatura_idasignatura])
REFERENCES [dbo].[asignatura] ([idasignatura])
GO
ALTER TABLE [dbo].[notas_parciales] CHECK CONSTRAINT [FK_notas_parciales_asignatura]
GO
/****** Object:  ForeignKey [FK_notas_parciales_cadete1]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[notas_parciales]  WITH CHECK ADD  CONSTRAINT [FK_notas_parciales_cadete1] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[notas_parciales] CHECK CONSTRAINT [FK_notas_parciales_cadete1]
GO
/****** Object:  ForeignKey [FK_notas_fisico_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[notas_fisico]  WITH CHECK ADD  CONSTRAINT [FK_notas_fisico_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[notas_fisico] CHECK CONSTRAINT [FK_notas_fisico_cadete]
GO
/****** Object:  ForeignKey [FK_notas_finales_asignatura]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[notas_finales]  WITH CHECK ADD  CONSTRAINT [FK_notas_finales_asignatura] FOREIGN KEY([asignatura_idasignatura])
REFERENCES [dbo].[asignatura] ([idasignatura])
GO
ALTER TABLE [dbo].[notas_finales] CHECK CONSTRAINT [FK_notas_finales_asignatura]
GO
/****** Object:  ForeignKey [FK_notas_finales_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[notas_finales]  WITH CHECK ADD  CONSTRAINT [FK_notas_finales_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[notas_finales] CHECK CONSTRAINT [FK_notas_finales_cadete]
GO
/****** Object:  ForeignKey [FK_nivelacion_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[nivelacion]  WITH CHECK ADD  CONSTRAINT [FK_nivelacion_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[nivelacion] CHECK CONSTRAINT [FK_nivelacion_cadete]
GO
/****** Object:  ForeignKey [FK_ingles_tae_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[ingles_tae]  WITH CHECK ADD  CONSTRAINT [FK_ingles_tae_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[ingles_tae] CHECK CONSTRAINT [FK_ingles_tae_cadete]
GO
/****** Object:  ForeignKey [FK_francos_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[francos]  WITH CHECK ADD  CONSTRAINT [FK_francos_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[francos] CHECK CONSTRAINT [FK_francos_cadete]
GO
/****** Object:  ForeignKey [FK_error_tarea]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[errores]  WITH CHECK ADD  CONSTRAINT [FK_error_tarea] FOREIGN KEY([tarea_idTarea])
REFERENCES [dbo].[tarea] ([idtarea])
GO
ALTER TABLE [dbo].[errores] CHECK CONSTRAINT [FK_error_tarea]
GO
/****** Object:  ForeignKey [FK_calificaciones_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_calificaciones_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[calificaciones] CHECK CONSTRAINT [FK_calificaciones_cadete]
GO
/****** Object:  ForeignKey [FK_cadete_apoderado_apoderado]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[cadete_apoderado]  WITH CHECK ADD  CONSTRAINT [FK_cadete_apoderado_apoderado] FOREIGN KEY([apoderado_rut])
REFERENCES [dbo].[apoderado] ([rut])
GO
ALTER TABLE [dbo].[cadete_apoderado] CHECK CONSTRAINT [FK_cadete_apoderado_apoderado]
GO
/****** Object:  ForeignKey [FK_cadete_apoderado_cadete]    Script Date: 12/14/2015 10:15:50 ******/
ALTER TABLE [dbo].[cadete_apoderado]  WITH CHECK ADD  CONSTRAINT [FK_cadete_apoderado_cadete] FOREIGN KEY([cadete_rut])
REFERENCES [dbo].[cadete] ([rut])
GO
ALTER TABLE [dbo].[cadete_apoderado] CHECK CONSTRAINT [FK_cadete_apoderado_cadete]
GO
