ALTER TABLE classicmodels.customers 
DROP INDEX idx_customerNumber;

ALTER TABLE classicmodels.customers 
ADD INDEX idx_customerNumber (customerNumber);

EXPLAIN SELECT * FROM classicmodels.customers
WHERE customerNumber = 175;

ALTER TABLE classicmodels.customers
ADD INDEX idx_ful_name (contactFirstName, contactLastName);

EXPLAIN SELECT * FROM classicmodels.customers
WHERE contactFirstName IN ('Jean', 'King');