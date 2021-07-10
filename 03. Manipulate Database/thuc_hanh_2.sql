CREATE DATABASE bai3_thuc_hanh2;

SELECT customers.customerNumber, customerName, phone, paymentDate, amount
FROM classicmodels.customers
INNER JOIN classicmodels.payments
ON classicmodels.customers.customerNumber = classicmodels.payments.customerNumber
WHERE city = 'Las Vegas';

SELECT customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
FROM classicmodels.customers
LEFT JOIN classicmodels.orders
ON classicmodels.customers.customerNumber = classicmodels.orders.customerNumber;

SELECT customers.customerNumber, customerName, orderNumber, status
FROM classicmodels.customers 
LEFT JOIN classicmodels.orders
ON classicmodels.customers.customerNumber = classicmodels.orders.customerNumber
WHERE orderNumber IS NULL