CREATE DATABASE	ERD_Sang_Mo_Hinh_QuanHe;
USE ERD_Sang_Mo_Hinh_QuanHe;

CREATE TABLE PhieuXuat(
SoPX varchar(50) primary key,
NgayXuat date
);

CREATE TABLE VatTu(
MaVTU varchar(50) primary key,
TenVTU varchar(50)
);

CREATE TABLE ChiTietPhieuXuat(
MaVTU1 varchar(50),
PhieuXuat1 varchar(50),
DGXuat varchar(50),
SLXuat int,
FOREIGN KEY (MaVTU1) REFERENCES VatTu(MaVTU),
FOREIGN KEY (PhieuXuat1) REFERENCES PhieuXuat(SoPX)
);
ALTER TABLE ChiTietPhieuXuat add primary key(MaVTU1, PhieuXuat1);


CREATE TABLE PhieuNhap(
SoPN varchar(50) primary key,
NgayNhap date
);

CREATE TABLE ChiTietPhieuNhap(
SoPN1 varchar(50),
MaVTU1 varchar(50),
DGNhap varchar(50),
SLNhap int,
FOREIGN KEY (MaVTU1) REFERENCES VatTu(MaVTU),
FOREIGN KEY (SoPN1) REFERENCES PhieuNhap(SoPN)
);
ALTER TABLE ChiTietPhieuNhap add primary key(MaVTU1, SoPN1);


CREATE TABLE NhaCC(
MaNCC varchar(50) primary key,
TenNCC varchar(50),
DiaChi varchar(50),
SDT varchar(50) unique not null
);

CREATE TABLE DonDH(
SoDH varchar(50) primary key,
NgayDH date,
MaNCC varchar(50),
FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
);

CREATE TABLE ChiTietDonDatHang(
MaVTU1 varchar(50),
SoDH1 varchar(50),
FOREIGN KEY (MaVTU1) REFERENCES VatTu(MaVTU),
FOREIGN KEY (SoDH1) REFERENCES DonDH(SoDH)
);
ALTER TABLE CHiTietDonDatHang add primary key(MaVTU1, SoDH1);

CREATE TABLE SDT(
SDT varchar(50),
FOREIGN KEY (SDT) REFERENCES NhaCC(SDT)
);





