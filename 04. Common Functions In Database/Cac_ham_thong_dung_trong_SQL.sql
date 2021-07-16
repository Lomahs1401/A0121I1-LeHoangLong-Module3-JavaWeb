SELECT SUM(quantityOrdered)
FROM orderdetails;

SELECT AVG(buyPrice)
FROM products;

SELECT COUNT(productCode)
FROM products;

SELECT COUNT(*)
FROM products;

SELECT MAX(buyPrice) AS largestPrice
FROM products;

SELECT MIN(buyPrice) AS smallestPrice
FROM products;

SELECT UCASE(customerName) AS customer
FROM customers;

SELECT LCASE(customerName) AS customer
FROM customers;

SELECT LENGTH(addressLine1) AS lengthOfAddress
FROM customers;

SELECT productName, buyPrice, NOW() AS perDate
FROM products;

SELECT country, COUNT(customerNumber)
FROM customers
GROUP BY country;

SELECT COUNT(customerNumber) customerCount
FROM customers
GROUP BY country
ORDER BY customerNumber DESC;

SELECT COUNT(customerNumber) AS customerCount, country
FROM customers
GROUP BY country
HAVING customerNumber > 5;