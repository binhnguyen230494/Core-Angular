USE [QLGiangVien]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [int] IDENTITY(1,1) NOT NULL,
	[KhoaId] [int] NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DaXoa] [bit] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKhoa] [nvarchar](50) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GiangVien] ON 

INSERT [dbo].[GiangVien] ([MaGV], [KhoaId], [Ho], [Ten], [DiaChi], [DienThoai], [Email], [DaXoa], [NgayTao], [NgaySua]) VALUES (1, 1, N'Nguyen', N'Binh', N'Hue', N'123589', N'binh.h@gmail.com', 0, CAST(N'2020-10-31T13:52:57.523' AS DateTime), CAST(N'2020-10-31T13:52:57.523' AS DateTime))
INSERT [dbo].[GiangVien] ([MaGV], [KhoaId], [Ho], [Ten], [DiaChi], [DienThoai], [Email], [DaXoa], [NgayTao], [NgaySua]) VALUES (4, 4, N'Xuân', N'Phú', N'Brycen', N'5856', N'phu.cat@mail.com', 0, CAST(N'2020-11-03T00:00:00.000' AS DateTime), CAST(N'2020-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GiangVien] ([MaGV], [KhoaId], [Ho], [Ten], [DiaChi], [DienThoai], [Email], [DaXoa], [NgayTao], [NgaySua]) VALUES (6, 1, N'Ngu', N'Binh', N'Hue', N'123589', N'binh.h@gmail.com', 0, CAST(N'2020-11-03T21:29:51.743' AS DateTime), CAST(N'2020-11-03T21:29:51.743' AS DateTime))
SET IDENTITY_INSERT [dbo].[GiangVien] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (1, N'K1', N'Toa', 0)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (2, N'K2', N'Tin', 1)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (3, N'K3', N'Anh', 1)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (4, N'K1', N'Su', 0)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (5, N'k4', N'ngu van', 1)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (6, N'K2', N'hoi hoa', 0)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (7, N'K2', N'hoi hoa', 0)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (8, N'K2', N'hoi hoa', 0)
INSERT [dbo].[Khoa] ([ID], [MaKhoa], [TenKhoa], [DaXoa]) VALUES (9, N'k3', N'li', 0)
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVien_Khoa] FOREIGN KEY([KhoaId])
REFERENCES [dbo].[Khoa] ([ID])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK_GiangVien_Khoa]
GO
/****** Object:  StoredProcedure [dbo].[DanhSachGVTheoKhoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Danh Sach GV theo Khoa
-- =============================================
CREATE PROCEDURE [dbo].[DanhSachGVTheoKhoa]
          @KhoaId INT
AS
BEGIN
SELECT [MaGV]
      ,[KhoaId]
      ,[Ho]
      ,[Ten]
      ,[DiaChi]
      ,[DienThoai]
      ,[Email]
      ,[NgayTao]
      ,[NgaySua]
  FROM [dbo].[GiangVien]
  WHERE KhoaId = @KhoaId AND DaXoa = 0
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachKhoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Danh Sach Khoa
-- =============================================
CREATE PROCEDURE [dbo].[DanhSachKhoa]
AS
BEGIN

SELECT [ID]
      ,[MaKhoa]
      ,[TenKhoa]
	  ,(SELECT COUNT(*) FROM GiangVien WHERE KhoaId = ID) AS TongSoGiangVien
  FROM [dbo].[Khoa]
  WHERE DaXoa = 0

 END
GO
/****** Object:  StoredProcedure [dbo].[LayGVTheoMa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	lay GV theo MaGV
-- =============================================
CREATE PROCEDURE [dbo].[LayGVTheoMa]
        @MaGV INT
AS
BEGIN
SELECT [MaGV]
      ,[KhoaId]
      ,[Ho]
      ,[Ten]
      ,[DiaChi]
      ,[DienThoai]
      ,[Email]
      ,[NgayTao]
      ,[NgaySua]
  FROM [dbo].[GiangVien]
  WHERE MaGV = @MaGV AND DaXoa = 0
END
GO
/****** Object:  StoredProcedure [dbo].[LayKhoaID]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Danh Sach Khoa theo ID
-- =============================================
CREATE PROCEDURE [dbo].[LayKhoaID]
      @Id INT
AS
BEGIN
IF(NOT EXISTS(SELECT * FROM [dbo].Khoa WHERE DaXoa = 0 AND Id =@Id))
BEGIN
    RAISERROR('Invalid Khoa' , 1 , 100)
	RETURN
END

SELECT [ID]
      ,[MaKhoa]
      ,[TenKhoa]
  FROM [dbo].[Khoa]
  WHERE Id = @Id

 END
GO
/****** Object:  StoredProcedure [dbo].[SuaGiangVien]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Sua Giang Vien
-- =============================================
CREATE PROCEDURE [dbo].[SuaGiangVien]
   @MaGV INT,
	@KhoaId INT,
	@Ho NVARCHAR(50),
	@Ten NVARCHAR(50),
	@DiaChi NVARCHAR(50),
	@DienThoai NVARCHAR(50),
	@Email NVARCHAR(50)

AS
BEGIN

UPDATE [dbo].[GiangVien]
   SET [KhoaId] = @KhoaId
      ,[Ho] = @Ho
      ,[Ten] = @Ten
      ,[DiaChi] = @DiaChi
      ,[DienThoai] = @DienThoai
      ,[Email] = @Email
      ,[NgaySua] = GETDATE()
WHERE MaGV = @MaGV

SELECT @MaGV AS MaGV
END
GO
/****** Object:  StoredProcedure [dbo].[SuaKhoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Sua Khoa
-- =============================================
CREATE PROCEDURE [dbo].[SuaKhoa]
    @Id INT,
    @MaKhoa NVARCHAR(50),
	@TenKhoa NVARCHAR(50)
	
AS
BEGIN

UPDATE [dbo].[Khoa]
   SET [MaKhoa] = @MaKhoa
      ,[TenKhoa] = @TenKhoa
 WHERE Id =@Id

 SELECT @Id AS Id
 END
GO
/****** Object:  StoredProcedure [dbo].[TaoGiangVien]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Tao Giang Vien
-- =============================================
CREATE PROCEDURE [dbo].[TaoGiangVien]
 	@KhoaId INT,
	@Ho NVARCHAR(50),
	@Ten NVARCHAR(50),
	@DiaChi NVARCHAR(50),
	@DienThoai NVARCHAR(50),
	@Email NVARCHAR(50)

AS
BEGIN

INSERT INTO [dbo].[GiangVien]
           ([KhoaId]
           ,[Ho]
           ,[Ten]
           ,[DiaChi]
           ,[DienThoai]
           ,[Email]
           ,[DaXoa]
           ,[NgayTao]
           ,[NgaySua])
     VALUES
           (@KhoaId
           ,@Ho
           ,@Ten
           ,@DiaChi
           ,@DienThoai
           ,@Email
           ,0
           ,GETDATE()
           ,GETDATE())
DECLARE @MaGV INT
SET @MaGV = SCOPE_IDENTITY()
SELECT @MaGV AS MaGV
END
GO
/****** Object:  StoredProcedure [dbo].[TaoKhoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Tao Khoa
-- =============================================
CREATE PROCEDURE [dbo].[TaoKhoa]
    @MaKhoa NVARCHAR(50),
	@TenKhoa NVARCHAR(50)
	
AS
BEGIN

INSERT INTO [dbo].[Khoa]
           ([MaKhoa]
           ,[TenKhoa]
           ,[DaXoa])
VALUES
           (@MaKhoa
           ,@TenKhoa
           ,0)

DECLARE @Id INT
SET @Id = SCOPE_IDENTITY()
SELECT @Id AS Id
END
GO
/****** Object:  StoredProcedure [dbo].[XoaGiangVien]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Xoa Giang Vien
-- =============================================
--lay gia tri int
/*ALTER PROCEDURE [dbo].[XoaPhongBan]
	@Id INT
	
AS
BEGIN

UPDATE [dbo].[PhongBan]
   SET [DaXoa] = 1
   WHERE Id = @Id
SELECT @Id AS Id
END*/
CREATE PROCEDURE [dbo].[XoaGiangVien]
 	@MaGV INT
	
AS
BEGIN
DECLARE @Result BIT =0
BEGIN TRY
UPDATE [dbo].[GiangVien]
   SET [DaXoa] = 1
   WHERE MaGV = @MaGV
   SET @Result = 1
   END TRY
BEGIN CATCH
END CATCH
SELECT @Result AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[XoaKhoa]    Script Date: 11/4/2020 1:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Binh
-- Create date: 2020/10/10
-- Description:	Xoa Khoa
-- =============================================
CREATE PROCEDURE [dbo].[XoaKhoa]
    @Id INT
    
	
AS
BEGIN
DECLARE @Result BIT =0
BEGIN TRY
UPDATE [dbo].[Khoa]
   SET [DaXoa] = 1
 WHERE Id =@Id

   END TRY
BEGIN CATCH
END CATCH
SELECT @Result AS Result
END
GO
