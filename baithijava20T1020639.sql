USE [QlNuoc]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[sodt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nuoc]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nuoc](
	[manuoc] [nvarchar](50) NOT NULL,
	[tennuoc] [nvarchar](50) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[ncc] [nvarchar](50) NULL,
 CONSTRAINT [PK_nuoc] PRIMARY KEY CLUSTERED 
(
	[manuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNuoc] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_dm]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_dm]
AS
SELECT        dbo.ChiTietHoaDon.MaChiTietHD, dbo.KhachHang.hoten, dbo.nuoc.tennuoc, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.SoLuongMua, dbo.nuoc.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.nuoc.gia AS ThanhTien, 
                         dbo.ChiTietHoaDon.damua
FROM            dbo.ChiTietHoaDon INNER JOIN
                         dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                         dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                         dbo.nuoc ON dbo.ChiTietHoaDon.MaNuoc = dbo.nuoc.manuoc
WHERE        (dbo.ChiTietHoaDon.damua = 1)
GO
/****** Object:  View [dbo].[ViewXN]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewXN]
AS
SELECT        dbo.ChiTietHoaDon.MaChiTietHD, dbo.KhachHang.hoten, dbo.nuoc.tennuoc, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.SoLuongMua, dbo.nuoc.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.nuoc.gia AS ThanhTien, 
                         dbo.ChiTietHoaDon.damua
FROM            dbo.ChiTietHoaDon INNER JOIN
                         dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                         dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                         dbo.nuoc ON dbo.ChiTietHoaDon.MaNuoc = dbo.nuoc.manuoc
WHERE        (dbo.ChiTietHoaDon.damua = 0)
GO
/****** Object:  View [dbo].[VTKKK]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VTKKK]
AS
SELECT        dbo.KhachHang.makh, dbo.nuoc.tennuoc, dbo.ChiTietHoaDon.SoLuongMua, dbo.nuoc.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.nuoc.gia AS thanhtien, dbo.ChiTietHoaDon.damua
FROM            dbo.hoadon INNER JOIN
                         dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN
                         dbo.ChiTietHoaDon ON dbo.hoadon.MaHoaDon = dbo.ChiTietHoaDon.MaHoaDon INNER JOIN
                         dbo.nuoc ON dbo.ChiTietHoaDon.MaNuoc = dbo.nuoc.manuoc
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 21/12/2022 7:47:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (1, N'b10', 2, 1, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (2, N'b5', 1, 1, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (3, N'b7 ', 1, 1, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (4, N'b2', 1, 2, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (5, N'b7 ', 1, 2, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (6, N'b9', 2, 4, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (7, N'b9', 2, 4, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (8, N'b2', 1, 5, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (9, N'b7 ', 1, 6, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10, N'b7 ', 1, 7, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (11, N'b1', 1, 8, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (12, N'b8', 1, 9, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (13, N'b7 ', 1, 11, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (14, N'b7 ', 1, 11, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (15, N'b6', 1, 11, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (16, N'b6', 1, 11, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (17, N'b5', 1, 13, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (18, N'b5', 1, 13, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (19, N'b6', 1, 14, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20, N'b2', 23, 15, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (21, N'b10', 5, 16, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (22, N'b7 ', 1, 16, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (23, N'b3', 6, 17, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (24, N'b10', 1, 18, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (25, N'b4', 3, 19, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (26, N'b6', 1, 19, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (27, N'b11', 4, 20, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (28, N'b1', 1, 21, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (29, N'b10', 1, 22, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (30, N'b9', 1, 22, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (31, N'b10', 1, 23, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (32, N'b9', 1, 23, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (33, N'b10', 1, 24, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (34, N'b110', 4, 25, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (35, N'b110', 1, 26, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (36, N'b11', 1, 26, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (37, N'b9', 1, 26, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (38, N'b11', 2, 27, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (39, N'b110', 1, 27, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (40, N'b11', 1, 28, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (41, N'b12', 7, 29, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (42, N'b2', 1, 30, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (43, N'b12', 1, 31, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (44, N'b110', 1, 31, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (45, N'b4', 1, 31, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (46, N'b12', 1, 32, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (47, N'b11', 1, 33, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (48, N'b110', 1, 33, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (49, N'b2', 1, 33, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (50, N'b110', 1, 34, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (51, N'b3', 1, 34, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (52, N'b6', 1, 34, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (53, N'b20', 1, 35, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (54, N'b11', 1, 37, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (55, N'b11', 1, 37, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (56, N'b1', 2, 37, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (57, N'b1', 2, 37, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (58, N'b12', 1, 38, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (59, N'b13', 2, 39, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60, N'b20', 1, 39, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (61, N'b10', 8, 41, 0)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (62, N'b10', 8, 41, 0)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (63, N'b12', 1, 42, 0)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaNuoc], [SoLuongMua], [MaHoaDon], [damua]) VALUES (64, N'b4', 4, 43, 1)
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'abc', N'123', 1)
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin', N'admin', 1)
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin1', N'admin1', 1)
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'lpt', N'123', 1)
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'tnv', N'123', 0)
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'trannhonviet', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 1, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 1, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 2, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 2, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 2, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 2, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 2, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 4, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 4, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (12, 4, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (13, 4, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (14, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (15, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (16, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (17, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (18, 3, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (19, 1, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (20, 1, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (21, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (22, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (23, 2, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (24, 2, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (25, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (26, 3, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (27, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (28, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (29, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (30, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (31, 1, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (32, 1, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (33, 3, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (34, 2, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (35, 1, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (36, 6, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (37, 6, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (38, 6, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (39, 5, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (40, 1, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (41, 1, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (42, 1, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (43, 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (1, N'Trần Nhơn Viết', N'Huế', N'0344599877', N'20T1020639@gmail.com', N'tnv', N'12345')
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (2, N'Lê Phước Thịnh', N'Quảng Nam', NULL, NULL, N'lpt', N'12345')
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (3, N'Trần Anh Tuấn', N'Quảng Trị', NULL, NULL, N'tat', N'12345')
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (4, N'Trương Minh Hùng', N'Huế', NULL, NULL, N'tmh', N'12345')
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (5, N'Trần Anh Tuấn 1', N'', N'', N'', N'tat1', N'tat1')
GO
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (6, N'Trương Minh Hùng', N'xxx', N'', N'', N'tmh1', N'12345')
GO
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bia', N'Bia')
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'nuoc', N'Nước Suối')
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'nuocngot', N'Nước Ngọt')
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'ruou', N'Rượu')
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Sua', N'Sữa')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b1', N'Huda', 94, 15000, N'Bia', N'image_nuoc/biahuda.jpg', CAST(N'2022-07-06T00:00:00.000' AS DateTime), N'Hue')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b10', N'Ruou van', 158, 1111, N'ruou', N'image_nuoc/ruouvan.jpg', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'Italy')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b11', N'Sting red', 200, 10000, N'nuocngot', N'image_nuoc/stingred.jpg', CAST(N'2022-12-16T00:00:00.000' AS DateTime), N'Ha Noi')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b110', N'String yellow', 150, 10000, N'nuocngot', N'image_nuoc/stingyellow.jpg', CAST(N'2022-12-16T00:00:00.000' AS DateTime), N'Bac Ninh')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b12', N'Aquafina', 500, 7000, N'nuoc', N'image_nuoc/aquafina.jpg', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'Quang Ngai')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b13', N'Lavie', 500, 7000, N'nuoc', N'image_nuoc/laviel.jpg', CAST(N'2022-12-19T00:00:00.000' AS DateTime), N'Hue')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b2', N'Sua Ensure Gold', 50, 880000, N'Sua', N'image_nuoc/suaensuregold.jpg', CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Sai Gon')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b20', N'Vinamilk', 5, 11000, N'Sua', N'image_nuoc/halan.jpg', CAST(N'2022-12-16T00:00:00.000' AS DateTime), N'Hue')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b3', N'Heniken', 100, 27000, N'Bia', N'image_nuoc/biaheniken.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Sai Gon')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b4', N'Tiger', 99, 20000, N'Bia', N'image_nuoc/biatiger.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Da Nang')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b5', N'Tiger Bac', 100, 25000, N'Bia', N'image_nuoc/biatigerbac.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Da Nang')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b6', N'Ruou Vodka', 10, 100000, N'ruou', N'image_nuoc/ruouVodka.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Hai Phong')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b7 ', N'Ruou tao meo', 100, 100000, N'ruou', N'image_nuoc/ruoutaomeo.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Son La')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b8', N'Ruou nho', 14, 513200, N'ruou', N'image_nuoc/ruounho.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'England')
GO
INSERT [dbo].[nuoc] ([manuoc], [tennuoc], [soluong], [gia], [maloai], [anh], [NgayNhap], [ncc]) VALUES (N'b9', N'Ruou Soju', 58, 62000, N'ruou', N'image_nuoc/ruousoju.jpg', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Sai Gon')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_nuoc] FOREIGN KEY([MaNuoc])
REFERENCES [dbo].[nuoc] ([manuoc])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_nuoc]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
ALTER TABLE [dbo].[nuoc]  WITH CHECK ADD  CONSTRAINT [FK_nuoc_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
GO
ALTER TABLE [dbo].[nuoc] CHECK CONSTRAINT [FK_nuoc_loai]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nuoc"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_dm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_dm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nuoc"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewXN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewXN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nuoc"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTKKK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VTKKK'
GO
