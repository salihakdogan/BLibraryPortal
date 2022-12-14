USE [BLibraryPortal]
GO
/****** Object:  Table [dbo].[TblIslemler]    Script Date: 9/27/2022 12:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblIslemler](
	[i_tc] [nvarchar](11) NOT NULL,
	[i_no] [int] IDENTITY(1,1) NOT NULL,
	[i_ogr_no] [nvarchar](4) NOT NULL,
	[i_isbn] [nvarchar](50) NOT NULL,
	[i_atarih] [date] NOT NULL,
	[i_vtarih] [date] NOT NULL,
	[i_kno] [int] NOT NULL,
 CONSTRAINT [PK__TblIslem__98F9F121524FBBCD] PRIMARY KEY CLUSTERED 
(
	[i_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblKitap]    Script Date: 9/27/2022 12:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKitap](
	[k_no] [int] IDENTITY(1,1) NOT NULL,
	[k_isbn] [nvarchar](50) NOT NULL,
	[k_adi] [nvarchar](100) NOT NULL,
	[k_yazar_no] [int] NOT NULL,
	[k_tur_no] [int] NOT NULL,
	[k_sayfa] [int] NOT NULL,
	[k_puan] [int] NOT NULL,
	[k_resim] [nvarchar](100) NOT NULL,
	[k_durum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[k_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOkuyucu]    Script Date: 9/27/2022 12:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOkuyucu](
	[o_tc] [nvarchar](11) NOT NULL,
	[o_unvan] [nvarchar](30) NOT NULL,
	[o_no] [nvarchar](4) NULL,
	[o_sinif] [nvarchar](20) NULL,
	[o_ad] [nvarchar](30) NOT NULL,
	[o_soyad] [nvarchar](30) NOT NULL,
	[o_cinsiyet] [nvarchar](20) NOT NULL,
	[o_telno] [nvarchar](13) NOT NULL,
	[o_dtarih] [date] NOT NULL,
	[o_puan] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[o_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTur]    Script Date: 9/27/2022 12:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTur](
	[t_no] [int] IDENTITY(1,1) NOT NULL,
	[t_ad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[t_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblYazar]    Script Date: 9/27/2022 12:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblYazar](
	[y_no] [int] IDENTITY(1,1) NOT NULL,
	[y_ad] [nvarchar](50) NOT NULL,
	[y_soyad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[y_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblKitap] ON 

INSERT [dbo].[TblKitap] ([k_no], [k_isbn], [k_adi], [k_yazar_no], [k_tur_no], [k_sayfa], [k_puan], [k_resim], [k_durum]) VALUES (19, N'0101', N'Fareler ve İnsanlar', 17, 13, 126, 5, N'kitapresim/09272022_121443_farelerveinsanlar.jpg', 0)
INSERT [dbo].[TblKitap] ([k_no], [k_isbn], [k_adi], [k_yazar_no], [k_tur_no], [k_sayfa], [k_puan], [k_resim], [k_durum]) VALUES (20, N'0102', N'İnci', 17, 14, 102, 5, N'kitapresim/09272022_121627_inci.jpg', 0)
INSERT [dbo].[TblKitap] ([k_no], [k_isbn], [k_adi], [k_yazar_no], [k_tur_no], [k_sayfa], [k_puan], [k_resim], [k_durum]) VALUES (21, N'0103', N'Sokrates''in Savunması', 19, 15, 200, 5, N'kitapresim/09272022_121820_sokratesin-savunmasi-144924-11603193-14-O.jpg', 0)
INSERT [dbo].[TblKitap] ([k_no], [k_isbn], [k_adi], [k_yazar_no], [k_tur_no], [k_sayfa], [k_puan], [k_resim], [k_durum]) VALUES (22, N'0104', N'Suç ve Ceza', 20, 16, 687, 10, N'kitapresim/09272022_122026_sucveceza.png', 0)
INSERT [dbo].[TblKitap] ([k_no], [k_isbn], [k_adi], [k_yazar_no], [k_tur_no], [k_sayfa], [k_puan], [k_resim], [k_durum]) VALUES (24, N'0105', N'Şeker Portakalı', 22, 14, 200, 5, N'kitapresim/09272022_122418_sekerportakali.jpg', 0)
SET IDENTITY_INSERT [dbo].[TblKitap] OFF
GO
SET IDENTITY_INSERT [dbo].[TblTur] ON 

INSERT [dbo].[TblTur] ([t_no], [t_ad]) VALUES (13, N'Amerikan Edebiyatı')
INSERT [dbo].[TblTur] ([t_no], [t_ad]) VALUES (14, N'Roman')
INSERT [dbo].[TblTur] ([t_no], [t_ad]) VALUES (15, N'Felsefe Tarihi')
INSERT [dbo].[TblTur] ([t_no], [t_ad]) VALUES (16, N'Rus Edebiyatı')
SET IDENTITY_INSERT [dbo].[TblTur] OFF
GO
SET IDENTITY_INSERT [dbo].[TblYazar] ON 

INSERT [dbo].[TblYazar] ([y_no], [y_ad], [y_soyad]) VALUES (17, N'John', N'Steinback')
INSERT [dbo].[TblYazar] ([y_no], [y_ad], [y_soyad]) VALUES (19, N'Platon', N'(Eflatun)')
INSERT [dbo].[TblYazar] ([y_no], [y_ad], [y_soyad]) VALUES (20, N'Fyodor Mihayloviç', N'Dostoyevski')
INSERT [dbo].[TblYazar] ([y_no], [y_ad], [y_soyad]) VALUES (22, N'Jose', N' Mauro de Vasconcelos')
SET IDENTITY_INSERT [dbo].[TblYazar] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TblKitap__7932975B3106E55D]    Script Date: 9/27/2022 12:39:31 PM ******/
ALTER TABLE [dbo].[TblKitap] ADD UNIQUE NONCLUSTERED 
(
	[k_isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblKitap] ADD  CONSTRAINT [DF_TblKitap_k_durum]  DEFAULT ((0)) FOR [k_durum]
GO
ALTER TABLE [dbo].[TblIslemler]  WITH CHECK ADD  CONSTRAINT [FK_TblIslemler_TblKitap] FOREIGN KEY([i_kno])
REFERENCES [dbo].[TblKitap] ([k_no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblIslemler] CHECK CONSTRAINT [FK_TblIslemler_TblKitap]
GO
ALTER TABLE [dbo].[TblIslemler]  WITH CHECK ADD  CONSTRAINT [fk_TblOkuyucu_TblIslemler] FOREIGN KEY([i_tc])
REFERENCES [dbo].[TblOkuyucu] ([o_tc])
GO
ALTER TABLE [dbo].[TblIslemler] CHECK CONSTRAINT [fk_TblOkuyucu_TblIslemler]
GO
ALTER TABLE [dbo].[TblKitap]  WITH CHECK ADD  CONSTRAINT [fk_TblTur_TblKitap] FOREIGN KEY([k_tur_no])
REFERENCES [dbo].[TblTur] ([t_no])
GO
ALTER TABLE [dbo].[TblKitap] CHECK CONSTRAINT [fk_TblTur_TblKitap]
GO
ALTER TABLE [dbo].[TblKitap]  WITH CHECK ADD  CONSTRAINT [fk_TblYazar_TblKitap] FOREIGN KEY([k_yazar_no])
REFERENCES [dbo].[TblYazar] ([y_no])
GO
ALTER TABLE [dbo].[TblKitap] CHECK CONSTRAINT [fk_TblYazar_TblKitap]
GO
