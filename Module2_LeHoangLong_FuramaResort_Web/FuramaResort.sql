CREATE DATABASE FuramaResort;

USE FuramaResort;

CREATE TABLE position (
    position_id INT NOT NULL,
    position_name VARCHAR(45),
    PRIMARY KEY (position_id)
);

CREATE TABLE education_degree (
    education_degree_id INT NOT NULL,
    education_degree_name VARCHAR(45),
    PRIMARY KEY (education_degree_id)
);

CREATE TABLE division (
    division_id INT NOT NULL,
    division_name VARCHAR(45),
    PRIMARY KEY (division_id)
);

CREATE TABLE role (
    role_id INT NOT NULL,
    role_name VARCHAR(255),
    PRIMARY KEY (role_id)
);

CREATE TABLE user (
    username VARCHAR(255),
    password VARCHAR(255),
    PRIMARY KEY (username)
);

CREATE TABLE user_role (
    role_id INT NOT NULL,
    username VARCHAR(255),
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES role (role_id),
    CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES user (username)
);

CREATE TABLE employee (
    employee_id INT NOT NULL,
    employee_name VARCHAR(45) NOT NULL,
    employee_birthday DATE NOT NULL,
    employee_id_card VARCHAR(45) NOT NULL,
    employee_salary DOUBLE NOT NULL,
    employee_phone VARCHAR(45) NOT NULL,
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    username VARCHAR(255),
    PRIMARY KEY (employee_id),
    CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES position (position_id),
    CONSTRAINT fk_education_degree_id FOREIGN KEY (education_degree_id) REFERENCES education_degree (education_degree_id),
    CONSTRAINT fk_division_id FOREIGN KEY (division_id) REFERENCES division (division_id),
    CONSTRAINT fk_username_employee FOREIGN KEY (username) REFERENCES user (username)
);

CREATE TABLE customer_type (
    customer_type_id INT NOT NULL,
    customer_type_name VARCHAR(45),
    PRIMARY KEY (customer_type_id)
);

CREATE TABLE customer (
    customer_id INT NOT NULL,
    customer_type_id INT NOT NULL,
    customer_name VARCHAR(45) NOT NULL,
    customer_birthday DATE NOT NULL,
    customer_gender VARCHAR(10) NOT NULL,
    customer_id_card VARCHAR(45) NOT NULL,
    customer_phone VARCHAR(45) NOT NULL,
    customer_email VARCHAR(45),
    customer_address VARCHAR(45),
    PRIMARY KEY (customer_id),
    CONSTRAINT fk_customer_type_id FOREIGN KEY (customer_type_id) REFERENCES customer_type (customer_type_id)
);

CREATE TABLE service_type (
    service_type_id INT NOT NULL,
    service_type_name VARCHAR(45),
    PRIMARY KEY (service_type_id)
);

CREATE TABLE rent_type (
    rent_type_id INT NOT NULL,
    rent_type_name VARCHAR(45),
    rent_type_cost DOUBLE,
    PRIMARY KEY (rent_type_id)
);

CREATE TABLE service (
    service_id INT NOT NULL,
    service_name VARCHAR(45) NOT NULL,
    service_area INT,
    service_cost DOUBLE NOT NULL,
    service_max_people INT,
    rent_type_id INT,
    service_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floors INT,
    PRIMARY KEY (service_id),
    CONSTRAINT fk_rent_type_id FOREIGN KEY (rent_type_id) REFERENCES rent_type (rent_type_id),
    CONSTRAINT fk_service_type_id FOREIGN KEY (service_type_id) REFERENCES service_type (service_type_id)
);

CREATE TABLE contract (
    contract_id INT NOT NULL,
    contract_start_date DATETIME NOT NULL,
    contract_end_date DATETIME NOT NULL,
    contract_total_money DOUBLE NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (contract_id),
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES  customer (customer_id),
    CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES  service (service_id)
);

