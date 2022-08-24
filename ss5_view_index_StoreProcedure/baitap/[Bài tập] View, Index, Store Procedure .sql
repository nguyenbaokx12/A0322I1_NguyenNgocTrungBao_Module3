CREATE DATABASE DEMO;
USE DEMO;

CREATE TABLE Products(
	id                 INT PRIMARY KEY AUTO_INCREMENT,
    productCode        VARCHAR(50),
    productName        VARCHAR(50),
    productPrice       INT,
    productAmount      INT,
    productDescription VARCHAR(50),
    productStatus      VARCHAR(50)
);
INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES  ('A03', 'Macbook', 22000, 3, 'Tán gái', 'true'),
		('A04', 'Asus', 19000, 2, 'Mạnh', 'false'),
        ('A05', 'Dell', 15000, 4, 'Bền', 'true'),
		('A01', 'Hp', 12000, 1, 'Cùi bắp', 'false'),
		('A02', 'Acer', 18000, 2, 'Ổn', 'true');
SELECT * FROM Products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX product_code ON Products(productCode);
DROP INDEX product_code ON Products;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX product_codeindex ON Products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productName = 'Macbook';

-- So sánh câu truy vấn trước và sau khi tạo index
DROP INDEX product_codeindex ON Products;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_codeview AS
SELECT productCode, productName, productPrice, productStatus FROM Products;
SELECT * FROM product_codeview;

-- Tiến hành sửa đổi view
UPDATE product_codeview 
SET productName = 'Lenovo'
WHERE productCode = 'A01';

-- Tiến hành xoá view
DROP VIEW product_codeview;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE display_product()
BEGIN
	SELECT * FROM Products;
END //
DELIMITER ;
CALL display_product();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product()
BEGIN 
	INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
	VALUES  ('A07', 'Iphone', 12000, 3, 'VIP', 'true'),
			('A09', 'Samsung', 9000, 2, 'Mạnh', 'false'),
			('A013', 'Oppo', 7000, 4, 'Cùi', 'true'),
			('A010', 'Xiaomi', 10000, 4, 'Chiến game', 'true'),
			('A011', 'Nokia', 5000, 4, 'Cứng', 'true');
END //
DELIMITER ;
CALL add_product();
DROP PROCEDURE add_product;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE edit_add_product(
idNew INT,
productCodeNew        VARCHAR(50),
productNameNew        VARCHAR(50),
productPriceNew       INT,
productAmountNew      INT,
productDescriptionNew VARCHAR(50),
productStatusNew      VARCHAR(50)
)
BEGIN
	UPDATE Products p
    SET productName = productCodeNew,
		productName = productNameNew,
        productPrice = productPriceNew,
        productPrice = productPriceNew,
        productAmount = productAmountNew,
        productDescription = productDescriptionNew,
        productStatus = productStatusNew
    WHERE p.id = idNew;
END //
DELIMITER ;
CALL edit_add_product(9,'A010', 'Huawei',1000, 4, 'Chiến game', 'true');
DROP PROCEDURE edit_add_product;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product()
BEGIN
	DELETE FROM Products WHERE id = 9;
END //
DELIMITER ;
CALL delete_product();








			







        

        


