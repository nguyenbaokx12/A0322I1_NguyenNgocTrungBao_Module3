CREATE DATABASE ThaoTacCSDLQuanLyBanHang;
USE ThaoTacCSDLQuanLyBanHang;

CREATE TABLE Customer(
cID   INT AUTO_INCREMENT PRIMARY KEY,
cName VARCHAR(25),
cAge  TINYINT
);
INSERT INTO Customer(cName, cAge)
VALUES ('Minh Quan', 10), ('Ngoc Oanh', 20), ('Hong Ha', 50);

CREATE TABLE `Order`(
oID 		INT AUTO_INCREMENT PRIMARY KEY,
cID 		INT,
oDate       DATETIME,
oTotalPrice INT,
FOREIGN KEY (cID) REFERENCES Customer(cID)
);
INSERT INTO `Order`(cID, oDate, oTotalPrice)
VALUES (1, '2006-03-21', Null), (2, '2006-03-23', Null), (1, '2006-03-16', Null);

CREATE TABLE Product(
pID    INT AUTO_INCREMENT PRIMARY KEY,
pName  VARCHAR(25),
pPrice INT
);
INSERT INTO Product(pName, pPrice)
VALUES ('May Giat', 3), ('Tu Lanh', 5), ('Dieu Hoa', 7), ('Quat', 1), ('Bep Dien', 2);

CREATE TABLE OrderDetail(
oID   INT,
pID   INT,
OdOTY INT,
FOREIGN KEY (oID) REFERENCES `Order`(oID),
FOREIGN KEY (pID) REFERENCES Product(pID),
PRIMARY KEY (oID, pID)
);
INSERT INTO OrderDetail(oID, pID, OdOTY)
VALUES (1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), (3, 1, 8), (2, 5, 4), (2, 3, 3);

-- 1 Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order.
SELECT * FROM `Order`;

-- 2 Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.

-- 3 Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào.

-- 4 Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)






