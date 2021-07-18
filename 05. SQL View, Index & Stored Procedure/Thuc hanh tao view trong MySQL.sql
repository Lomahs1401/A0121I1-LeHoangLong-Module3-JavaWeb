CREATE VIEW classicmodels.customer_view AS
SELECT customerNumber, customerName, phone
FROM classicmodels.customers;

SELECT * FROM classicmodels.customer_view;

CREATE OR REPLACE VIEW classicmodels.customer_view AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM classicmodels.customers
WHERE city = 'Nantes';

DROP VIEW customer_view;
