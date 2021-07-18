CREATE DATABASE bai5_bai_tap_demo;

USE bai5_bai_tap_demo;

CREATE TABLE products (
	ID VARCHAR(10) NOT NULL,
    productCode VARCHAR (50) NOT NULL,
    productName VARCHAR (255) NOT NULL,
    productPrice FLOAT NOT NULL,
    productAmount FLOAT NOT NULL, 
    productDescription TEXT,
    productStatus TEXT NOT NULL
);

CREATE UNIQUE INDEX idx_productCode ON products (productCode);
CREATE INDEX idx_composite ON products (productName, productPrice);

EXPLAIN SELECT * FROM products;

CREATE VIEW products_view AS
SELECT productCode, productName, productPrice, productStatus
FROM products;

CREATE OR REPLACE VIEW products_view AS
SELECT productCode, productName, productStatus
FROM products;

DROP VIEW products_view; 

-- Tao Stored Procedure lay tat ca san pham
DELIMITER //
CREATE PROCEDURE selectAllProducts()
BEGIN
	SELECT * FROM products;
END //
DELIMITER ;

-- Tao stored procedure them 1 san pham moi
DELIMITER $$
CREATE PROCEDURE addNewProducts(IN ID VARCHAR(10), IN productCode VARCHAR(50), 
	IN productName VARCHAR(255), IN productPrice FLOAT, IN productAmount FLOAT, 
    IN productDescription TEXT, IN productStatus TEXT)
BEGIN
	INSERT INTO products VALUES (ID, productCode, productName, productPrice,
    productAmount, productDescription, productStatus);
END $$
DELIMITER ;

-- Tao stored procedure sua thong tin sam pham theo id
DELIMITER //
CREATE PROCEDURE editProducts(IN ID VARCHAR(10), IN proCode VARCHAR(50), 
	IN proName VARCHAR(255), IN proPrice FLOAT, IN proAmount FLOAT, 
    IN proDescription TEXT, IN proStatus TEXT)
BEGIN
	UPDATE products
    SET productCode = proCode, productName = proName, productPrice = proPrice,
    productAmount = proAmount, productDescription = proDescription, productStatus = proStatus
    WHERE id = ID;
END //
DELIMITER ;

-- Tao stored procedure xoa san pham theo id 
DELIMITER $$
CREATE PROCEDURE deleteProducts(IN ID VARCHAR(10))
BEGIN
	DELETE FROM products
    WHERE id = ID;
END $$
DELIMITER ;