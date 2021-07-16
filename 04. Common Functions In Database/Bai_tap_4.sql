CREATE DATABASE bai4_bai_tap;

CREATE TABLE bai4_bai_tap.student_corse (
	ID INT AUTO_INCREMENT,
    TEN VARCHAR(50) NOT NULL,
    TUOI INT NOT NULL,
    KHOAHOC VARCHAR(50) NOT NULL,
    SOTIEN VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO bai4_bai_tap.student_corse (TEN, TUOI, KHOAHOC, SOTIEN) VALUES 
('Hoang', '21', 'CNTT', '400000'),
('Viet', '19', 'DTVT', '320000'),
('Thanh', '18', 'KTDN', '400000'),
('Nhan', '19', 'CK', '450000'),
('Huong', '20', 'TCHH', '500000'),
('Huong', '20', 'TCHH', '300000');

SELECT * FROM bai4_bai_tap.student_corse
WHERE TEN = 'Huong';

SELECT TEN, TUOI, SUM(SOTIEN) AS 'Total'
FROM bai4_bai_tap.student_corse
WHERE TEN = 'Huong';

SELECT DISTINCT TEN FROM bai4_bai_tap.student_corse;
