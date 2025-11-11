CREATE DATABASE demo;
USE demo;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001', 'Laptop Asus', 1500.00, 10, 'Laptop văn phòng cấu hình cao', 'Available'),
('P002', 'Laptop Dell', 1800.00, 5, 'Laptop cho doanh nhân', 'Available'),
('P003', 'Chuột Logitech', 25.50, 50, 'Chuột không dây', 'Available'),
('P004', 'Bàn phím cơ Keychron', 120.00, 15, 'Bàn phím cơ RGB', 'Out of stock'),
('P005', 'Màn hình LG', 300.00, 8, 'Màn hình 24 inch Full HD', 'Available');

CREATE UNIQUE INDEX idx_product_code ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);

CREATE VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

SELECT * FROM view_products;

ALTER VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

DROP VIEW view_products;

DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;

CALL GetAllProducts();

DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //

DELIMITER ;

CALL AddProduct('P006', 'Tai nghe Sony', 85.00, 20, 'Tai nghe chống ồn', 'Available');

DELIMITER //

CREATE PROCEDURE UpdateProductById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_description,
        productStatus = p_status
    WHERE Id = p_id;
END //

DELIMITER ;

CALL UpdateProductById(3, 'Chuột Logitech M590', 30.00, 40, 'Chuột không dây yên tĩnh', 'Available');

DELIMITER //

CREATE PROCEDURE DeleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //

DELIMITER ;

CALL DeleteProductById(5);

