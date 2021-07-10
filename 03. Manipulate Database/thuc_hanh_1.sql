CREATE DATABASE bai3_thuc_hanh_1;

SELECT productCode, productName, buyPrice, MSRP
FROM classicmodels.products
WHERE buyPrice > 56.76 AND quantityInStock > 10;

SELECT productCode, productName, buyPrice, textDescription
FROM classicmodels.products
INNER JOIN classicmodels.productlines 
ON classicmodels.products.productLine = classicmodels.productlines.productLine
WHERE buyPrice > 56.76 AND buyPrice < 95.59;

SELECT productCode, productName, buyPrice, quantityInStock, productVendor, productLine
FROM classicmodels.products
WHERE productLine = 'Classic Cars' OR productVendor = 'Min Lin Diecast';