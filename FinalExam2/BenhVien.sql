create database benhvien;
use	benhvien;

create table benhan(
	`idBenhAn` int primary key auto_increment,
    `nameBenhAn` varchar(50)
);

create table benhnhan(
    `idBenhNhan` int primary key,
    `nameBenhNhan` varchar(50),
    `ngayNhapVien` date,
    `ngayXuatVien` date,
    `lyDo` varchar(500),
    `id_BenhAn` int,
    foreign key(`id_BenhAn`) references benhan(`idBenhAn`)
);

select * from benhan;
select * from benhnhan;
drop table benhan;
drop table benhnhan;

INSERT INTO `benhvien`.`benhan` (`idBenhAn`, `nameBenhAn`) VALUES ('1', 'BA-435');
INSERT INTO `benhvien`.`benhan` (`idBenhAn`, `nameBenhAn`) VALUES ('2', 'BA-123');
INSERT INTO `benhvien`.`benhan` (`idBenhAn`, `nameBenhAn`) VALUES ('3', 'BA-735');
INSERT INTO `benhvien`.`benhan` (`idBenhAn`, `nameBenhAn`) VALUES ('4', 'BA-914');


INSERT INTO `benhvien`.`benhnhan` (`idBenhNhan`,`id_BenhAn`, `nameBenhNhan`, `ngayNhapVien`, `ngayXuatVien`, `lyDo`) 
VALUES ('112','1', 'Nguyễn Văn A', '2006-03-16', '2006-03-30', 'Ung thư gan');

INSERT INTO `benhvien`.`benhnhan` (`idBenhNhan`, `id_BenhAn`, `nameBenhNhan`, `ngayNhapVien`, `ngayXuatVien`, `lyDo`) 
VALUES ('223','2', 'Nguyễn Văn C', '2007-08-20', '2007-08-30', 'Suy thận');

INSERT INTO `benhvien`.`benhnhan` (`idBenhNhan`, `id_BenhAn`, `nameBenhNhan`, `ngayNhapVien`, `ngayXuatVien`, `lyDo`) 
VALUES ('459','3', 'Đỗ Thị E', '2007-02-20', '2007-03-10', 'Covid 19');

INSERT INTO `benhvien`.`benhnhan` (`idBenhNhan`, `id_BenhAn`, `nameBenhNhan`, `ngayNhapVien`, `ngayXuatVien`, `lyDo`) 
VALUES ('315','4', 'Huỳnh Văn B', '2007-011-20', '2007-12-30', 'Đau tim');


    



