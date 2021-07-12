CREATE DATABASE bai3_thuc_hanh_3;

SELECT STATUS, COUNT(*) AS 'So luong status'
FROM classicmodels.orders
GROUP BY STATUS;

SELECT STATUS, SUM(quantityOrdered * priceEach) AS amount
FROM classicmodels.orders 
INNER JOIN orderdetails ON orders.ordernumber = orderdetails.ordernumber
GROUP BY STATUS;

SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total
FROM classicmodels.orderdetails
GROUP BY orderNumber;

SELECT YEAR(orderDate) AS year, sum(quantityOrdered * priceEach) AS total
FROM classicmodels.orders 
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE status = 'shipped'
GROUP BY year
HAVING year > 2003;

