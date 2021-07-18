/*
Stored Procedure (Thủ tục lưu trữ) là một đoạn SQL code được lưu trữ.
Có thể sử dụng lưu trữ đó nhìu lần, bằng cách gọi cái thủ tục lưu trữ đó ra
Về mặt ý nghĩa, nó giống như 1 hàm (function)
Stored Procedure có thể chứa tham số

Syntax Stored Procedure no parameter
CREATE PROCEDURE procedure_name ([ IN | OUT | INOUT ] parameter type)
BEGIN
sql_statement
END;

Nếu ko để IN, OUT hay INOUT thì MySQL sẽ mặc định là IN

Thực thi stored procedure = keyword CALL
*/
DELIMITER //
CREATE PROCEDURE classicmodels.selectAllCustomers()
BEGIN
	SELECT * FROM classicmodels.customers;
END;
// DELIMITER ;

CALL classicmodels.selectAllCustomers();

DELIMITER //
CREATE PROCEDURE classicmodels.findAllCustomers(City_kw NVARCHAR(30))
BEGIN
	SELECT * FROM classicmodels.customers
    WHERE city = City_kw;
END
// DELIMITER ;

CALL classicmodels.findAllCustomers('Singapore');