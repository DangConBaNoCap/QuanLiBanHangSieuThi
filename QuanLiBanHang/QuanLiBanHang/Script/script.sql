USE [master]
GO
/****** Object:  Database [Bai6_BanHangSieuThi]    Script Date: 9/23/2016 10:26:53 AM ******/
CREATE DATABASE [Bai6_BanHangSieuThi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bai6_BanHangSieuThi', FILENAME = N'D:\hoc_tap\nam_4\hk_1\thuc tap nhom\Thuc tap nhom\Clone-Hoang Anh-Thi\save\Bai6_BanHangSieuThi.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bai6_BanHangSieuThi_log', FILENAME = N'D:\hoc_tap\nam_4\hk_1\thuc tap nhom\Thuc tap nhom\Clone-Hoang Anh-Thi\save\Bai6_BanHangSieuThi_log.LDF' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bai6_BanHangSieuThi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET  MULTI_USER 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bai6_BanHangSieuThi]
GO
/****** Object:  StoredProcedure [dbo].[ADDNhanVien]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADDNhanVien] (@TenDn nvarchar(50), @MatKhau varchar(50), @TenNV nvarchar(50), @GT varchar(3), @DiaChi nvarchar(50), @SDT nvarchar(50))
AS
BEGIN
	INSERT INTO NHANVIEN VALUES (@TenDn,@MatKhau,@TenDn,@GT,@DiaChi,@SDT)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCTHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteCTHDB] @MaHDB varchar(10), @MaSP varchar(10)
as
begin
	delete from CHITIETHOADONBAN
	where MaHD = @MaHDB and MaSP = @MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteHDB] @MaHDB varchar(10)
as
begin
	delete HOADONBAN
	where MaHDB = @MaHDB
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[DeleteKH] @MaKH varchar(10)
as
begin
	delete KHACHHANG
	where MaKH = @MaKH
end

GO
/****** Object:  StoredProcedure [dbo].[DeletePHB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[DeletePHB] @MaPhieu varchar(10)
as
begin
	Delete PHIEUBAOHANH
	where SoPhieu = @MaPhieu
end

GO
/****** Object:  StoredProcedure [dbo].[InsertCTHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertCTHDB] @MaHDB varchar(10), @MaSP varchar(10), @SoLuong int, @dongia float, @ThanhTien float
as
begin
	insert into CHITIETHOADONBAN values
	(@MaHDB, @MaSP, @SoLuong, CONVERT(bigint, @dongia), convert(bigint, @ThanhTien))
end

GO
/****** Object:  StoredProcedure [dbo].[InsertHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertHDB] @MaKH varchar(10), @NgayBan datetime, @TongTien bigint
as
begin
	declare @MaHDB varchar(10)
	declare @Sott int
	declare contro CURSOR forward_only for select MaHDB from HOADONBAN
	set @Sott = 0

	open contro
	fetch next from contro into @MaHDB
	while(@@FETCH_STATUS = 0)
	BEGIN
		if((CAST(right(@MaHDB, 7) as int) - @sott) = 1)
			begin
				set @Sott = CAST(right(@MaHDB, 7) as int)
			end
		else break;
		fetch next from contro into @MaHDB
	end

	declare @cdai int
	declare @i int
	set @MaHDB = CAST((@sott + 1) as varchar(7))
	set @cdai = LEN(@MaHDB)
	set @i = 1
	while ( @i <= 7 - @cdai)
	begin
		set @MaHDB = '0' + @MaHDB
		set @i = @i + 1
	end
	set @MaHDB = 'HDB' + @MaHDB

	insert into HOADONBAN(MaHDB, MaKH, NgayBan, TongTien) values ( @MaHDB, @MaKH, @NgayBan, @TongTien)
	select @MaHDB
	close contro
	deallocate contro
end

GO
/****** Object:  StoredProcedure [dbo].[InsertKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--pro insert:
create PROC [dbo].[InsertKH] @TenKH nvarchar(50), @gt nvarchar(5), @DC nvarchar(50), @SDT varchar(15), @LoaiKH nvarchar(50), @ghichu ntext
as 
begin
	declare @MaKH varchar(10)
	declare @Sott int
	declare contro CURSOR forward_only for select MaKH from khachhang
	set @Sott = 0

	open contro
	fetch next from contro into @MaKH
	while(@@FETCH_STATUS = 0)
	BEGIN
		if((CAST(right(@MaKH, 8) as int) - @sott) = 1)
			begin
				set @Sott = CAST(right(@MaKH, 8) as int)
			end
		else break;
		fetch next from contro into @MaKH
	end

	declare @cdai int
	declare @i int
	set @MaKH = CAST((@sott + 1) as varchar(8))
	set @cdai = LEN(@makh)
	set @i = 1
	while ( @i <= 8 - @cdai)
	begin
		set @MaKH = '0' + @MaKH
		set @i = @i + 1
	end
	set @MaKH = 'KH' + @MaKH

	insert into khachhang (MaKH, TenKH, GT, DiaChi, SDT, LoaiKH, GhiChu) values ( @MaKH, @TenKH, @gt, @DC, @SDT, @LoaiKH, @ghichu)
	select @MaKH
	close contro
	deallocate contro
end

GO
/****** Object:  StoredProcedure [dbo].[InsertPBH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertPBH] @MaSP varchar(10), @MaKH varchar (10), @NgayBD date, @NgayKT date, @SoLan int
as
begin
		declare @MaPhieu varchar(10)
	declare @Sott1 int
	declare contro CURSOR forward_only for select SoPhieu from PHIEUBAOHANH
	set @Sott1 = 0

	open contro
	fetch next from contro into @MaPhieu
	while(@@FETCH_STATUS = 0)
	BEGIN
		if((CAST(right(@MaPhieu, 7) as int) - @Sott1) = 1) 
			begin
				set @Sott1 = CAST(right(@MaPhieu, 7) as int)
			end
		else break;
		fetch next from contro into @MaPhieu
	end

	declare @cdai int
	declare @i int
	set @MaPhieu = CAST((@Sott1 + 1) as varchar(8))
	set @cdai = LEN(@MaPhieu)
	set @i = 1
	while ( @i <= 7 - @cdai)
	begin
		set @MaPhieu = '0' + @MaPhieu
		set @i = @i + 1
	end
	set @MaPhieu = 'PBH' + @MaPhieu

	insert into PHIEUBAOHANH(SoPhieu,MaKH, MaSP, NgayBatDau, NgayKetThuc, SoLan) values ( @MaPhieu, @MaKH, @MaSP, @NgayBD, @NgayKT, @SoLan)
	select @MaPhieu
	close contro
	deallocate contro
end

--

GO
/****** Object:  StoredProcedure [dbo].[InsertPBH2]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertPBH2] (@SoPhieu varchar(10), @MaSP varchar(10), @MaKH varchar(10), @NgayBatDau datetime, @NgayKetThuc datetime,@SoLan int)
as
begin
	insert into PHIEUBAOHANH values
	(@SoPhieu, @MaSP, @MaKH, CONVERT(datetime, @NgayBatDau), convert(datetime, @NgayKetThuc),CONVERT(int,@SoLan))
end
GO
/****** Object:  StoredProcedure [dbo].[KetNoiSP_LH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KetNoiSP_LH]
as
begin
	SELECT     dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.LOAIHANG.TenLH, dbo.SANPHAM.NSX, dbo.SANPHAM.GiaBan, dbo.SANPHAM.SoLuong, 
                      dbo.SANPHAM.HinhAnh
	FROM         dbo.SANPHAM INNER JOIN
                      dbo.LOAIHANG ON dbo.SANPHAM.MaLH = dbo.LOAIHANG.MaLH 
end

GO
/****** Object:  StoredProcedure [dbo].[MuaNhieuNhat]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MuaNhieuNhat]
as
begin
	select top 10 *
	from (SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, SUM(dbo.CHITIETHOADONBAN.ThanhTien) 
                      AS TongTien
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
	GROUP BY dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan) as temp
	order by temp.TongTien DESC
end

GO
/****** Object:  StoredProcedure [dbo].[PhieuNhap]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PhieuNhap] @mancc varchar(10)
AS
BEGIN
	SELECT MaHDN, NgayNhap, TongTien FROM HOADONNHAP, 
	(SELECT MaHD, SUM(ThanhTien)TongTien FROM CHITIETHOADONNHAP GROUP BY MaHD) a
	WHERE MaNCC = @mancc AND MaHDN = MaHD
END

GO
/****** Object:  StoredProcedure [dbo].[SearchDCKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchDCKH] @str nvarchar(50)
as
begin
	select *
	from KHACHHANG
	where DiaChi like '%'+ @str + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[SearchLoaiKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchLoaiKH] @str nvarchar(50)
as
begin
	select *
	from KHACHHANG
	where LoaiKH like '%'+ @str + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[SearchTenKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchTenKH] @str nvarchar(50)
as
begin
	select *
	from KHACHHANG
	where TenKH like '%'+ @str + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[SearchTenLH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchTenLH] @str nvarchar(50)
as
begin
	SELECT     dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.LOAIHANG.TenLH, dbo.SANPHAM.NSX, dbo.SANPHAM.GiaBan, dbo.SANPHAM.SoLuong, 
                      dbo.SANPHAM.HinhAnh
	FROM         dbo.SANPHAM INNER JOIN
						  dbo.LOAIHANG ON dbo.SANPHAM.MaLH = dbo.LOAIHANG.MaLH
	WHERE     (dbo.LOAIHANG.TenLH LIKE N'%' + @str + N'%')
end

GO
/****** Object:  StoredProcedure [dbo].[SearchTenNSX]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchTenNSX] @str nvarchar(50)
as
begin
	SELECT     dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.LOAIHANG.TenLH, dbo.SANPHAM.NSX, dbo.SANPHAM.GiaBan, dbo.SANPHAM.SoLuong, 
                      dbo.SANPHAM.HinhAnh
	FROM         dbo.SANPHAM INNER JOIN
						  dbo.LOAIHANG ON dbo.SANPHAM.MaLH = dbo.LOAIHANG.MaLH
	WHERE     (NSX LIKE N'%' + @str + N'%')
end

GO
/****** Object:  StoredProcedure [dbo].[SearchTenSP]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchTenSP] @str nvarchar(50)
as
begin
	SELECT     dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.LOAIHANG.TenLH, dbo.SANPHAM.NSX, dbo.SANPHAM.GiaBan, dbo.SANPHAM.SoLuong, 
                      dbo.SANPHAM.HinhAnh
	FROM         dbo.SANPHAM INNER JOIN
						  dbo.LOAIHANG ON dbo.SANPHAM.MaLH = dbo.LOAIHANG.MaLH
	WHERE     (dbo.SANPHAM.TenSP LIKE N'%' + @str + N'%')
end

GO
/****** Object:  StoredProcedure [dbo].[Show10KH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Show10KH]
as
begin
		select top 10 *
	from (

		select kh.*, temp.TongTien
		from (SELECT  dbo.KHACHHANG.MaKH, SUM(dbo.HOADONBAN.TongTien) 
						  AS TongTien
		FROM         dbo.HOADONBAN INNER JOIN
							  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH
		GROUP BY dbo.KHACHHANG.MaKH) as temp, KHACHHANG kh
		where temp.MaKH = kh.MaKH
	) as c
	order by c.TongTien DESC
end

GO
/****** Object:  StoredProcedure [dbo].[ShowCTHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ShowCTHDB]
as
begin
	SELECT     dbo.CHITIETHOADONBAN.MaHD, dbo.CHITIETHOADONBAN.MaSP, dbo.SANPHAM.TenSP, dbo.CHITIETHOADONBAN.SoLuong, dbo.CHITIETHOADONBAN.DonGia, 
                      dbo.CHITIETHOADONBAN.ThanhTien
	FROM         dbo.CHITIETHOADONBAN INNER JOIN
                      dbo.SANPHAM ON dbo.CHITIETHOADONBAN.MaSP = dbo.SANPHAM.MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[ShowCTHDB2]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ShowCTHDB2] @MaHDB varchar(10)
as
begin
	SELECT     dbo.CHITIETHOADONBAN.MaHD, dbo.CHITIETHOADONBAN.MaSP, dbo.SANPHAM.TenSP, dbo.CHITIETHOADONBAN.SoLuong, dbo.CHITIETHOADONBAN.DonGia, 
                      dbo.CHITIETHOADONBAN.ThanhTien
	FROM         dbo.CHITIETHOADONBAN INNER JOIN
                      dbo.SANPHAM ON dbo.CHITIETHOADONBAN.MaSP = dbo.SANPHAM.MaSP
    where dbo.CHITIETHOADONBAN.MaHD = @MaHDB
end

GO
/****** Object:  StoredProcedure [dbo].[ShowHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowHDB]
as
begin
	SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, SUM(dbo.CHITIETHOADONBAN.ThanhTien) 
                      AS TongTien
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
	GROUP BY dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan
end

GO
/****** Object:  StoredProcedure [dbo].[ShowHDB1Ngay]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowHDB1Ngay] @date datetime
as
begin
	SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, SUM(dbo.CHITIETHOADONBAN.ThanhTien) 
                      AS TongTien
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
	GROUP BY dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan
	having convert(date, dbo.HOADONBAN.NgayBan) = CONVERT(date, @date)
end

GO
/****** Object:  StoredProcedure [dbo].[ShowHDBNhieuNgay]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowHDBNhieuNgay] @date1 datetime, @date2 datetime
as
begin
	SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, SUM(dbo.CHITIETHOADONBAN.ThanhTien) 
                      AS TongTien
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
	GROUP BY dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan
	having CONVERT(date, dbo.HOADONBAN.NgayBan) between CONVERT(date, @date1) and CONVERT(date, @date2)
end

GO
/****** Object:  StoredProcedure [dbo].[ShowHDBTongTien]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ShowHDBTongTien] @tien1 bigint, @tien2 bigint
as
begin
	select *
	from ( SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, SUM(dbo.CHITIETHOADONBAN.ThanhTien) 
                      AS TongTien
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
	GROUP BY dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan
	) as temp
	where temp.Tongtien >= @tien1 and temp.tongtien < @tien2
end

GO
/****** Object:  StoredProcedure [dbo].[ShowKHNhieuNgay]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowKHNhieuNgay] @date1 datetime, @date2 datetime
as
begin
	SELECT  dbo.KHACHHANG.*
	FROM         dbo.HOADONBAN INNER JOIN
						  dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH
	where CONVERT(date, dbo.HOADONBAN.NgayBan) between CONVERT(date, @date1) and CONVERT(date, @date2)
end

GO
/****** Object:  StoredProcedure [dbo].[ShowPBH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ShowPBH]
as
begin
	SELECT     dbo.PHIEUBAOHANH.SoPhieu, dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.KHACHHANG.MaKH, dbo.KHACHHANG.TenKH, dbo.PHIEUBAOHANH.NgayBatDau, 
						  dbo.PHIEUBAOHANH.NgayKetThuc, dbo.PHIEUBAOHANH.SoLan
	FROM         dbo.PHIEUBAOHANH INNER JOIN
                      dbo.SANPHAM ON dbo.PHIEUBAOHANH.MaSP = dbo.SANPHAM.MaSP INNER JOIN
                      dbo.KHACHHANG ON dbo.PHIEUBAOHANH.MaKH = dbo.KHACHHANG.MaKH
end

GO
/****** Object:  StoredProcedure [dbo].[ShowSPBanChayNhat]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ShowSPBanChayNhat]
as
begin
	select a.*, b.SoLuongBan
	from SANPHAM a, 
		(SELECT     dbo.SANPHAM.MaSP, SUM(dbo.CHITIETHOADONBAN.SoLuong) AS SoLuongBan
		FROM         dbo.SANPHAM INNER JOIN
						  dbo.CHITIETHOADONBAN ON dbo.SANPHAM.MaSP = dbo.CHITIETHOADONBAN.MaSP
		GROUP BY dbo.SANPHAM.MaSP
		having SUM(dbo.CHITIETHOADONBAN.SoLuong) = (select MAX(SoLuongBan)
			from(
			SELECT     dbo.SANPHAM.MaSP, SUM(dbo.CHITIETHOADONBAN.SoLuong) AS SoLuongBan
			FROM         dbo.SANPHAM INNER JOIN
							  dbo.CHITIETHOADONBAN ON dbo.SANPHAM.MaSP = dbo.CHITIETHOADONBAN.MaSP
			GROUP BY dbo.SANPHAM.MaSP
			) as temp)
		) b
	where a.MaSP = b.MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[SuaCTHD]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaCTHD] @mahd varchar(10), @masp nvarchar(50), @soluong int, @dongia float, @thanhtien float
AS
BEGIN
UPDATE CHITIETHOADONNHAP SET MaSP = @masp, SoLuong = @soluong, DonGia = @dongia, ThanhTien = @thanhtien
WHERE MaHD = @mahd
END

GO
/****** Object:  StoredProcedure [dbo].[SuaHDN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaHDN] @mahdn varchar(10), @mancc nvarchar(50), @ngaynhap date
AS
BEGIN
UPDATE HOADONNHAP SET MaNCC = @mancc, NgayNhap = @ngaynhap
WHERE MaHDN = @mahdn
END

GO
/****** Object:  StoredProcedure [dbo].[SuaLH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaLH] @malh varchar(10), @tenlh nvarchar(50)
AS
BEGIN
UPDATE LOAIHANG SET TenLH = @tenlh
WHERE MaLH = @malh
END

GO
/****** Object:  StoredProcedure [dbo].[SuaNCC]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaNCC] @mancc varchar(10), @tenncc nvarchar(50), @diachi nvarchar(50), @sdt varchar(15)
AS
BEGIN
UPDATE NHACUNGCAP SET TenNCC = @tenncc, DiaChi = @diachi, SDT = @sdt
WHERE MaNCC = @mancc
END

GO
/****** Object:  StoredProcedure [dbo].[SuaNhanVien]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaNhanVien](@TenDn nvarchar(50), @MatKhau varchar(50), @TenNV nvarchar(50), @GT varchar(3), @DiaChi nvarchar(50), @SDT nvarchar(50))
AS
BEGIN
	UPDATE NHANVIEN SET MatKhau=@MatKhau, TenNV=@TenNV, GT=@GT, DiaChi=@DiaChi, SDT=@SDT
						   WHERE TenDn=@TenDn
END
GO
/****** Object:  StoredProcedure [dbo].[SuaSL]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaSL] @masp varchar(10), @sl int
AS
BEGIN
	UPDATE SANPHAM SET SoLuong = SoLuong + @sl
	WHERE MaSP = @masp
END

GO
/****** Object:  StoredProcedure [dbo].[SuaSP]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaSP] @masp varchar(10), @tensp nvarchar(50), @malh nvarchar(50), @soluong int, @loinhuan float, @gianhap bigint, @mota text, @nsx nvarchar(50), @hinhanh nvarchar(100)
AS
BEGIN
UPDATE SANPHAM SET TenSP = @tensp,
MaLH = @malh, SoLuong = @soluong, GiaNhap = @gianhap, GiaBan = @gianhap+@gianhap*@loinhuan/100, MoTa = @mota, NSX = @nsx, LoiNhuan = @loinhuan, HinhAnh = @hinhanh
WHERE MaSP = @masp
END

GO
/****** Object:  StoredProcedure [dbo].[ThemCTHD]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemCTHD] @mahd varchar(10), @masp varchar(10), @soluong int, @dongia float, @thanhtien float
AS
BEGIN
INSERT INTO CHITIETHOADONNHAP(MaHD, MaSP, SoLuong, DonGia, ThanhTien) values (@mahd, @masp, @soluong, @dongia, @thanhtien)
END

GO
/****** Object:  StoredProcedure [dbo].[ThemGiaBan]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemGiaBan] @masp varchar(10), @gia float
AS
BEGIN
	UPDATE SANPHAM SET GiaBan = @gia + @gia * LoiNhuan / 100
	WHERE MaSP = @masp
END

GO
/****** Object:  StoredProcedure [dbo].[ThemHDN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemHDN] @mancc nvarchar(50), @ngaynhap date
AS
BEGIN
DECLARE @MaHDN varchar(10)
DECLARE @Sott int
DECLARE contro CURSOR FORWARD_ONLY FOR SELECT MaHDN from HOADONNHAP
SET @Sott = 0

OPEN contro
FETCH NEXT FROM contro INTO @MaHDN
WHILE(@@FETCH_STATUS = 0)
BEGIN
	IF((CAST(right(@MaHDN, 7) AS int) - @sott) = 1)
		BEGIN
			SET @Sott = @Sott + 1
		END
	ELSE BREAK
	FETCH NEXT FROM contro INTO @MaHDN
END
DECLARE @cdai int
DECLARE @i int
SET @MaHDN = CAST((@sott + 1) as varchar(8))
SET @cdai = LEN(@MaHDN)
SET @i = 1
while ( @i <= 7 - @cdai)
BEGIN
	SET @MaHDN = '0' + @MaHDN
	SET @i = @i + 1
END
SET @MaHDN = 'HDN' + @MaHDN

INSERT INTO HOADONNHAP(MaHDN, MaNCC, NgayNhap) values (@MaHDN, @mancc, @ngaynhap)
SELECT @MaHDN
CLOSE contro
DEALLOCATE contro
END

GO
/****** Object:  StoredProcedure [dbo].[ThemLH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----PROC Thêm sản phẩm
CREATE PROC [dbo].[ThemLH] @tenlh nvarchar(50)
AS
BEGIN
DECLARE @MaLH varchar(10)
DECLARE @Sott int
DECLARE contro CURSOR FORWARD_ONLY FOR SELECT MaLH from LOAIHANG
SET @Sott = 0

OPEN contro
FETCH NEXT FROM contro INTO @MaLH
WHILE(@@FETCH_STATUS = 0)
BEGIN
	IF((CAST(right(@MaLH, 8) AS int) - @sott) = 1)
		BEGIN
			SET @Sott = @Sott + 1
		END
	ELSE BREAK
	FETCH NEXT FROM contro INTO @MaLH
END
DECLARE @cdai int
DECLARE @i int
SET @MaLH = CAST((@sott + 1) as varchar(8))
SET @cdai = LEN(@MaLH)
SET @i = 1
while ( @i <= 8 - @cdai)
BEGIN
	SET @MaLH = '0' + @MaLH
	SET @i = @i + 1
END
SET @MaLH = 'LH' + @MaLH

INSERT INTO LOAIHANG(MaLH, TenLH) values (@MaLH, @tenlh)
CLOSE contro
DEALLOCATE contro
END

----exec DanhMaKH @tenKH = N'Hiếu', @dc = N'Thái Nguyên', @SDT = '09127862476', @LoaiKH = N'Khách VIP'

--CREATE PROC SuaLH @malh varchar(10), @tenlh nvarchar(50)
--AS
--BEGIN
--UPDATE LOAIHANG SET TenLH = @tenlh
--WHERE MaLH = @malh
--END

--CREATE PROC XoaLH @malh varchar(10)
--AS
--BEGIN
--DELETE FROM LOAIHANG WHERE MaLH = @malh
--END

GO
/****** Object:  StoredProcedure [dbo].[ThemNCC]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----PROC Thêm sản phẩm
CREATE PROC [dbo].[ThemNCC] @tenlh nvarchar(50), @diachi nvarchar(50), @sdt varchar(15)
AS
BEGIN
DECLARE @MaNCC varchar(10)
DECLARE @Sott int
DECLARE contro CURSOR FORWARD_ONLY FOR SELECT MaNCC from NHACUNGCAP
SET @Sott = 0

OPEN contro
FETCH NEXT FROM contro INTO @MaNCC
WHILE(@@FETCH_STATUS = 0)
BEGIN
	IF((CAST(right(@MaNCC, 7) AS int) - @sott) = 1)
		BEGIN
			SET @Sott = @Sott + 1
		END
	ELSE BREAK
	FETCH NEXT FROM contro INTO @MaNCC
END
DECLARE @cdai int
DECLARE @i int
SET @MaNCC = CAST((@sott + 1) as varchar(8))
SET @cdai = LEN(@MaNCC)
SET @i = 1
while ( @i <= 7 - @cdai)
BEGIN
	SET @MaNCC = '0' + @MaNCC
	SET @i = @i + 1
END
SET @MaNCC = 'NCC' + @MaNCC

INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, SDT) values (@MaNCC, @tenlh, @diachi, @sdt)
CLOSE contro
DEALLOCATE contro
END

----exec DanhMaKH @tenKH = N'Hiếu', @dc = N'Thái Nguyên', @SDT = '09127862476', @LoaiKH = N'Khách VIP'

--CREATE PROC SuaNCC @mancc varchar(10), @tenncc nvarchar(50), @diachi nvarchar(50), @sdt varchar(15)
--AS
--BEGIN
--UPDATE NHACUNGCAP SET TenNCC = @tenncc, DiaChi = @diachi, SDT = @sdt
--WHERE MaNCC = @mancc
--END

--CREATE PROC XoaNCC @mancc varchar(10)
--AS
--BEGIN
--DELETE FROM NHACUNGCAP WHERE MaNCC = @mancc
--END

GO
/****** Object:  StoredProcedure [dbo].[ThemSP]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemSP] @tensp nvarchar(50), @malh nvarchar(50), @soluong int, @loinhuan float, @gianhap bigint, @mota text, @nsx nvarchar(50), @hinhanh nvarchar(100)
AS
BEGIN
DECLARE @MaSP varchar(10)
DECLARE @Sott int
DECLARE contro CURSOR FORWARD_ONLY FOR SELECT MaSP from SANPHAM
SET @Sott = 0

OPEN contro
FETCH NEXT FROM contro INTO @MaSP
WHILE(@@FETCH_STATUS = 0)
BEGIN
	IF((CAST(right(@MaSP, 8) AS int) - @sott) = 1)
		BEGIN
			SET @Sott = CAST(right(@MaSP, 8) AS int)
		END
	ELSE BREAK
	FETCH NEXT FROM contro INTO @MaSP
END

DECLARE @cdai int
DECLARE @i int
SET @MaSP = CAST((@sott + 1) as varchar(8))
SET @cdai = LEN(@MaSP)
SET @i = 1
while ( @i <= 8 - @cdai)
BEGIN
	SET @MaSP = '0' + @MaSP
	SET @i = @i + 1
END
SET @MaSP = 'SP' + @MaSP

INSERT INTO SANPHAM(MaSP, TenSP, MaLH, SoLuong, LoiNhuan, GiaNhap, GiaBan, MoTa, NSX, HinhAnh) values ( @MaSP, @tensp, @malh, @soluong, @loinhuan, @gianhap, (@gianhap+@gianhap*@loinhuan/100), @mota, @nsx, @hinhanh)
SELECT @MaSP
CLOSE contro
DEALLOCATE contro
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeHDN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKeHDN] @ngaydau date, @ngaycuoi date
AS
BEGIN
	SELECT * FROM HOADONNHAP
	WHERE NgayNhap BETWEEN @ngaydau AND @ngaycuoi
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeSPB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKeSPB] @ngaydau date, @ngaycuoi date
AS
BEGIN
	SELECT sp.MaSP, TenSP, LoiNhuan, GiaNhap, GiaBan, MoTa, NSX, sp.SoLuong
	FROM SANPHAM sp, HOADONBAN hdb, CHITIETHOADONBAN cthdb
	WHERE sp.MaSP = cthdb.MaSP AND hdb.MaHDB = cthdb.MaHD AND CONVERT(date, NgayBan) BETWEEN @ngaydau AND @ngaycuoi
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeTop10]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKeTop10] @ngaydau date, @ngaycuoi date
AS
BEGIN
	SELECT TOP(10)(b.soluong)soluong, sp.MaSP, sp.TenSP, sp.LoiNhuan, sp.GiaNhap, sp.GiaBan, sp.MoTa, sp.NSX FROM SANPHAM sp,
	(SELECT a.MaSP as masp,  SUM(a.sls)soluong
	FROM  (SELECT cthdb.MaSP, NgayBan, SUM(cthdb.SoLuong)sls
		FROM CHITIETHOADONBAN cthdb, HOADONBAN hdb 
		WHERE cthdb.MaHD = hdb.MaHDB 
		GROUP BY cthdb.MaSP, NgayBan
		HAVING CONVERT(date, NgayBan) BETWEEN @ngaydau AND @ngaycuoi) a
GROUP BY a.MaSP) b
WHERE b.masp = sp.MaSP
END

GO
/****** Object:  StoredProcedure [dbo].[TongTien]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TongTien] @mahd varchar(10)
AS
BEGIN
	DECLARE @tongtien bigint
	SELECT @tongtien = SUM(ThanhTien)
	FROM CHITIETHOADONNHAP WHERE MaHD = @mahd
	SELECT @tongtien
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCTHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateCTHDB] (@MaHDB varchar(10), @MaSP varchar(10), @SoLuong int, @dongia float, @ThanhTien float)
as
begin
	UPDATE  CHITIETHOADONBAN SET MaSP=@MaSP, SoLuong=@SoLuong,DonGia=@dongia, ThanhTien=@ThanhTien
	WHERE MaHD=@MaHDB
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateHDB] @MaHDB varchar(10)
as
begin
	update HOADONBAN
	set  TongTien = temp.TongTien
	from (SELECT  SUM(dbo.CHITIETHOADONBAN.ThanhTien) AS TongTien
			FROM dbo.HOADONBAN INNER JOIN  dbo.CHITIETHOADONBAN ON dbo.HOADONBAN.MaHDB = dbo.CHITIETHOADONBAN.MaHD
			where  dbo.HOADONBAN.MaHDB = @MaHDB
	GROUP BY dbo.HOADONBAN.MaHDB) as temp
	where MaHDB = @MaHDB
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateKH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[UpdateKH] @MaKH varchar(10), @TenKH nvarchar(50), @gt nvarchar(5), @DC nvarchar(50), @SDT varchar(15), @LoaiKH nvarchar(50), @ghichu ntext
as
begin
	update KHACHHANG
	set TenKH = @TenKH, GT = @gt, DiaChi = @DC, SDT = @SDT, LoaiKH = @LoaiKH, GhiChu = @ghichu
	where MaKH = @MaKH
end

GO
/****** Object:  StoredProcedure [dbo].[UpdatePHB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdatePHB] @MaPhieu varchar(10), @MaSP varchar(10), @MaKH varchar (10), @NgayBD date, @NgayKT date, @SoLan int
as
begin
	update PHIEUBAOHANH
	set  MaKH = @MaKH, MaSP = @MaSP, NgayBatDau = @NgayBD, NgayKetThuc = @NgayKT, SoLan = @SoLan
	where SoPhieu = @MaPhieu
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateSLBan]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[UpdateSLBan] @masp varchar(10), @sl int
AS
BEGIN
	UPDATE SANPHAM SET SoLuong = SoLuong - @sl
	WHERE MaSP = @masp
END

GO
/****** Object:  StoredProcedure [dbo].[Xoa_NV]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_NV] (@TenDn nvarchar(10))
AS
BEGIN
	DELETE FROM NHANVIEN WHERE TenDn = @TenDn
END
GO
/****** Object:  StoredProcedure [dbo].[XoaCTHD]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaCTHD] @mahd varchar(10), @masp varchar(10)
AS
BEGIN
DELETE FROM CHITIETHOADONNHAP WHERE MaHD = @mahd AND MaSP = @masp
END

GO
/****** Object:  StoredProcedure [dbo].[XoaHDN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaHDN] @mahdn varchar(10)
AS
BEGIN
DELETE FROM HOADONNHAP WHERE MaHDN = @mahdn
END

GO
/****** Object:  StoredProcedure [dbo].[XoaLH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaLH] @malh varchar(10)
AS
BEGIN
DELETE FROM LOAIHANG WHERE MaLH = @malh
END

GO
/****** Object:  StoredProcedure [dbo].[XoaNCC]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaNCC] @mancc varchar(10)
AS
BEGIN
DELETE FROM NHACUNGCAP WHERE MaNCC = @mancc
END

GO
/****** Object:  StoredProcedure [dbo].[XoaSP]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaSP] @masp varchar(10)
AS
BEGIN
DELETE FROM SANPHAM WHERE MaSP = @masp
END

GO
/****** Object:  Table [dbo].[CHITIETHOADONBAN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETHOADONBAN](
	[MaHD] [varchar](10) NOT NULL,
	[MaSP] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [bigint] NULL,
	[ThanhTien] [bigint] NULL,
 CONSTRAINT [CTHDB_MAHD_PK] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOADONBAN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADONBAN](
	[MaHDB] [varchar](10) NOT NULL,
	[MaKH] [varchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[TongTien] [bigint] NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [HDB_MAHDB_PK] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GT] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[LoaiKH] [nvarchar](50) NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [KH_MAKH_PK] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOAIHANG](
	[MaLH] [varchar](10) NOT NULL,
	[TenLH] [nvarchar](50) NOT NULL,
 CONSTRAINT [LH_MALH_PK] PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[TenNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[TenNV] [nvarchar](50) NULL,
	[GT] [varchar](3) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
 CONSTRAINT [PK_DANGNHAP] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUBAOHANH]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUBAOHANH](
	[SoPhieu] [varchar](10) NOT NULL,
	[MaSP] [varchar](10) NULL,
	[MaKH] [varchar](10) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[SoLan] [int] NULL,
 CONSTRAINT [PBH_SOPHIEU_PK] PRIMARY KEY CLUSTERED 
(
	[SoPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [varchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[MaLH] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[LoiNhuan] [float] NULL,
	[GiaNhap] [bigint] NULL,
	[GiaBan] [bigint] NULL,
	[MoTa] [ntext] NULL,
	[NSX] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[NhaCC] [nvarchar](50) NULL,
 CONSTRAINT [SP_MASP_PK] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TinhTongTien]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TinhTongTien]
AS
SELECT     MaHD, SUM(ThanhTien) AS TongTien
FROM         dbo.CHITIETHOADONNHAP
GROUP BY MaHD

GO
/****** Object:  View [dbo].[InHDN]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InHDN]
AS
SELECT     dbo.HOADONNHAP.MaHDN, dbo.NHACUNGCAP.TenNCC, dbo.HOADONNHAP.NgayNhap, dbo.CHITIETHOADONNHAP.MaSP, dbo.CHITIETHOADONNHAP.SoLuong, 
                      dbo.CHITIETHOADONNHAP.DonGia, dbo.CHITIETHOADONNHAP.ThanhTien, dbo.TinhTongTien.TongTien
FROM         dbo.CHITIETHOADONNHAP INNER JOIN
                      dbo.HOADONNHAP ON dbo.CHITIETHOADONNHAP.MaHD = dbo.HOADONNHAP.MaHDN INNER JOIN
                      dbo.NHACUNGCAP ON dbo.HOADONNHAP.MaNCC = dbo.NHACUNGCAP.MaNCC INNER JOIN
                      dbo.SANPHAM ON dbo.CHITIETHOADONNHAP.MaSP = dbo.SANPHAM.MaSP INNER JOIN
                      dbo.TinhTongTien ON dbo.CHITIETHOADONNHAP.MaHD = dbo.TinhTongTien.MaHD

GO
/****** Object:  View [dbo].[InHDB]    Script Date: 9/23/2016 10:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InHDB]
AS
SELECT     dbo.HOADONBAN.MaHDB, dbo.KHACHHANG.TenKH, dbo.HOADONBAN.NgayBan, dbo.SANPHAM.TenSP, dbo.CHITIETHOADONBAN.SoLuong, 
                      dbo.CHITIETHOADONBAN.DonGia, dbo.CHITIETHOADONBAN.ThanhTien, dbo.HOADONBAN.TongTien
FROM         dbo.CHITIETHOADONBAN INNER JOIN
                      dbo.HOADONBAN ON dbo.CHITIETHOADONBAN.MaHD = dbo.HOADONBAN.MaHDB INNER JOIN
                      dbo.KHACHHANG ON dbo.HOADONBAN.MaKH = dbo.KHACHHANG.MaKH INNER JOIN
                      dbo.SANPHAM ON dbo.CHITIETHOADONBAN.MaSP = dbo.SANPHAM.MaSP

GO
ALTER TABLE [dbo].[HOADONBAN] ADD  CONSTRAINT [HDB_NB_DF]  DEFAULT (getdate()) FOR [NgayBan]
GO
ALTER TABLE [dbo].[PHIEUBAOHANH] ADD  CONSTRAINT [PBH_NBD_DF]  DEFAULT (getdate()) FOR [NgayBatDau]
GO
ALTER TABLE [dbo].[CHITIETHOADONBAN]  WITH CHECK ADD  CONSTRAINT [CTHD_MAHDB_FK] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADONBAN] ([MaHDB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHITIETHOADONBAN] CHECK CONSTRAINT [CTHD_MAHDB_FK]
GO
ALTER TABLE [dbo].[CHITIETHOADONBAN]  WITH CHECK ADD  CONSTRAINT [CTHDB_MASP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHITIETHOADONBAN] CHECK CONSTRAINT [CTHDB_MASP_FK]
GO
ALTER TABLE [dbo].[HOADONBAN]  WITH CHECK ADD  CONSTRAINT [HDB_MAKH_FK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[HOADONBAN] CHECK CONSTRAINT [HDB_MAKH_FK]
GO
ALTER TABLE [dbo].[PHIEUBAOHANH]  WITH CHECK ADD  CONSTRAINT [PBH_MAKH_FK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PHIEUBAOHANH] CHECK CONSTRAINT [PBH_MAKH_FK]
GO
ALTER TABLE [dbo].[PHIEUBAOHANH]  WITH CHECK ADD  CONSTRAINT [PBH_MASP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PHIEUBAOHANH] CHECK CONSTRAINT [PBH_MASP_FK]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_NHACUNGCAP] FOREIGN KEY([NhaCC])
REFERENCES [dbo].[NHACUNGCAP] ([TenNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_NHACUNGCAP]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [SP_MALH_FK] FOREIGN KEY([MaLH])
REFERENCES [dbo].[LOAIHANG] ([MaLH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [SP_MALH_FK]
GO
USE [master]
GO
ALTER DATABASE [Bai6_BanHangSieuThi] SET  READ_WRITE 
GO