CREATE TABLE attach_service (
    attach_service_id INT NOT NULL,
    attach_service_name VARCHAR(45) NOT NULL ,
    attach_service_cost DOUBLE NOT NULL,
    attach_service_unit INT NOT NULL,
    attach_service_status VARCHAR(45),
    PRIMARY KEY (attach_service_id)
);

CREATE TABLE contract_detail (
    contract_detail_id INT NOT NULL,
    contract_id INT NOT NULL,
    attach_service_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (contract_detail_id),
    CONSTRAINT fk_contract_id FOREIGN KEY (contract_id) REFERENCES contract (contract_id),
    CONSTRAINT fk_attach_service_id FOREIGN KEY (attach_service_id) REFERENCES attach_service (attach_service_id)
);

DELIMITER $$
CREATE PROCEDURE select_all_customers()
BEGIN
    SELECT * FROM customer;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_customer(
    IN id INT,
    IN type_id INT,
    IN name VARCHAR(45),
    IN birthday DATE,
    IN gender VARCHAR(10),
    IN id_card VARCHAR(45),
    IN phone VARCHAR(45),
    IN email VARCHAR(45),
    IN address VARCHAR(45))
BEGIN
    INSERT INTO customer VALUES (id, type_id, name, birthday, gender, id_card, phone, email, address);
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_customer(
    IN old_id INT,
    IN new_type_id INT,
    IN new_name VARCHAR(45),
    IN new_birthday DATE,
    IN new_gender VARCHAR(10),
    IN new_id_card VARCHAR(45),
    IN new_phone VARCHAR(45),
    IN new_email VARCHAR(45),
    IN new_address VARCHAR(45))
BEGIN
    UPDATE customer
    SET customer_type_id = new_type_id, customer_name = new_name, customer_birthday = new_birthday,
        customer_gender = new_gender, customer_id_card = new_id_card, customer_phone = new_phone,
        customer_email = new_email, customer_address = new_address
    WHERE customer_id = old_id;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_customer(IN delete_id INT)
BEGIN
    DELETE FROM customer WHERE customer_id = delete_id;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_customer_by_id(IN id INT)
BEGIN
    SELECT * FROM customer WHERE customer_id = id;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_all_employees()
BEGIN
    SELECT * FROM employee;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_employee(
    IN id INT,
    IN name VARCHAR(45),
    IN birthday DATE,
    IN id_card VARCHAR(45),
    IN salary DOUBLE,
    IN phone VARCHAR(45),
    IN email VARCHAR(45),
    IN address VARCHAR(45),
    IN id_position INT,
    IN id_education_degree INT,
    IN id_division INT,
    IN employee_username VARCHAR(255))
BEGIN
    INSERT INTO employee VALUES (id, name, birthday, id_card, salary, phone,
                             email, address, id_position, id_education_degree, id_division, employee_username);
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_employee_by_id(IN id INT)
BEGIN
    SELECT * FROM employee WHERE employee_id = id;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_employee(
    IN old_id INT,
    IN new_name VARCHAR(45),
    IN new_birthday DATE,
    IN new_id_card VARCHAR(45),
    IN new_salary DOUBLE,
    IN new_phone VARCHAR(45),
    IN new_email VARCHAR(45),
    IN new_address VARCHAR(45),
    IN new_id_position INT,
    IN new_id_education_degree INT,
    IN new_id_division INT,
    IN new_employee_username VARCHAR(255))
BEGIN
    UPDATE employee SET employee_name = new_name, employee_birthday = new_birthday, employee_id_card = new_id_card,
                        employee_salary = new_salary, employee_phone = new_phone, employee_email = new_email,
                        employee_address = new_address, position_id = new_id_position,
                        education_degree_id = new_id_education_degree, division_id = new_id_division,
                        username = new_employee_username
    WHERE employee_id = old_id;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_employee(IN id INT)
BEGIN
    DELETE FROM employee WHERE employee_id = id;
END; $$
DELIMITER ;