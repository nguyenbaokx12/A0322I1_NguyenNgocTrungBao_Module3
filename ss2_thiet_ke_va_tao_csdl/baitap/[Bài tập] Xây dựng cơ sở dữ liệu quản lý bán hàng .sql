CREATE DATABASE XayDungCSDLQuanLyBanHang;
USE XayDungCSDLQuanLyBanHang;

CREATE TABLE Customer(
cID INT AUTO_INCREMENT PRIMARY KEY,
cName VARCHAR(50),
cAge INT
);
INSERT INTO Customer(cName, cAge)
VALUES ('Nguyễn Ngọc Trung Bảo', 19), ('Võ Nguyễn Phát', 19), ('Huỳnh Văn Nam', 19);

CREATE TABLE `Order`(
oID INT AUTO_INCREMENT PRIMARY KEY,
cID1 INT,
oDate DATE,
oTotalPrice INT,
FOREIGN KEY (cID1) REFERENCES Customer(cID)
);
INSERT INTO `Order`(cID1, oDate, oTotalPrice)
VALUES (1, '2022-06-25', 100), (2, '2022-06-19', 90), (3, '2022-03-10', 80);

CREATE TABLE Product(
pID INT AUTO_INCREMENT PRIMARY KEY,
pName VARCHAR(50),
pPrice INT
);
INSERT INTO Product(pName, pPrice)
VALUES ('Macbook', 50), ('Dell', 90), ('MSI', 40);

CREATE TABLE OrderDetail(
oID1 INT,
pID1 INT,
OdOTY INT,
FOREIGN KEY (oID1) REFERENCES `Order`(oID),
FOREIGN KEY (pID1) REFERENCES Product(pID),
PRIMARY KEY (oID1, pID1)
);
INSERT INTO OrderDetail(oID1, pID1, OdOTY)
VALUES (1, 1, 2), (2, 2, 1), (3, 3, 2);