CREATE DATABASE CaseStudy_Furama;
USE CaseStudy_Furama;

CREATE TABLE vi_tri(
	ma_vi_tri  INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do(
	ma_trinh_do  INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);
        
CREATE TABLE bo_phan(
	ma_bo_phan  INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien(
	ma_nhan_vien  INT PRIMARY KEY,
    ho_ten 		  VARCHAR(45),
	ngay_sinh 	  DATE,
	so_cmnd 	  VARCHAR(45),
	luong         DOUBLE,
	so_dien_thoai VARCHAR(45),
	email 		  VARCHAR(45),
	dia_chi 	  VARCHAR(45),
    ma_vi_tri	  INT,
    ma_trinh_do   INT,
    ma_bo_phan    INT,
    FOREIGN KEY (ma_vi_tri)   REFERENCES vi_tri(ma_vi_tri),
	FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
	FOREIGN KEY (ma_bo_phan)  REFERENCES bo_phan(ma_bo_phan)
);

		
CREATE TABLE loai_khach(
	ma_loai_khach  INT PRIMARY KEY,
	ten_loai_khach VARCHAR(45)
);


CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY,
	ma_loai_khach INT,
	ho_ten 		  VARCHAR(45),
	ngay_sinh 	  DATE,
	gioi_tinh 	  BIT(1),
	so_cmnd 	  VARCHAR(45),
	so_dien_thoai VARCHAR(45),
	email 		  VARCHAR(45),
	dia_chi       VARCHAR(45),
	FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue(
	ma_kieu_thue  INT PRIMARY KEY,
	ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu  INT PRIMARY KEY,
	ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu(
	ma_dich_vu 			 INT PRIMARY KEY,
	ten_dich_vu 		 VARCHAR(45),
	dien_tich 			 INT,
	chi_phi_thue 		 DOUBLE,
	so_nguoi_toi_da 	 INT,
	ma_kieu_thue 		 INT,
	ma_loai_dich_vu 	 INT,
	tieu_chuan_phong     VARCHAR(45),
	mo_ta_tien_nghi_khac VARCHAR(45),
	dien_tich_ho_boi     DOUBLE,
	so_tang 			 INT,
	FOREIGN KEY(ma_kieu_thue) 	 REFERENCES  kieu_thue(ma_kieu_thue),
	FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);
       

CREATE TABLE hop_dong(
	ma_hop_dong 	  INT PRIMARY KEY,
	ngay_lam_hop_dong DATETIME,
	ngay_ket_thuc	  DATETIME,
	tien_dat_coc 	  DOUBLE,
	ma_nhan_vien 	  INT,
	ma_khach_hang 	  INT,
	ma_dich_vu 		  INT,
	FOREIGN KEY(ma_nhan_vien)  REFERENCES nhan_vien(ma_nhan_vien),
	FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
	FOREIGN KEY(ma_dich_vu)    REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
	ma_dich_vu_di_kem  INT PRIMARY KEY,
	ten_dich_vu_di_kem VARCHAR(45),
	gia 			   DOUBLE,
	don_vi 			   VARCHAR(100),
	trang_thai 		   VARCHAR(45)
);


CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong 		 INT,
    ma_dich_vu_di_kem	 INT,
    so_luong 			 INT,
    FOREIGN KEY(ma_hop_dong)  		REFERENCES hop_dong(ma_hop_dong),
	FOREIGN KEY(ma_dich_vu_di_kem)  REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);


        
-- 1. Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

-- Vị Trí --
INSERT INTO vi_tri(ma_vi_tri, ten_vi_tri)
VALUES 	(1, 'Giám đốc'), 
		(2, 'Quản Lý'),
		(3, 'Giám Sát'),
		(4, 'Chuyên Viên'),
		(5, 'Phục Vụ'),
		(6, 'Lễ Tân');
        
-- Trình Độ --
INSERT INTO trinh_do(ma_trinh_do, ten_trinh_do)
VALUES 	(1,'Trung Cấp'),
		(2,'Cao Đẳng'),
        (3,'Đại Học'),
        (4,'Sau Đại Học');
        
-- Bộ Phận --        
INSERT INTO bo_phan(ma_bo_phan, ten_bo_phan)
VALUES 	(1,'Sale-Marketing'),
		(2,'Hành Chính'),
		(3,'Phục Vụ'),
		(4,'Quản Lý');
        
-- Nhân Viên --        
INSERT INTO nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
VALUES  (1, 'Nguyễn Ngọc Trung Bảo', '2003-6-25', '206493602', 1000, '0389056171', 'baokx2k3@gmail.com', 'Thăng Bình', 1, 4, 4 ),
		(2, 'Nguyễn Ngọc Huy Bảo', '2003-6-25', '206493603', 800, '0329002453', 'hbkx22kx3@gmail.com', 'Thăng Bình', 3, 2, 1 ),
        (3, 'Huỳnh Văn Nam', '2003-3-10', '206493154', 1000, '0321724124', 'namhuynh@gmail.com', 'Thăng Bình', 2, 1, 4 ),
        (4, 'Phạm Nguyễn Trường Tín', '2003-5-12', '206412171', 900, '0312388242', 'tinpham@gmail.com', 'Núi Thành', 4, 1, 2 ),
		(5, 'Võ Nguyễn Phát', '2003-6-19', '206492131', 1100, '0312324912', 'phatvo@gmail.com', 'Nông Sơn', 1, 3, 4 ),
		(6, 'Dương Tấn Tài', '2003-2-12', '206437123', 500, '0342417234', 'taiduong@gmail.com', 'Duy Xuyên', 6, 1, 1 ),
		(7, 'Trần Công Nhật', '2003-11-8', '206812337', 650, '0981234412', 'nhattran@gmail.com', 'Phú Ninh', 5, 2, 3 ),
		(8, 'Nguyễn Đức Việt', '2003-4-12', '206781231', 480, '0931231284', 'vietnguyen@gmail.com', 'Thăng Bình', 6, 1, 4 ),
		(9, 'Ngô Ngọc Huy', '2003-9-11', '206152351', 700, '09137127312', 'huyngo@gmail.com', 'Núi Thành', 3, 1, 4 ),
		(10, 'Kiều Nhật Tân', '2003-10-12', '206812312', 800, '0313192412', 'tankieu@gmail.com', 'Thăng Bình', 4, 2, 4 ),
		(11, 'Phạm Thị Thuý Hằng', '2003-5-24', '206123144', 800, '0283183211', 'hangpham@gmail.com', 'Thăng Bình', 5, 2, 3);
        
-- Loại Khách --
INSERT INTO loai_khach(ma_loai_khach,ten_loai_khach)
VALUES  (1,'Diamond'),
		(2,'Platinium'),
		(3,'Gold'),
		(4,'Silver'),
		(5,'Member');
        
-- Khách Hàng --        
INSERT INTO khach_hang(ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
VALUES 	 (1,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
         (2,'Trần Cao Vân','1990-4-12',1,'488641231','031238123','vancao2702@gmail.com','K67/47 Hà Huy Tập, Đà Nẵng',2),
         (3,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
		 (4,'Nguyễn Văn Chí','1990-5-11',1,'4886712393','09123712321','chinguyen123@gmail.com','Nguyễn Văn Cừ, Hà Nội',1),
         (5,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
         (6,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
         (7,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
         (8,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
         (9,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1);

-- Hợp Đồng --          
INSERT INTO hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
VALUES  (1,'2020-12-08','2020-12-08',0,3,1,3),
		(2,'2020-07-14','2020-07-21',200000,7,3,1),
		(3,'2021-03-15','2021-03-17',50000,3,4,2),
		(4,'2021-01-14','2021-01-18',100000,7,5,5),
		(5,'2021-07-14','2021-07-15',0,7,2,6),
		(6,'2021-06-01','2021-06-03',0,7,7,6),
		(7,'2021-09-02','2021-09-05',100000,7,4,4),
		(8,'2021-06-17','2021-06-18',150000,3,4,1),
		(9,'2020-11-19','2020-11-19',0,3,4,3),
		(10,'2021-04-12','2021-04-14',0,10,3,5),
		(11,'2021-04-25','2021-04-25',0,2,2,1),
		(12,'2021-05-25','2021-05-27',0,7,8,1);

-- Hợp Đồng Chi Tiết --        
INSERT INTO hop_dong_chi_tiet(ma_hop_dong_chi_tiet,so_luong,ma_hop_dong,ma_dich_vu_di_kem)
VALUES  (1,5,2,4),
		(2,8,2,5),
		(3,15,2,6),
		(4,1,3,1),
		(5,11,3,2),
		(6,1,1,3),
		(7,2,1,2),
		(8,2,12,2);

-- Dịch Vụ Đi Kèm --        
INSERT INTO dich_vu_di_kem(ma_dich_vu_di_kem,ten_dich_vu_di_kem,gia,don_vi,trang_thai)
VALUES  (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
		(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
		(3,'Thuê xe đạp',20000,'chiếc','tốt'),
		(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');


-- Loại Dịch Vụ --        
INSERT INTO loai_dich_vu(ma_loai_dich_vu, ten_loai_dich_vu)
VALUES  (1,'Villa'),
		(2,'House'),
		(3,'Room');

-- Kiểu Thuê --        
INSERT INTO kieu_thue(ma_kieu_thue,ten_kieu_thue)
VALUES (1,'year'),
	   (2,'month'),
	   (3,'day'),
	   (4,'hour');

-- Dịch Vụ --       
INSERT INTO dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
VALUES  (1,'Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
		(2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',NULL,3,2,2),
		(3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',NULL,NULL,4,3),
		(4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,3,1),
		(5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',NULL,2,3,2),
		(6,'Room Twin 02',3000,900000,2,'normal','Có tivi',NULL,NULL,4,3);

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT * FROM nhan_vien
WHERE ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%'
LIMIT 15;

-- 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang
WHERE (TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) BETWEEN 18 AND 50) AND (dia_chi LIKE '% Đà Nẵng' OR dia_chi LIKE '% Quảng Trị');

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.ho_ten, hdct.so_luong FROM khach_hang kh
INNER JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
INNER JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_hop_dong
INNER JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE lk.ten_loai_khach = 'Diamond'
ORDER BY hdct.so_luong ASC;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(dv.chi_phi_thue+dvdk.gia*hdct.so_luong) as 'tong_tien'
from khach_hang kh left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
				   left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
                   left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
                   left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
                   left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem;
 
 

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
FROM dich_vu dv JOIN loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
				JOIN hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
WHERE MONTH(hd.ngay_lam_hop_dong) BETWEEN 4 AND 12
GROUP BY dv.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng 
-- chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
WHERE exists(
		 	   SELECT 1 FROM hop_dong hd 
			   WHERE dv.ma_dich_vu = hd.ma_dich_vu AND YEAR (hd.ngay_lam_hop_dong)= 2020
           )
			   AND not exists(
			   SELECT 1 FROM hop_dong hd
			   WHERE dv.ma_dich_vu = hd.ma_dich_vu AND YEAR(hd.ngay_lam_hop_dong) = 2021
		  );
          
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
--  Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
		-- c1 
        SELECT DISTINCT(ho_ten) FROM khach_hang;
        -- c2 
        SELECT ho_ten FROM khach_hang GROUP BY ho_ten;
        -- c3
        SELECT ho_ten FROM khach_hang
        UNION 
        SELECT ho_ten FROM khach_hang;
        
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT tmp.thang, co.so_lan_khach_dat
FROM
    (
       SELECT 1 AS thang
      UNION SELECT 2 AS thang
      UNION SELECT 3 AS thang
      UNION SELECT 4 AS thang
      UNION SELECT 5 AS thang
      UNION SELECT 6 AS thang
      UNION SELECT 7 AS thang
      UNION SELECT 8 AS thang
      UNION SELECT 9 AS thang
      UNION SELECT 10 AS thang
      UNION SELECT 11 AS thang
      UNION SELECT 12 AS thang
    ) AS tmp
 LEFT JOIN (
	   SELECT
            month(ngay_lam_hop_dong) AS thang,
            count(ma_khach_hang) AS so_lan_khach_dat
       FROM hop_dong
	   WHERE YEAR(ngay_lam_hop_dong) = '2021'
       GROUP BY thang
    ) AS co USING (thang);
    
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(hd.tien_dat_coc) tong_tien_coc, ifnull(sum(hdct.so_luong), 0) so_luong_dich_vu_di_kem
FROM hop_dong hd LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những 
-- khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT ma_dich_vu_di_kem, ten_dich_vu_di_kem FROM dich_vu_di_kem
JOIN hop_dong_chi_tiet USING (ma_dich_vu_di_kem)
JOIN  hop_dong hd 	   USING (ma_hop_dong)
JOIN  khach_hang 	   USING (ma_khach_hang)
JOIN  loai_khach 	   USING (ma_loai_khach)
WHERE ten_loai_khach = 'Diamond' AND ( dia_chi LIKE '%Vinh%' OR dia_chi LIKE '%Quang Ngai%');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 
-- 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten as 'Họ Tên Nhân Viên', kh.ho_ten as 'Họ Tên Khách Hàng', kh.so_dien_thoai, ten_dich_vu, sum(hdct.so_luong) 'Số lượng dịch vụ đi kèm', hd.tien_dat_coc
from hop_dong hd left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
				  left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
                  left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
                  left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong) like 2020 and month(hd.ngay_lam_hop_dong) between 10 and 12
and year(ngay_lam_hop_dong) not like 2021 and month(ngay_lam_hop_dong) not between 1 and 6
group by kh.ho_ten

-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi, count(hd.ma_nhan_vien) tong_so_hop_dong FROM nhan_vien
JOIN trinh_do    USING (ma_trinh_do)
JOIN bo_phan     USING (ma_bo_phan)
JOIN hop_dong hd USING (ma_nhan_vien)
WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY hd.ma_nhan_vien
HAVING tong_so_hop_dong <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhan_vien
WHERE NOT EXISTS (
		SELECT * FROM hop_dong
		WHERE nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien AND YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND 2021
        );
        
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong 
-- năm 2021 là lớn hơn 10.000.000 VNĐ

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- After set CASCADE
DELETE FROM khach_hang kh
WHERE NOT EXISTS (
        SELECT 1 FROM hop_dong
        WHERE kh.ma_khach_hang = ma_khach_hang AND YEAR(ngay_lam_hop_dong) >= 2021
    );
    
    
	


        



        


