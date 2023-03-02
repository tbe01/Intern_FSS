/* T?O B?NG */
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

Alter table ChungKhoan add foreign key (MaTC) references ToChucPhatHanh(MaTC);

Alter table TaiKhoan add foreign key (MaKH) references KhachHang(MaKH);

Alter table TaiKhoan add foreign key (MaCK) references ChungKhoan(MaCK);

/* Thêm d? li?u */
/* To Chuc Phat Hanh */
Insert into ToChucPhatHanh values ('FPT','FPT TELECOM','0101778163','Hà N?i','0123456789','contact@fpt.com');
Insert into ToChucPhatHanh values ('Viettel','VIETTEL TECHNOLOGIES JSC','0102725460','Hà N?i','0123654987','contact@viettel.com');
Insert into ToChucPhatHanh values ('VINAMILK','VINAMILK','0300588569','H? Chí Minh','0147258369','contact@vinamilk.com');
Insert into ToChucPhatHanh values ('VWGRE','VIN WORLD GROUP REAL ESTATE','0316462321','H? Chí Minh','0937729999','contact@vwgre.com');
Insert into ToChucPhatHanh values ('MB','MILITARY COMMERCIAL JOINT STOCK BANK','0100283873','Hà N?i','0462661088','contact@mb.com');
/* Khách hàng */
select * from KhachHang;
Insert into KhachHang values ('KH01','Tr?n Vi?t H?i','031201000216','Nguy?n An Ninh','0123456789','abcd@gmail.com');
Insert into KhachHang values ('KH02','Tr?n Thành Công','0147258369','V??ng Th?a V?','0123654987','abcd1@gmail.com');
Insert into KhachHang values ('KH03','Nguy?n Ph??ng Th?o','3692581470','Ph?m V?n ??ng','0321456789','abcd@gmail.com');
Insert into KhachHang values ('KH04','Nguy?n S?n Tùng','9638527410','Tr??ng Chinh','0333444777','abcd3@gmail.com');
Insert into KhachHang values ('KH05','Võ V?n Th??ng','7410852963','Lê Tr?ng T?n','0222555888','abcd4@gmail.com');
/* Chung Khoan */
Insert into ChungKhoan values ('FPTS','FPT',to_date('11/7/2008','dd/mm/yyyy'),'80000');
Insert into ChungKhoan values ('VGI','Viettel',to_date('18/07/2009','dd/mm/yyyy'),'60000');
Insert into ChungKhoan values ('VNM','VINAMILK',to_date('15/11/2010','dd/mm/yyyy'),'70000');
Insert into ChungKhoan values ('VIC','VWGRE',to_date('12/12/2006','dd/mm/yyyy'),'52000');
Insert into ChungKhoan values ('MBB','MBB',to_date('15/12/2015','dd/mm/yyyy'),'60000');
/* L?u ký */
Insert into LuuKy values ('KH01','VNM','0');
Insert into LuuKy values ('KH02','VIC','0');
Insert into LuuKy values ('KH03','MBB','0');
Insert into LuuKy values ('KH04','FPTS','0');
Insert into LuuKy values ('KH05','VGI','0');

/* Procedure t?ng l?u ký */
SET SERVEROUTPUT on  
DECLARE 
Ma_KH LuuKy.MaKH%type:='&Ma_KH';
Ma_CK LuuKy.MaCK%type:='&Ma_CK';
So_Luong int;
BEGIN
    So_Luong := &So_Luong;
    UPDATE LuuKy SET SoLuong=SoLuong+So_Luong where MaKH=Ma_KH and MaCK=Ma_CK;
    DBMS_OUTPUT.put_line('C?p nh?t l?u ký thành công');
END;


