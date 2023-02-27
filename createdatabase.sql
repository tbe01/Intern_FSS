CREATE  TABLE khachhang
(
    MaKH varchar2(20),
    TenKH nvarchar2(50),
    MaCCCD varchar2(12),
    DiaChi nvarchar2(100),
    SDT varchar2(10),
    Email nvarchar2(100),
    CONSTRAINT kh_pk PRIMARY KEY (MaKH)
);   

CREATE TABLE tochucphathanh
(
    MaTC varchar2(20),
    TenTC nvarchar2(100),
    MaSoThue varchar2(50),
    DiaChi nvarchar2(100),
    SDT varchar2(10),
    Email nvarchar2(100),
    CONSTRAINT tcpt_pk PRIMARY KEY (MaTC)
);

CREATE TABLE loaichungkhoan
(
    MaLoaiCK varchar2(10),
    TenLoaiCK nvarchar2(100),
    CONSTRAINT lck_pk PRIMARY KEY (MaLoaiCK)
);

CREATE TABLE chungkhoan
(   
    MaCK varchar2(10),
    MaTC varchar2(20),
    NgayPhatHanh date,
    MenhGia number(8,2),
    CONSTRAINT ck_pk PRIMARY KEY (MaCK)
);

CREATE TABLE luuky
(
    MaKH varchar2(20),
    MaCK varchar2(10),
    SoLuong int,
    CONSTRAINT lk_pk PRIMARY KEY (MaKH, MaCK),
    CONSTRAINT lk_ck_fk FOREIGN KEY (MaCK) REFERENCES chungkhoan(MaCK),
    CONSTRAINT lk_kh_fk FOREIGN KEY (MaKH) REFERENCES khachhang (MaKH)
);