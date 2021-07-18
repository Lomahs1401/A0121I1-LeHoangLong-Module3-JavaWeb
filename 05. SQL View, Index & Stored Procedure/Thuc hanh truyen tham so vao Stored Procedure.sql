/*
Trong MySQL tồn tại ba loại tham số cho Stored Procedure là IN, OUT, INOUT
+ IN: Chế độ mặc định (Nếu ko khai báo tham số thì IN là mặc định)
+ OUT: Tham số sẽ nhận giá trị từ trong thân stored procedure
. Lấy dữ liệu trong Stored Procedure và sử dụng ở bên ngoài
Truyền tham số dạng Out thì phải có kí tự @ trước tên biến
Hoạt động giống tham chiếu nên biến truyền vào dạng OUT không cần định nghĩa trước,
chính vì vậy khởi đầu nó có giá trị NULL
+ INOUT: Tương đương với tham chiếu, tức vừa gửi đc giá trị cho 
stored procedure, vừa lấy giá trị từ trong thân stored procedure
*/

-- Tham số loại IN
DELIMITER //
CREATE PROCEDURE classicmodels.getCustomerByID(IN cusNum INT)
BEGIN
	SELECT * FROM classicmodels.customers
    WHERE customerNumber = cusNum;
END //
DELIMITER ;

CALL classicmodels.getCustomerByID(175);

-- Tham số loại OUT
DELIMITER //
CREATE PROCEDURE classicmodels.GetCustomersCountByCity(IN in_city VARCHAR(50), OUT total INT)
BEGIN
	SELECT COUNT(customerNumber) INTO total
    FROM classicmodels.customers
    WHERE city = in_city;
END //
DELIMITER ;

CALL classicmodels.GetCustomersCountByCity('Lyon', @total);
SELECT @total;

-- Tham số loại INOUT
CREATE PROCEDURE classicmodels.SetCounter(INOUT counter INT, IN inc INT)
BEGIN
	SET counter = counter + inc
END //
DELIMITER ;

SET @counter = 1;
CALL classicmodels.SetCounter(@counter, 1); -- 2
CALL classicmodels.SetCounter(@counter,1); -- 3
CALL classicmodels.SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

