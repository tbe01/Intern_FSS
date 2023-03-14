CREATE TABLE sangiaodich
(
    masan varchar2(20),
    tensan varchar2(50),
    ghichu varchar2(50),
    CONSTRAINT sgd_pk PRIMARY KEY (masan)
);

CREATE TABLE phanloai
(
    maloai varchar2(20),
    tenloai varchar2(50),
    mota varchar2(50),
    CONSTRAINT pl_pk PRIMARY KEY (maloai)
);

CREATE  TABLE khachhang
(
    MaKH varchar2(20),
    TenKH varchar2(50),
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

CREATE TABLE chungkhoan
(   
    MaCK varchar2(10),
    MaTC varchar2(20),
    MaLoai varchar2(10),
    NgayPhatHanh date,
    MenhGia number(8,2),
    CONSTRAINT ck_pk PRIMARY KEY (MaCK),
    CONSTRAINT ck_lck_fk FOREIGN KEY (MaLoaiCK) REFERENCES loaichungkhoan(MaLoaiCK),
    CONSTRAINT ck_tc_fk FOREIGN KEY (MaTC) REFERENCES tochucphathanh(MaTC)
);



CREATE TABLE LuuKy
(
    MaKH varchar2(20),
    MaCK varchar2(10),
    SoLuong int,
    CONSTRAINT lk_pk PRIMARY KEY (MaKH, MaCK),
    CONSTRAINT lk_ck_fk FOREIGN KEY (MaCK) REFERENCES chungkhoan(MaCK),
    CONSTRAINT lk_kh_fk FOREIGN KEY (MaKH) REFERENCES khachhang (MaKH)
);

CREATE TABLE lenh
(
    MaLenh varchar2(20),
    MaKH varchar2(20),
    MaCK varchar2(10),
    Gia float, 
    SoLuong int, 
    TongGiaTri int,
    NgayDatLenh date,
    NgayThanhToan date,
    TrangThai varchar2(20),
    CONSTRAINT lenh_pk PRIMARY KEY (MaLenh),
    CONSTRAINT lenh_kh_fk FOREIGN KEY (MaKH) REFERENCES khachhang (MaKH),
    CONSTRAINT lenh_ck_fk FOREIGN KEY (MaCK) REFERENCES chungkhoan(MaCK)
);

/* Insert */

/* khachhang */
INSERT INTO KhachHang VALUES ('KH01','Tran Viet Hai','031201000216','28 Nguy?n An Ninh','0123456789','abcd@gmail.com');
INSERT INTO KhachHang VALUES ('KH02','Tr?n Thành Công','0147258369','74 V??ng Th?a V?','0123654987','abcd1@gmail.com');
INSERT INTO KhachHang VALUES ('KH03','Nguy?n Ph??ng Th?o','3692581470','19 Ph?m V?n ??ng','0321456789','abcd@gmail.com');
INSERT INTO KhachHang VALUES ('KH04','Nguy?n S?n Tùng','9638527410','22 Tr??ng Chinh','0333444777','abcd3@gmail.com');
INSERT INTO KhachHang VALUES ('KH05','Võ V?n Th??ng','7410852963','157Lê Tr?ng T?n','0222555888','abcd4@gmail.com');

/* tochucphathanh */
INSERT INTO tochucphathanh(MaTC,TenTC,MaSoThue,DiaChi,SDT,Email)
    VALUES('FPT','FPT TELECOM','0101778163','Hà N?i','0123456789','contact@fpt.com');    
INSERT INTO ToChucPhatHanh VALUES ('FPT','FPT TELECOM','0101778163','Hà N?i','0123456789','contact@fpt.com');
INSERT INTO ToChucPhatHanh VALUES ('Viettel','VIETTEL TECHNOLOGIES JSC','0102725460','Hà N?i','0123654987','contact@viettel.com');
INSERT INTO ToChucPhatHanh VALUES ('VINAMILK','VINAMILK','0300588569','H? Chí Minh','0147258369','contact@vinamilk.com');
INSERT INTO ToChucPhatHanh VALUES ('VWGRE','VIN WORLD GROUP REAL ESTATE','0316462321','H? Chí Minh','0937729999','contact@vwgre.com');
INSERT INTO ToChucPhatHanh VALUES ('MB','MILITARY COMMERCIAL JOINT STOCK BANK','0100283873','Hà N?i','0462661088','contact@mb.com');

/*loaichungkhoan*/
INSERT INTO loaichungkhoan VALUES ('CP','Co phieu');
INSERT INTO loaichungkhoan VALUES ('TP','Trai phieu');
INSERT INTO loaichungkhoan VALUES ('CCQ','Chung chi quy');
INSERT INTO loaichungkhoan VALUES ('CQ','Chung quyen');
INSERT INTO loaichungkhoan VALUES ('CQDB','Chung quyen có dam bao');
INSERT INTO loaichungkhoan VALUES ('QMCP','Quyen mua co phan');
INSERT INTO loaichungkhoan VALUES ('CCLK','Chung chi luu ky');
INSERT INTO loaichungkhoan VALUES ('CKPS','Chung khoan phai sinh');
INSERT INTO loaichungkhoan VALUES ('CKK','Cac loai chung khoan khac do Chinh phu quy dinh');

/* ChungKhoan */
INSERT INTO ChungKhoan VALUES ('FPTS','FPT','CP',to_date('11/7/2008','dd/mm/yyyy'),'80000');
INSERT INTO ChungKhoan VALUES ('VGI','Viettel','CP',to_date('18/07/2009','dd/mm/yyyy'),'60000');
INSERT INTO ChungKhoan VALUES ('VNM','VINAMILK','CP',to_date('15/11/2010','dd/mm/yyyy'),'70000');
INSERT INTO ChungKhoan VALUES ('VIC','VWGRE','CP',to_date('12/12/2006','dd/mm/yyyy'),'52000');
INSERT INTO ChungKhoan VALUES ('MBB','MB','CP',to_date('15/12/2015','dd/mm/yyyy'),'60000');

/* Luuky */
INSERT INTO LuuKy VALUES ('KH01','VNM','0');
INSERT INTO LuuKy VALUES ('KH02','VIC','0');
INSERT INTO LuuKy VALUES ('KH03','MBB','0');
INSERT INTO LuuKy VALUES ('KH04','FPTS','0');
INSERT INTO LuuKy VALUES ('KH05','VGI','0');









