USE [BD_ИСАКОВ]
GO
/****** Object:  Table [dbo].[Маршрут]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Маршрут](
	[id] [int] NOT NULL,
	[Подбор удобного маршрута] [nvarchar](50) NULL,
	[Начальный пункт] [nvarchar](50) NULL,
	[Конечный пункт] [nvarchar](50) NULL,
	[Длительность пути] [time](7) NULL,
 CONSTRAINT [PK_Маршрут] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[id] [int] NOT NULL,
	[ФИО клиента] [nchar](10) NULL,
	[Номер телефона] [ntext] NULL,
	[Адрес доставки] [nchar](10) NULL,
	[Дата оформления] [date] NULL,
	[Дата Получения] [date] NULL,
	[Оплата] [nchar](10) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[id] [int] NOT NULL,
	[Вид услуги] [nvarchar](50) NULL,
	[Стоимость] [money] NULL,
	[Номер заказчика] [int] NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Адрес]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Адрес](
	[id] [int] NOT NULL,
	[Город] [nvarchar](50) NULL,
	[Улица] [nvarchar](50) NULL,
	[Дом/квартира] [int] NULL,
 CONSTRAINT [PK_Адрес] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Администратор]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Администратор](
	[id] [int] NOT NULL,
	[Фамилия курьера] [nchar](10) NULL,
	[Имя курьера] [nchar](10) NULL,
	[Статус заказа] [nvarchar](50) NULL,
	[Передача курьеру информацию о заказе] [nvarchar](50) NULL,
 CONSTRAINT [PK_Администратор] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Курьер]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Курьер](
	[id] [int] NOT NULL,
	[Фамилия курьера] [nchar](10) NULL,
	[Имя курьера] [nchar](10) NULL,
	[Транспорт] [nchar](10) NULL,
	[Маршрут] [nvarchar](50) NULL,
	[Услуга] [nvarchar](50) NULL,
 CONSTRAINT [PK_Курьер] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Транспорт]    Script Date: 03/16/2021 16:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Транспорт](
	[id] [int] NOT NULL,
	[Тип] [nvarchar](50) NULL,
	[Дата отбытия] [datetime] NULL,
	[Дата прибытия] [datetime] NULL,
 CONSTRAINT [PK_Транспорт] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Администратор_Услуги]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Администратор]  WITH CHECK ADD  CONSTRAINT [FK_Администратор_Услуги] FOREIGN KEY([id])
REFERENCES [dbo].[Услуги] ([id])
GO
ALTER TABLE [dbo].[Администратор] CHECK CONSTRAINT [FK_Администратор_Услуги]
GO
/****** Object:  ForeignKey [FK_Адрес_Маршрут]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Адрес]  WITH CHECK ADD  CONSTRAINT [FK_Адрес_Маршрут] FOREIGN KEY([id])
REFERENCES [dbo].[Маршрут] ([id])
GO
ALTER TABLE [dbo].[Адрес] CHECK CONSTRAINT [FK_Адрес_Маршрут]
GO
/****** Object:  ForeignKey [FK_Курьер_Администратор]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Курьер]  WITH CHECK ADD  CONSTRAINT [FK_Курьер_Администратор] FOREIGN KEY([id])
REFERENCES [dbo].[Администратор] ([id])
GO
ALTER TABLE [dbo].[Курьер] CHECK CONSTRAINT [FK_Курьер_Администратор]
GO
/****** Object:  ForeignKey [FK_Транспорт_Курьер]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Транспорт]  WITH CHECK ADD  CONSTRAINT [FK_Транспорт_Курьер] FOREIGN KEY([id])
REFERENCES [dbo].[Курьер] ([id])
GO
ALTER TABLE [dbo].[Транспорт] CHECK CONSTRAINT [FK_Транспорт_Курьер]
GO
/****** Object:  ForeignKey [FK_Транспорт_Маршрут]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Транспорт]  WITH CHECK ADD  CONSTRAINT [FK_Транспорт_Маршрут] FOREIGN KEY([id])
REFERENCES [dbo].[Маршрут] ([id])
GO
ALTER TABLE [dbo].[Транспорт] CHECK CONSTRAINT [FK_Транспорт_Маршрут]
GO
/****** Object:  ForeignKey [FK_Услуги_Клиент]    Script Date: 03/16/2021 16:19:22 ******/
ALTER TABLE [dbo].[Услуги]  WITH CHECK ADD  CONSTRAINT [FK_Услуги_Клиент] FOREIGN KEY([id])
REFERENCES [dbo].[Клиент] ([id])
GO
ALTER TABLE [dbo].[Услуги] CHECK CONSTRAINT [FK_Услуги_Клиент]
GO
