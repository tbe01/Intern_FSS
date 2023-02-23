create table KhachHang
(MaKH nvarchar2(20),
TenKH nvarchar2(50),
CCCD varchar2(10),
DiaChi nvarchar2(100),
SDT varchar2(10),
Email nvarchar2(100),
Primary key (MaKH));

Create table ToChucPhatHanh
(MaTC nvarchar2(20),
TenTC nvarchar2(50),
MaSoThue nvarchar2(50),
Primary key (MaTC));

Create table ChungKhoan
( MaCK nvarchar2(15),
MaTC nvarchar2(20),
NgayPhatHanh date,
LoaiCK nvarchar2(15),
MenhGia float,
Primary key (MaCK));

Create table TaiKhoan
( MaKH nvarchar2(20),
MaCK nvarchar2(15),
Soluong int,
Primary key (MaKH, MaCK));

Alter table ChungKhoan add foreign key (MaTC) references ToChucPhatHanh(MaTC);

Alter table TaiKhoan add foreign key (MaKH) references KhachHang(MaKH);

Alter table TaiKhoan add foreign key (MaCK) references ChungKhoan(MaCK);

